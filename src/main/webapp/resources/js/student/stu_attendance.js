$(function () {
    let attendanceRecords = [];
    let currentPage = 0;
    const itemsPerPage = 10;

    
    // 드랍다운을 위한 수강중인 강좌목록 불러옴
    function fetchOngoingCourses(userNo) {
        $.ajax({
            type: "GET",
            url: "/student/fetchOngoingCourses",
            data: { userNo },
            success: function (response) {
            	console.log("/fetchOngoingCOurses response: "+response);
                const tblDropdown = $("#tblCourseDropdown");
                const attDropdown = $("#attCourseDropdown");
                tblDropdown.empty();
                attDropdown.empty();
                tblDropdown.append('<option value="">강좌 선택</option>');
                attDropdown.append('<option value="">강좌 선택</option>');
                response.forEach(course => {
                   tblDropdown.append(`<option value="${course.course_no}">${course.course_name}</option>`);
                   attDropdown.append(`<option value="${course.course_no}">${course.course_name}</option>`);
                });
            },
            error: function (error) {
                console.error("Error fetching courses:", error);
                alert("[fetchOngoingCourses] 전체 출석부를 불러옵니다!");
            }
        }); // end of ajax
    }// end of fetchOngoingCourses

    
    // 출결기록 불러와서 첫 페이지 로딩.
    function loadAttendances(userNo, courseNo, startDate, endDate) {
        const requestData = {
            userNo,
            courseNo,
            startDate: startDate || undefined,
            endDate: endDate || undefined
        };

        console.log("Request Data Sent: ", requestData);
        
        $.ajax({
            type: "GET",
            url: "/records",
            data: requestData,
            success: function (response) {
                console.log("Attendance Records:", response);
                attendanceRecords = response; // 출결기록 업뎃.
                renderFilteredAttendances(0); // 첫 화면 렌더링.
                renderPagination(attendanceRecords.length); // pagination 버튼 렌더링.
            },
            error: function (error) {
                console.error("Error fetching attendance records:", error);
                alert("출석 정보를 불러오는 데 실패했습니다.");
            }
        });// end of ajax
    }// end of loadAttendances

    // Pagination 버튼 만드는 메소드.
    function renderPagination(totalRecords) {
        const totalPages = Math.ceil(totalRecords / itemsPerPage);
        const pagination = $("#pagination");
        pagination.empty();

        if (totalPages <= 1) return; // 페이지 하나만 있으면 페이지네이션 필요 없으니...
        
        //'이전' 버튼
        pagination.append(`
                <li class="paginate_button page-item previous ${currentPage === 0 ? 'disabled' : ''}" id="dataTable_previous">
                    <a href="#" class="page-link" data-page="${currentPage - 1}">Previous</a>
                </li>
            `);
        
        //페이지 번호 버튼들.
        for (let i = 0; i < totalPages; i++) {
            pagination.append(`
                <li class="paginate_button page-item ${i === currentPage ? 'active' : ''}">
                    <a href="#" class="page-link" data-page="${i}">${i + 1}</a>
                </li>
            `);
        }

        // '다음' 페이지 버튼.
        pagination.append(`
                <li class="paginate_button page-item next ${currentPage === totalPages - 1 ? 'disabled' : ''}" id="dataTable_next">
                    <a href="#" class="page-link" data-page="${currentPage + 1}">Next</a>
        		</li>
            `);
        
        // Pagination 버튼들에 클릭 이벤트.
        $("#pagination").on("click", ".page-link", function (e) {
            e.preventDefault();
            const page = parseInt($(this).data("page"),10);
            
            // 비활성화된 버튼들 클릭시 작동하지 말게끔 잡아놓음;
            if (page < 0 || page >= Math.ceil(attendanceRecords.length / itemsPerPage)) return;
            
            currentPage = page;
            renderFilteredAttendances(page);
            renderFilteredAttendances(page); // 선택한 페이지에 table content 업데이트 하기.
            renderPagination(attendanceRecords.length); // Pagination 버튼 만듦.
        });// end of pagination
    }// end of renderPagination

    // 현재 페이지를 위한 출결기록 렌더링.
    function renderFilteredAttendances(page) {
        const start = page * itemsPerPage;
        const end = start + itemsPerPage;
        const recordsToShow = attendanceRecords.slice(start, end);

        const attendanceList = $("#attendance-list");
        attendanceList.empty();

        if (recordsToShow.length === 0) {
            attendanceList.html("<p>출석 기록이 없습니다.</p>");
            return;
        }// end of if

        const tableHeader = `
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>출석일시</th>
                        <th>강의명</th>
                        <th>담당 강사</th>
                        <th>출석 상태</th>
                    </tr>
                </thead>
                <tbody>
        `;

        const tableRows = recordsToShow.map(record => {
            let statusColorClass = "";
            switch (record.attendance_status) {
                case "출결": statusColorClass = "text-success"; break;
                case "결석": statusColorClass = "text-danger"; break;
                case "병가": statusColorClass = "text-info"; break;
                case "지각": statusColorClass = "text-warning"; break;
                default: statusColorClass = "text-secondary"; break;
            }// switch case - 출석/결석/병결/지각/ default = 조퇴
            return `
                <tr>
                    <td>${record.attendance_date}</td>
                    <td>${record.course_name}</td>
                    <td>${record.course_instructor}</td>
                    <td class="${statusColorClass}">${record.attendance_status || "정보 없음"}</td>
                </tr>
            `;
        }).join('');

        const tableFooter = `
                </tbody>
            </table>
        `;

        attendanceList.html(tableHeader + tableRows + tableFooter);
    }// end of renderFilteredAttendances

    
    // 필터링이랑 pagination을 위한 버튼.
    $("#tblCourseDropdown").on("change", function () {
        const courseNo = $(this).val();
        const userNo = $("#userNo").val();
        const startDate = $("#startDate").val();
        const endDate = $("#endDate").val();
        loadAttendances(userNo, courseNo, startDate, endDate);
    });// end of tblCourseDropdown

    
    $("#startDate").on("change", function () {
        const startDate = $(this).val();
        const endDate = $("#endDate").val();
        const userNo = $("#userNo").val();
        const courseNo = $("#tblCourseDropdown").val();
        loadAttendances(userNo, courseNo, startDate, endDate);
    });// end of startDate

    
    $("#endDate").on("change", function () {
        const endDate = $(this).val();
        const startDate = $("#startDate").val();
        const userNo = $("#userNo").val();
        const courseNo = $("#tblCourseDropdown").val();
        loadAttendances(userNo, courseNo, startDate, endDate);
    });// end of endDate

    
    function validateAttendance(userNo, courseNo, callback) {
    	console.log("js) validateAttendance called with userNo:", userNo, "courseNo:", courseNo);
        $.ajax({
            type: "GET",
            url: "/validateAttendance",
            data: { userNo, courseNo },
            success: function (response) {
            	console.log("Validation Response:", response);
                if (response.status === "success") {
                    callback(response);
                } else {
                	console.log("Unexpected response:", response);
                    alert("[validateAttendance] 강의 출석날이 아닙니다!");
                }
            },
            error: function (error) {
                console.error("Error validating attendance:", error);
                alert("Error validating attendance.");
            }
        }); // end of ajax
    }// end of validateAttendance
   
    
    let isSubmitting = false; //여러 번 누르는 거 막아놓음...
    
    
    // '출석' 버튼 누를 시에 출결기록 insert
    $("#attendedButton").click(function () {
    	console.log("attendedButton Dropdown value: ", $(this).val());
    	
        const userNo = $("#userNo").val();
        const courseNo = $("#attCourseDropdown").val();
        
        console.log("UserNo: ", userNo, " CourseNo: ", courseNo);

        if (!courseNo || !userNo) { // 강좌번호나 유저번호 안 들어오면 안됨.
            alert("강좌를 선택하고 로그인 상태를 확인해주세요.");
            isSubmitting = false;
            return;
        }// end of if

        validateAttendance(userNo, courseNo, function (validation) {
            const now = new Date();
            const currentTime = now.getHours() * 60 + now.getMinutes();
            const courseStartTime = parseTime(validation.courseStartTime);

            let attendanceStatus = 1; // 기본 - "출석"
            if (currentTime > courseStartTime) {
                attendanceStatus = 3; // "지각"
            }

            $.ajax({
                type: "POST",
                url: "/markAttendance",
                data: { userNo, courseNo, attendanceStatus },
                success: function (response) {
                    if (response === "successMarkAttendance") {
                        alert("출석 성공");
                    } else if (response === "markedLate") {
                        alert("지각으로 기록되었습니다.");
                    } else {
                        alert("출석 실패: " + response);
                    }
                },
                error: function (error) {
                    console.error("Error marking attendance:", error);
                    alert("출석 실패. 서버 오류.");

                }
            });// end of ajax
        }); // end of validateAttendance
    }); // end of attendance button onclick

    
    // '조퇴' 버튼 누를 시에 출결기록 update ( 1 -> 3 )
    $("#prematureLeaveButton").on("click", function () {
        const userNo = $("#userNo").val();
        const courseNo = $("#attCourseDropdown").val();

        if (!courseNo) {
            alert("강좌를 선택해주세요.");
            return;
        }

        validateAttendance(userNo, courseNo, function (validation) {
            if (validation.alreadyLeftEarly) {
                alert("오늘 이미 조퇴했습니다!");
                return;
            }

            const now = new Date();
            const currentTime = now.getHours() * 60 + now.getMinutes();
            const courseStartTime = parseTime(validation.courseStartTime);
            const courseEndTime = parseTime(validation.courseEndTime);
            if (currentTime < courseStartTime || currentTime > courseEndTime) {
                alert("해당 강의 시간이 아닙니다. 조퇴할 수 없습니다.");
                return;
            }
            
            // 강의시간일 경우, 정말 조퇴할것인지 한 번 묻는 창 띄워줌.
            const confirmLeave = confirm("정말 조퇴하시겠습니까?");
            if (!confirmLeave) {
                return; // 사용자[학생]이 취소 누르면 암것도 안함.
            }// end of confirmLeave

            // 조퇴기록 DB 저장
            $.ajax({
                url: 'markEarlyLeave',
                type: 'POST',
                data: { courseNo },
                success: function (response) {
                    if (response === 'successMarkEarlyLeave') {
                        alert('조퇴 처리되었습니다.');
                    } else {
                        alert(response);
                    }
                },
                error: function () {
                    alert('조퇴 처리 중 오류가 발생했습니다.');
                },
            }); // end of ajax
        }); // end of validateAttendance
    }); // end of prematureLeaveButton
    

    // HH24:MI 형식의 시간을 분 단위로 환산하는 기능.
    function parseTime(timeStr) {
        const [hours, minutes] = timeStr.split(":").map(Number);
        return hours * 60 + minutes;
    }// end of parseTime

    
    // 시간에 맞지 않는 경우 출석(강의 시작 30분 전), 조퇴(강의) 버튼 비활성화
    $("#attCourseDropdown").on("change", function () {
    	const courseNo = $(this).val();
        const userNo = $("#userNo").val();

        if (!courseNo) {
            $("#attendedButton").prop("disabled", true);
            $("#prematureLeaveButton").prop("disabled", true);
            return;
        }// end of if

        validateAttendance(userNo, courseNo, function (validation) {
            const now = new Date();
            const currentDay = now.toLocaleString("ko-KR", { weekday: "long" });
            const currentTime = now.getHours() * 60 + now.getMinutes();
            const courseStartTime = parseTime(validation.courseStartTime);
            const courseEndTime = parseTime(validation.courseEndTime);
            const courseDayOfWeek = validation.courseDayOfWeek;

            console.log("Today:", currentDay, "Course Day:", courseDayOfWeek);

            const isCorrectDay = currentDay === courseDayOfWeek;
            const canAttend =
                isCorrectDay &&
                currentTime >= courseStartTime - 30 &&
                currentTime <= courseStartTime &&
                !validation.alreadyAttended;
            const canLeaveEarly =
                isCorrectDay &&
                currentTime > courseStartTime &&
                currentTime <= courseEndTime &&
                !validation.alreadyLeftEarly;

            $("#attendedButton").prop("disabled", !canAttend);
            $("#prematureLeaveButton").prop("disabled", !canLeaveEarly);
        });// end of validateAttendance
    }); // end of parseTime

    // 초기 페이지 로딩
    $(document).ready(() => {
        const userNo = $("#userNo").val();
        if (userNo) {
            fetchOngoingCourses(userNo);
            loadAttendances(userNo);
        } else {
            console.error("회원번호를 인지하지 못했습니다! userNo is missing!");
        }
    });// end of document.ready
});// end of function
