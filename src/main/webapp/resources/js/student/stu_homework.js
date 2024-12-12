$(function () {
    console.log("js 잘 실행됨!");

    const studentUserNo = document.getElementById("userNo").value;
    console.log("Student User No: ", studentUserNo);

    const coursesDropdown = document.getElementById("coursesDropdown");
    const homeworkContainer = document.getElementById("homeworkContainer");

    let currentPage = 1;
    const itemsPerPage = 2;

    // 강좌선택 드랍다운 특정 항목 선택으로 바뀌었을 경우;
    coursesDropdown.addEventListener("change", function () {
        const courseNo = $(this).val();

        if (!courseNo) {
            homeworkContainer.innerHTML = "<p>과제 조회를 위해서 수강중인 강좌를 먼저 선택해주세요.</p>";
            return;
        }

        // 선택된 강좌의 과제 목록을 물어옴
        $.ajax({
            url: `fetchHomework.do`,
            method: "GET",
            data: { courseNo },
            success: function (homeworkList) {
                displayHomework(homeworkList);
            },
            error: function () {
                homeworkContainer.innerHTML = "<p>과제목록 불러오기 실패. 다시 시도해주세요.</p>";
            },
        });
    });

    // 과제 목록 카드 업데이트 시 페이지와 버튼 상태 렌더링
    function displayHomework(homeworkList) {
        const totalPages = Math.ceil(homeworkList.length / itemsPerPage);
        const paginationContainer = document.getElementById("pagination");

        function renderPage(page) {
            homeworkContainer.innerHTML = ""; // Clear previous cards
            const startIndex = (page - 1) * itemsPerPage;
            const endIndex = Math.min(startIndex + itemsPerPage, homeworkList.length);

            for (let i = startIndex; i < endIndex; i++) {
                const homework = homeworkList[i];
                const submitButtonClass = homework.isSubmitted ? 'btn-success' : 'btn-warning';
                const submitButtonText = homework.isSubmitted ? '제출 완료' : '과제 제출';

                const card = `
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">${homework.hw_title}</h6>
                </div>
                <div class="card-body">
                    <p><strong>과제 등록일:</strong> ${homework.hw_startdate}</p>
                    <p><strong>과제 마감일:</strong> ${homework.hw_enddate}</p>
                    <p><strong>과제 마감 시간(24:00):</strong> ${homework.hw_endtime}</p>

                	<!-- 다른 버튼들 -->
                    <div class="d-flex justify-content-end mt-2">
                        <button 
                            class="btn btn-primary btn-sm mr-2" 
                            onclick="openPopup(
                                ${homework.hw_no}, 
                                '${homework.hw_title}', 
                                '${homework.hw_context}', 
                                '${homework.hw_startdate} ~ ${homework.hw_enddate}', 
                                '${homework.course_name}', 
                                '${homework.instructor_name}'
                            )">과제 세부사항 보기</button>
                        <button 
                            class="btn btn-info btn-sm" 
                            onclick="messageInstructor(${homework.course_instructor}, ${studentUserNo}, ${homework.hw_course}, '${homework.user_name}')">
                            강사님께 쪽지보내기
                        </button>
                    </div>

                	<!-- 파일 업로드랑 과제제출 -->
                    <div class="d-flex align-items-center file-upload-section">
                        <!-- File Upload Button -->
                        <label for="file-upload-${homework.hw_no}" class="btn btn-secondary btn-sm mr-2">파일 찾기</label>
                        <input 
                            type="file" 
                            id="file-upload-${homework.hw_no}" 
                            class="d-none" 
                            onchange="handleFileUpload(${homework.hw_no}, this)">
                        
                        <!-- 파일 경로 표시 -->
                        <input 
                            type="text" 
                            id="file-path-${homework.hw_no}" 
                            class="form-control form-control-sm flex-grow-1" 
                            placeholder="파일을 선택하세요." 
                            readonly>

                        <!-- 제출 버튼 -->
                        <button 
                            id="submit-btn-${homework.hw_no}" 
                            class="btn btn-warning btn-sm ml-2">
                            과제 제출
                        </button>
                    </div>
                </div>
            </div>
            `;
                homeworkContainer.innerHTML += card;
                updateSubmitButtonStatus(homework.hw_no, homework.hw_enddate, homework.hw_endtime);
            }// end of for
        }// end of renderPage

        function renderPagination() {
            paginationContainer.innerHTML = ""; // 기존의 Pagination 삭제

            // Pagination - "이전" 버튼
            paginationContainer.innerHTML += `
                <li class="page-item ${currentPage === 1 ? "disabled" : ""}">
                    <a class="page-link" href="#" onclick="changePage(${currentPage - 1})">Previous</a>
                </li>`;

            // Pagination - 숫자 버튼
            for (let i = 1; i <= totalPages; i++) {
                paginationContainer.innerHTML += `
                    <li class="page-item ${currentPage === i ? "active" : ""}">
                        <a class="page-link" href="#" onclick="changePage(${i})">${i}</a>
                    </li>`;
            }

            // Pagination - "다음" 버튼
            paginationContainer.innerHTML += `
                <li class="page-item ${currentPage === totalPages ? "disabled" : ""}">
                    <a class="page-link" href="#" onclick="changePage(${currentPage + 1})">Next</a>
                </li>`;
        }

        window.changePage = function (page) {
            if (page < 1 || page > totalPages) return;
            currentPage = page;
            renderPage(currentPage);
            renderPagination();
        };

        renderPage(currentPage);
        renderPagination();
    }
<<<<<<< HEAD

    // 과제 제출 버튼 업데이트 - 마감 / 제출 / 제출완료
    function updateSubmitButtonStatus(hwNo, hwEndDate, hwEndTime) {
        const submitButton = document.getElementById(`submit-btn-${hwNo}`);
        const currentTime = new Date();
        const hwDeadline = new Date(`${hwEndDate}T${hwEndTime}`);

        if (currentTime > hwDeadline) {
            submitButton.classList.remove('btn-warning');
            submitButton.classList.add('btn-danger');
            submitButton.textContent = '제출 마감';
            submitButton.disabled = true; // 마감 기한 지나면 버튼 비활성화.
        } else {
            // 과제가 이미 제출되었었는지 확인함
            $.ajax({
                url: `fetchHomeworkStatus.do`,
                method: "GET",
                data: { hwNo },
                success: function (response) {
                    if (response.isSubmitted) {
                        submitButton.classList.remove('btn-warning', 'btn-danger');
                        submitButton.classList.add('btn-success');
                        submitButton.textContent = '제출 완료';
                        submitButton.disabled = true;
                    } else {
                        submitButton.classList.remove('btn-danger', 'btn-success');
                        submitButton.classList.add('btn-warning');
                        submitButton.textContent = '과제 제출';
                        submitButton.disabled = false;
                    }
                },
                error: function () {
                    console.error(`Failed to fetch submission status for hwNo: ${hwNo}`);
                }
            });
        }
    }

// 팝업띄우기
=======

    // 과제 제출 버튼 업데이트 - 마감 / 제출 / 제출완료
    function updateSubmitButtonStatus(hwNo, hwEndDate, hwEndTime) {
        const submitButton = document.getElementById(`submit-btn-${hwNo}`);
        const currentTime = new Date();
        const hwDeadline = new Date(`${hwEndDate}T${hwEndTime}`);

        if (currentTime > hwDeadline) {
            submitButton.classList.remove('btn-warning');
            submitButton.classList.add('btn-danger');
            submitButton.textContent = '제출 마감';
            submitButton.disabled = true; // 마감 기한 지나면 버튼 비활성화.
        } else {
            // 과제가 이미 제출되었었는지 확인함
            $.ajax({
                url: `fetchHomeworkStatus.do`,
                method: "GET",
                data: { hwNo },
                success: function (response) {
                    if (response.isSubmitted) {
                        submitButton.classList.remove('btn-warning', 'btn-danger');
                        submitButton.classList.add('btn-success');
                        submitButton.textContent = '제출 완료';
                        submitButton.disabled = true;
                    } else {
                        submitButton.classList.remove('btn-danger', 'btn-success');
                        submitButton.classList.add('btn-warning');
                        submitButton.textContent = '과제 제출';
                        submitButton.disabled = false;
                    }
                },
                error: function () {
                    console.error(`Failed to fetch submission status for hwNo: ${hwNo}`);
                }
            });
        }
    }

    // 팝업띄우기
>>>>>>> 9894cfc (하승모 최종커밋)
    window.openPopup = function (hwNo) {
        console.log("Popup 과제 번호: ", { hwNo });

        $.ajax({
            url: `stu_homework_details.do`,
            method: "GET",
            data: { hwNo },
            success: function (homework) {
                console.log("Fetched Homework Data:", homework);

                // 팝업 공간 지정
                const homeworkTitle = document.getElementById("homeworkTitle");
                const dueDate = document.getElementById("dueDate");
                const courseName = document.getElementById("courseName");
                const instructorName = document.getElementById("instructorName");
                const assignmentContext = document.getElementById("assignmentContext");
                
                homeworkTitle.innerText = homework.hw_title || "N/A";
                dueDate.value = (homework.hw_startdate && homework.hw_enddate) 
                        ? `${homework.hw_startdate} ~ ${homework.hw_enddate} ${homework.hw_endtime || ""}` 
                        : "N/A";
                courseName.value = homework.course_name || "N/A";
                instructorName.value = homework.user_name || "N/A";
                assignmentContext.value = homework.hw_context || "N/A";
                
                // 오버레이와 팝업 보이게 하기
                const overlay = document.getElementById("overlay");
                const popup = document.getElementById("popup");
                overlay.style.display = "block";
                popup.style.display = "block";
            },
            error: function () {
                alert("Failed to fetch homework details. Please try again.");
            },
        }); // end of ajax
    }; // end of openPopup

    
    // 팝업 닫기 기능 - overlay 에 달아줌.
    const overlay = document.getElementById("overlay");
    overlay.addEventListener("click", function (e) {
        if (e.target === overlay) { // Ensure only overlay click triggers the close
            closePopup();
        }
    });
    
    
    // 팝업 닫기 기능
    window.closePopup = function () {
        console.log("팝업 닫기 호출!");
        const overlay = document.getElementById("overlay");
        const popup = document.getElementById("popup");

        if (overlay) overlay.style.display = "none";
        if (popup) popup.style.display = "none";
    };

    
    // "강사님께 쪽지보내기"
    window.messageInstructor = function (courseInstructor, studentUserNo, courseNo, instructorName ) {
        if ( !studentUserNo || !courseInstructor || !courseNo || !instructorName ) {
        	console.error("Missing parameters for messageInstructor:", { studentUserNo, courseInstructor, courseNo, instructorName });
            alert("messageInstructor에 들어갈 파라미터 누락!");
            return;
        }
        console.log("Message Instructor Parameters: ", { studentUserNo, courseInstructor, courseNo, instructorName });
        alert(`쪽지보내기\n학생 번호: ${studentUserNo}\n강좌 번호: ${courseNo}\n강사 번호: ${courseInstructor}\n강사 이름: ${instructorName}`);
        
        // 쿼리문 구축;
        const queryString = `?studentUserNo=${studentUserNo}&courseInstructor=${courseInstructor}&courseNo=${courseNo}&instructorName=${encodeURIComponent(instructorName)}`;
        
        // comm_insertMessage.jsp 에 파라미터 넘김 
        window.location.href = `/comm_insertMessage.do${queryString}`;
        
    };// end of messageInstructor

    
    // 파일 업로드 핸들링
    window.handleFileUpload = function(hwNo, inputElement) {
        console.log(`handleFileUpload called for hwNo: ${hwNo}`);
        const filePathInput = document.getElementById(`file-path-${hwNo}`); // 파일 경로 넣을 input box.
        const submitButton = document.getElementById(`submit-btn-${hwNo}`); // 과제 제출 버튼

        if (!filePathInput || !submitButton) {
            console.error(`File path input or submit button not found for hwNo: ${hwNo}`);
            return; // 요소 안 들어오면 실행 안 됨.
        }

        if (inputElement.files && inputElement.files.length > 0) {
            const fileName = inputElement.files[0].name; // 선택된 파일 이름 가져옴.
            filePathInput.value = fileName; // input box에 파일 이름 보여줌. 

            // 제출 버튼 활성화.
            submitButton.classList.remove('btn-success');
            submitButton.classList.add('btn-warning');
            submitButton.textContent = '과제 제출';
            submitButton.disabled = false;

            // 제출에 event listener 붙여주기
            submitButton.onclick = function () {
                submitHomework(hwNo, inputElement.files[0]); // 제출(DB에다가 파일 저장...)을 위해 파일 넘겨줌
            };
        } else {
            // 아무 파일도 선택 안 되었을 경우 - 파일 경로 인풋이랑 버튼 리셋해줌.
            filePathInput.value = '';
            submitButton.classList.remove('btn-success');
            submitButton.classList.add('btn-warning');
            submitButton.textContent = '과제 제출';
            submitButton.disabled = true;
        }// end of if-else
    }// end of handleFileUpload
    
    
    // 과제 제출 버튼 업데이트 - 마감 / 제출 / 과제 제출 완료
    function updateSubmitButtonStatus(hwNo, hwEndDate, hwEndTime) {
        const submitButton = document.getElementById(`submit-btn-${hwNo}`);
        const currentTime = new Date();
        const hwDeadline = new Date(`${hwEndDate}T${hwEndTime}`);

        if (currentTime > hwDeadline) {
            submitButton.classList.remove('btn-warning');
            submitButton.classList.add('btn-danger');
            submitButton.textContent = '제출 마감';
            submitButton.disabled = true; // 마감 기한 지나면 버튼 비활성화.
        }else {
            // Check if the homework is already submitted
            $.ajax({
                url: `fetchHomeworkStatus.do`,
                method: "GET",
                data: { hwNo },
                success: function (response) {
                    if (response.isSubmitted) {
                        // 마감 지나고 과제 제출 기록 DB에 있을시;
                    	submitButton.classList.remove('btn-warning', 'btn-danger');
                        submitButton.classList.add('btn-success');
                        submitButton.textContent = '제출 완료';
                        submitButton.disabled = true;
                    } else {
                        // 과제 제출 안됨, 데드라인 아직 안 넘었을 적에...
                        submitButton.classList.remove('btn-danger', 'btn-success');
                        submitButton.classList.add('btn-warning');
                        submitButton.textContent = '과제 제출';
                        submitButton.disabled = false;
                    }
                },
                error: function () {
                    console.error(`Failed to fetch submission status for hwNo: ${hwNo}`);
                }
            });
        }// end of if
    }// end of updateSubmitButtonStatus
    
    
    function handleSubmission(hwNo) {
        // Handle file upload and submission here
        alert(`Submit homework for hwNo: ${hwNo}`);
        
        const submitButton = document.getElementById(`submit-btn-${hwNo}`);
        submitButton.classList.remove('btn-warning');
        submitButton.classList.add('btn-success');
        submitButton.textContent = '제출 완료';
        submitButton.disabled = true;
    }// end of handleSubmission
    
    
    // "과제 제출하기"
    function submitHomework(hwNo, file) {
        const formData = new FormData();
        const studentUserNo = document.getElementById("userNo").value;

        console.log("js submitHomweork function - hw_no : " + hwNo + " user_no : " + studentUserNo + " file : " + file);
        console.log("Debug: Submit Homework Triggered");
        console.log(`hwNo: ${hwNo}, file: ${file.name}`);
        
        formData.append("hw_no", hwNo);
        formData.append("user_no", studentUserNo);
        formData.append("file", file);
        
        console.log("FormData entries:");
        for (let pair of formData.entries()) {
            console.log(pair[0] + ": " + pair[1]);
        }
        
        fetch("submitHomework.do", {
            method: "POST",
            body: formData,
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert(data.message || "Homework submitted successfully.");
                    updateSubmitButtonStatus(hwNo); // 버튼 UI 업뎃.
                } else {
                    alert("Submission failed: " + data.message);
                }
            })
            .catch(error => {
                console.error("Error:", error);
                alert("submitHomework 에러! 재시도 부탁드립니다.");
            });
    };// end of submitHomework
  
    // DOMContentLoaded 이벤트에 상태 업데이트 호출
    document.addEventListener('DOMContentLoaded', () => {
        if (homeworkList && homeworkList.length > 0) {
            homeworkList.forEach(homework => {
                updateSubmitButtonStatus(homework.hw_no, homework.hw_enddate, homework.hw_endtime);
            });
        }
    });
});
