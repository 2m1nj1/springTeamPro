$(function () {
    console.log("jQuery!");
    
    // 변수 전역으로 선언
    var ctx = document.getElementById('scoreTrendChart').getContext('2d');
    console.log("ctx 확인: ", ctx);
    var scoreTrendChart;

    
    // Event Listeners
    $("#yearsDropdown").on("change", function () {
        const selectedYear = $(this).val();
        const userNo = $("#userNo").val();

        if (selectedYear) {
            console.log(`Selected Year: ${selectedYear}`);
            fetchGradeDataForYear(userNo, selectedYear); // 연도 필터있는 fetchGradeDataForYear 호출.
        } else {
            alert("시험 응시 연도를 먼저 선택해주세요!.");
        }
    }); // end of event Listeners

    
    // 페이지 로딩시 fetchExamYears 실행.
    $(document).ready(function () {
        const userNo = $("#userNo").val();
        fetchExamYears(userNo); // 페이지 로딩시 드랍다운으로 years 정보 가져옴.
    }); // end of trigger fetchExamYears
    
    // 드랍다운 아이템에 연도 가져와야지...
    function fetchExamYears(userNo) {
        $.ajax({
            type: "GET",
            url: "fetchExamYears", // Backend endpoint
            data: { userNo: userNo },
            success: function (response) {
                console.log("fetchExamYears:", response);

                // Populate dropdown
                const dropdown = $("#yearsDropdown");
                dropdown.empty();
                dropdown.append('<option value="">응시 년도 선택</option>'); // 기본 옵션

                response.forEach(year => {
                    dropdown.append(`<option value="${year}">${year}</option>`);
                });
            },
            error: function (error) {
                console.error("Error fetching exam years:", error);
                alert("시험 응시 연도 불러오기를 실패했습니다.");
            }
        });
    }
    
    
    // 드랍다운 아이템에 연도 가져와야지...
    function fetchGradeDataForYear(userNo, selectedYear) {
        $.ajax({
        	url: "fetchGradeAndExams",
            type: "GET",
            data: { userNo: userNo, year: selectedYear }, // 선택한 연도 파라미터값으로 넘겨줌.
            success: function (response) {
                console.log("fetchGradeDataForYear:", response);

                // 표랑 차트 업데이트
                if (response.gradeList && response.gradeList.length > 0) {
	                updateGradeTable(response.examList);
	                updateGradeChart(response.examList);
	                
	                // hide -> show로.
	                $("#gradeTableContainer").show(); // tbl
	                $("#chartContainer").show(); // chart
                } else {
                	console.log("examList data 가 fetchGradeDataForYear로 안 넘어옴.");
                    alert("선택된 연도에 대한 데이터가 없습니다.");
                    $("#gradeTableContainer").hide(); // Hide table if no data
                    $("#chartContainer").hide(); // Hide chart if no data
                }
            },
            error: function (error) {
                console.error("js fetchGradeDataForYear error - 해당 연도에 대한 시험 정보 불러오기 실패;", error);
            }
        });
    } // end of fetchExamYears(userNo)
    
    
    // 데이터 가져오기 - ajax
    function fetchGradeData(userNo) {
        console.log("fetchGradeData 호출됨, userNo: ", userNo);

        $.ajax({
            url: "fetchGradeAndExams", // Backend endpoint - controller 에서 지칭된 request mapping 과 같아야.
            type: "GET",
            data: { userNo: userNo },
            success: function (response) {
            	console.log("ResponseData: ", response);
            	
                // 테이블 업데이트
            	if(response.gradeList) {
            		updateGradeTable(response.gradeList);
            	}else {
            		console.log("updateGradeTable 실패!");
            	}

                // 차트 업데이트             
                if(response.gradeList) {
                	updateGradeChart(response.gradeList);
            	}else {
            		console.log("updateGradeChart 실패!");
            	}
            },
            error: function (error) {
                console.error("fetchGradeData Failed: ", error);
            },
        }); // end of ajax
    }// end of 데이터 가져오기 function

    
    // 테이블 업데이트
    function updateGradeTable(examList) {
        console.log("updateGradeTable 실행");

        let tableBody = $("#gradeTable tbody");
        tableBody.empty(); // 기존 데이터 초기화

        if (!examList || examList.length === 0) {
        	console.log("GradeTable 업데이트 할 examList 없음.");
            tableBody.append('<tr><td colspan="6">선택된 연도에 대하여 기입된 성적 데이터가 없습니다. </br> 다른 연도를 선택하거나 하단의 성적 입력 버튼을 통해 성적을 입력해 주세요.</td></tr>');
            return;
        }
        
        examList.forEach(function (grade) {
        	console.log("table update grade.original_score", grade.original_score);
            tableBody.append(`
                <tr>
                    <td>${grade.exam_no}</td>
                    <td>${grade.exam_name}</td>
                    <td>${grade.user_name}</td>
                    <td>${grade.original_score}</td>
                    <td>${grade.exam_date}</td>
                    <td>
                        <a href="stu_grade_details.do?exam_no=${grade.exam_no}&userNo=${grade.user_no}" class="btn btn-info btn-sm">상세 보기</a>
                    </td>
                </tr>`
            );
        });
        console.log("Table updated with examList: ", examList);
    }
    
    
    // 차트 업데이트 함수
    function updateGradeChart(examList) {
        console.log("updateGradeChart 실행");
        
        if ( !examList || examList.length === 0) {
            console.log("GradeChatrt 업데이트 할 데이터 없음.");
            if (scoreTrendChart) scoreTrendChart.destroy(); // 데이터 없으면 차트 비움;
            return;
        }

        var labels = examList.map((grade) => grade.exam_date);
        var scores = examList.map((grade) => grade.original_score);
        
        console.log("차트 label: ", labels);
        console.log("차트 scores: ", scores);

        if (scoreTrendChart) {
        	scoreTrendChart.destroy(); // 기존 차트를 제거
        }

        scoreTrendChart = new Chart(ctx, {
            type: "line",
            data: {
                labels: labels,
                datasets: [
                    {
                        label: "시험 성적",
                        data: scores,
                        backgroundColor: "rgba(78, 115, 223, 0.05)",
                        borderColor: "rgba(78, 115, 223, 1)",
                        borderWidth: 1,
                        pointBackgroundColor: "rgba(78, 115, 223, 1)",
                        fill: true,
                    },
                ],
            },
            options: {
                maintainAspectRatio: false,
                scales: {
                    x: {
                        display: true,
                        title: { display: true, text: "시험 날짜" },
                    },
                    y: {
                        display: true,
                        title: { display: true, text: "시험 성적" },
                    },
                },
            },
        }); // var scoreTrendChart
        console.log("Chart updated with examList: ", examList);
    }

    
    // 초기 화면 로드
    $(document).ready(function () {
        console.log("DOM 준비됨!");
        let userNo = $("#userNo").val(); // Hidden input에서 userNo 가져오기
        
        // 초기 화면 로딩 때 테이블이랑 차트 안 보이게끔 설정해 준 코드...ㄱㅡ
        $("#gradeTableContainer").hide(); // tbl
        $("#chartContainer").hide(); // chart
        
        fetchExamYears(userNo); // 연도에 대한 정보만 dropdown으로...
    });
}); // end of $(function)