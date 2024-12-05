$(function () {
    let attendanceRecords = [];
    let currentPage = 0;
    const itemsPerPage = 10;

    // Fetch ongoing courses for the dropdown
    function fetchOngoingCourses(userNo) {
        $.ajax({
            type: "GET",
            url: "/student/fetchOngoingCourses",
            data: { userNo },
            success: function (response) {
                const dropdown = $("#courseDropdown");
                dropdown.empty();
                dropdown.append('<option value="">강좌 선택</option>');
                response.forEach(course => {
                    dropdown.append(`<option value="${course.course_no}">${course.course_name}</option>`);
                });
            },
            error: function (error) {
                console.error("Error fetching courses:", error);
                alert("수강중인 강좌 목록을 불러오는 데 실패했습니다.");
            }
        });
    }

    // Load attendance records and render the first page
    function loadAttendances(userNo, courseNo = null, startDate = null, endDate = null) {
        const requestData = {
            userNo,
            courseNo,
            startDate: startDate || undefined,
            endDate: endDate || undefined
        };

        $.ajax({
            type: "GET",
            url: "/records",
            data: requestData,
            success: function (response) {
                console.log("Attendance Records:", response);
                attendanceRecords = response; // Update the attendance records
                renderFilteredAttendances(0); // Render the first page
                renderPagination(attendanceRecords.length); // Render pagination buttons
            },
            error: function (error) {
                console.error("Error fetching attendance records:", error);
                alert("출석 정보를 불러오는 데 실패했습니다.");
            }
        });
    }

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
        });
    }

    // Render attendance records for the current page
    function renderFilteredAttendances(page) {
        const start = page * itemsPerPage;
        const end = start + itemsPerPage;
        const recordsToShow = attendanceRecords.slice(start, end);

        const attendanceList = $("#attendance-list");
        attendanceList.empty();

        if (recordsToShow.length === 0) {
            attendanceList.html("<p>출석 기록이 없습니다.</p>");
            return;
        }

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
            }
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
    }

    // Event listeners for filtering and pagination
    $("#courseDropdown").on("change", function () {
        const courseNo = $(this).val();
        const userNo = $("#userNo").val();
        loadAttendances(userNo, courseNo, $("#startDate").val(), $("#endDate").val());
    });

    $("#startDate").on("change", function () {
        const startDate = $(this).val();
        const endDate = $("#endDate").val();
        const userNo = $("#userNo").val();
        const courseNo = $("#courseDropdown").val();
        loadAttendances(userNo, courseNo, startDate, endDate);
    });

    $("#endDate").on("change", function () {
        const endDate = $(this).val();
        const startDate = $("#startDate").val();
        const userNo = $("#userNo").val();
        const courseNo = $("#courseDropdown").val();
        loadAttendances(userNo, courseNo, startDate, endDate);
    });

    $("#filterButton").on("click", function () {
        const startDate = $("#startDate").val();
        const endDate = $("#endDate").val();
        const userNo = $("#userNo").val();
        const courseNo = $("#courseDropdown").val();
        loadAttendances(userNo, courseNo, startDate, endDate);
    });

    // Initial page load
    $(document).ready(() => {
        const userNo = $("#userNo").val();
        if (userNo) {
            fetchOngoingCourses(userNo);
            loadAttendances(userNo);
        } else {
            console.error("회원번호를 인지하지 못했습니다! userNo is missing!");
        }
    });
});
