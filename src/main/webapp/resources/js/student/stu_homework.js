$(function () {
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
        }); // end of ajax
    }); // coursesDropdown.addEventListener

    function displayHomework(homeworkList) {
        const totalPages = Math.ceil(homeworkList.length / itemsPerPage);
        const paginationContainer = document.getElementById("pagination");

        function renderPage(page) {
            homeworkContainer.innerHTML = ""; // Clear previous cards
            const startIndex = (page - 1) * itemsPerPage;
            const endIndex = Math.min(startIndex + itemsPerPage, homeworkList.length);

            // Render cards for the current page
            for (let i = startIndex; i < endIndex; i++) {
                const homework = homeworkList[i];
                const card = `
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">${homework.hw_title}</h6>
                    </div>
                    <div class="card-body">
                        <p><strong>과제 등록일: </strong> ${homework.hw_startdate}</p>
                        <p><strong>과제 마감일: </strong> ${homework.hw_enddate}</p>
                        <p><strong>과제 마감 시간(24:00): </strong> ${homework.hw_endtime}</p>
                        <div class="d-flex justify-content-end">
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
                				class="btn btn-info btn-sm mr-2" 
                				onclick="messageInstructor(${homework.course_instructor}, ${studentUserNo}, ${homework.hw_course}, '${homework.user_name}')">강사님께 쪽지보내기</button>
                            <button class="btn btn-warning btn-sm mr-2" onclick="submitHomework(${homework.hw_no}); return false;">과제 제출하기</button>
                        </div>
                    </div>
                </div>
                `;
                homeworkContainer.innerHTML += card;
            } // end of for
        } // end of renderPage

        function renderPagination() {
            paginationContainer.innerHTML = ""; // Clear previous pagination

            // Pagination - "이전" 버튼
            paginationContainer.innerHTML += `
                <li class="page-item ${currentPage === 1 ? "disabled" : ""}">
                    <a class="page-link" href="#" onclick="changePage(${currentPage - 1})">Previous</a>
                </li>
            `;

            // Pagination - 숫자 버튼
            for (let i = 1; i <= totalPages; i++) {
                paginationContainer.innerHTML += `
                    <li class="page-item ${currentPage === i ? "active" : ""}">
                        <a class="page-link" href="#" onclick="changePage(${i})">${i}</a>
                    </li>
                `;
            } // end of 숫자 버튼

            // Pagination - "다음" 버튼
            paginationContainer.innerHTML += `
                <li class="page-item ${currentPage === totalPages ? "disabled" : ""}">
                    <a class="page-link" href="#" onclick="changePage(${currentPage + 1})">Next</a>
                </li>
            `;
        }

        window.changePage = function (page) {
            if (page < 1 || page > totalPages) return;
            currentPage = page;
            renderPage(currentPage);
            renderPagination();
        };

        renderPage(currentPage);
        renderPagination();
    }// end of displayHomework

    // 팝업띄우기
    window.openPopup = function (hwNo) {
        console.log("Popup 과제 번호: ", { hwNo });

        $.ajax({
            url: `stu_homework_details.do`,
            method: "GET",
            data: { hwNo },
            success: function (homework) {
                console.log("Fetched Homework Data:", homework);

                // Populate popup fields
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
                
                // Show overlay and popup
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
        window.location.href = `common/comm_insertMessage.jsp${queryString}`;
        
    };// end of messageInstructor

    // "과제 제출하기"
    window.submitHomework = function (hwNo) {
        alert(`과제 제출하기 ID: ${hwNo}`);
    };// end of submitHomework
});
