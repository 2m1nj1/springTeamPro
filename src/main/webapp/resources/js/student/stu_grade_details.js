$(function(){
	const urlParams = new URLSearchParams(window.location.search);
    const userNo = urlParams.get("userNo");  // 넘겨받은 파라미터값 - userNo;
    const examNo = urlParams.get("exam_no"); // 넘겨받은 파라미터값 - exam_no;
    
    console.log("넘어온 userNo : ", userNo);
    console.log("넘어온 exam_no : ", examNo);

	    // 백단에서 데이터 물어옴.
	    $.ajax({
	        url: "fetchGradeAndExams",
	        method: "GET",
	        data: { userNo, exam_no: examNo },
	        dataType: "json",
	        success: function (response) {
	            const { gradeList } = response;
	
	            console.log("Grade List : ", gradeList);
	            console.log("Filtering for exam_no : ", examNo);
	            
	            // 성적 테이블 렌더링.
	            renderGradeTable(gradeList, examNo);
	            
	            renderFieldScoresChart(gradeList);
	            
	            // 특정 exam_no 에 대한 데이터값 저장.
	            const selectedGrade = gradeList.find(grade => grade.exam_no == examNo);

	
	            if (selectedGrade) {
	                renderSubjectTable(selectedGrade); // Render table
	                renderComparisonChart(selectedGrade); // Render first chart
	            } else {
	                console.error("No data found for examNo : ", examNo);
	            }
	            
	            // 
	        },
	        error: function (err) {
	            console.error("Failed to fetch data : ", err);
	        },
	    }); // end of ajax; 

        
		// 시험 상세 정보 테이블 생성
		function renderGradeTable(gradeList, examNo) {
			const tableBody = $("#gradeTable tbody");
		    tableBody.empty(); // 기존에 존재하던 어느 행이든 초기화시킴.

		    // 파라미터로 넘어 온 exam_no 에 상응하는 값만 도출.
		    const filteredGrades = gradeList.filter(grade => grade.exam_no == examNo);
		    
		    // 특정 exam_no 만 있는 성적 도출.
		    filteredGrades.forEach(grade => {
		    	console.log("renderGradeTable(gradeList, examNo)" + examNo);
		        // 합산된 값들 계산.
		    	const kor = grade.kor || 0;
		        const math = grade.math || 0;
		        const eng = grade.eng || 0;
		        const percentileKor = grade.kor_percentile || 0;
		        const percentileMath = grade.math_percentile || 0;
		        const percentileEng = grade.eng_percentile || 0;

		        // 점수 합산.
		        const originalScore = kor + math + eng;
		        const totalPercentileScore = (kor + math + eng)*1.2;
		        
		        tableBody.append(
		            `<tr>
		                <td>${grade.exam_date}</td>
		                <td>${grade.exam_name}</td>
		                <td>${grade.exam_no}</td>
		                <td>${grade.user_name}</td>
		                <td>${originalScore}</td>
		                <td>${totalPercentileScore}</td>
		            </tr>`
		        );
		    });
		    // 행 없으면 메시지 출력.
		    if (filteredGrades.length === 0) {
		        tableBody.append(
		            `<tr>
		                <td colspan="6" class="text-center">선택한 시험에 대한 점수값이 없습니다.</td>
		            </tr>`
		        );
		    }		    
		}// end of renderGradeTable.

		
        // 성적 상세 정보 테이블 생성
        function renderSubjectTable(grade) {
            const tableBody = $("#subjectTable tbody");
            tableBody.empty(); // Clear any existing rows

            // 점수 기준으로 (등급) 산출
            const calculateGrade = (score) => {
            	switch (true) {
            	case score >= 90 && score <= 100:
            		return 1;
            	case score >= 80 && score < 90:
            		return 2;
            	case score >= 70 && score < 80:
            		return 3;
            	case score >= 60 && score < 70:
            		return 4;
            	case score >= 50 && score < 60:
            		return 5;
            	case score >= 40 && score < 50:
            		return 6;
            	case score >= 30 && score < 40:
            		return 7;
            	case score >= 20 && score < 30:
            		return 8;
            	case score >= 10 && score < 20:
            		return 9;
            	default:
            		return "N/A";
            	}
            }
            
            const subjects = [
                { name: "국어", score: grade.kor },
                { name: "수학", score: grade.math },
                { name: "영어", score: grade.eng },
            ];

            subjects.forEach(subject => {
            	const gradeLevel = calculateGrade(subject.score);
                tableBody.append(
                    `<tr>
                        <td>${subject.name}</td>
                        <td>응시</td>
                        <td>90</td> <!-- 전체 평균값 -->
                        <td>92</td> <!-- 상위 30% 백분위값 -->
                        <td>${subject.score}</td>
                        <td>${Math.round( subject.score * 1.2 )}</td> <!-- 백분위 계산 예시... -->
                        <td>${gradeLevel}</td> <!-- 등급 예시 -->
                        <td>1/1</td> <!-- 석차 예시 -->
                    </tr>`
                );
            });
            
            // "종합" 행 추가.
            const totalScore = (grade.kor || 0) + (grade.math || 0) + (grade.eng || 0); // 점수 합산;
            const totalPercentile = Math.round(totalScore * 1.2); // "백분위 합계" 예시
            tableBody.append(
                `<tr>
                    <td>종합</td>
                    <td>-</td>
                    <td>270</td> <!-- 전체 평균값 합계 -->
                    <td>276</td> <!-- 상위 30% 백분위 합계 -->
                    <td>${totalScore}</td> <!-- 원점수 합계 -->
                    <td>${totalPercentile}</td> <!-- 백분위 합계 -->
                    <td>-</td> <!-- No grade for 종합 -->
                    <td>-</td> <!-- No rank for 종합 -->
                </tr>`
            );
        } // end of renderSubjectTable
    
        
        // 백분위 점수 성적 상위 30% 사람들이랑 비교하는 차트
        function renderComparisonChart(grade) {
        	const ctx = document.getElementById("comparisonChart").getContext("2d");

            // Extract scores for comparison
            const studentScores = [grade.kor || 0, grade.math || 0, grade.eng || 0];
            const upper30PercentileScores = [92, 92, 92]; // Example constant values for the upper 30% benchmark

            // Labels for the X-axis
            const subjects = ["국어", "수학", "영어"];

            new Chart(ctx, {
                type: "bar",
                data: {
                    labels: subjects, // X-axis labels
                    datasets: [
                        {
                            label: "내 점수",
                            data: studentScores, // Student's scores
                            backgroundColor: "rgba(54, 162, 235, 0.6)", // Light blue
                            borderColor: "rgba(54, 162, 235, 1)",
                            borderWidth: 1,
                        },
                        {
                            label: "상위 30% 기준",
                            data: upper30PercentileScores, // Upper 30% benchmark scores
                            backgroundColor: "rgba(34, 139, 37, 0.4)", // Light green
                            borderColor: "rgba(34, 139, 37, 1)",
                            borderWidth: 1,
                        },
                    ],
                },
                options: {
                    maintainAspectRatio: false,
                    scales: {
                        x: {
                            stacked: false, // Separate bars for comparison
                        },
                        y: {
                            beginAtZero: true,
                            min: 0, // Start Y-axis at 0
                            max: 100, // Maximum score range
                            ticks: {
                                stepSize: 10,
                                callback: function (value) {
                                    return value + "점"; // Append "점" to Y-axis labels
                                },
                            },
                        },
                    },
                    plugins: {
                        tooltip: {
                            callbacks: {
                                label: function (context) {
                                    return context.dataset.label + ": " + context.raw + "점";
                                },
                            },
                        },
                    },
                },
            });
        }
    
    // renderFieldScoresChart.
    function renderFieldScoresChart(gradeList) {
    	const examNames = gradeList.map(grade => grade.exam_name || "Unknown Exam"); // exam_date 에서 YYYY 추출.
        const korScores = gradeList.map(grade => grade.kor || 0);
        const mathScores = gradeList.map(grade => grade.math || 0);
        const engScores = gradeList.map(grade => grade.eng || 0);

        const ctx = document.getElementById("fieldScoresChart").getContext("2d");
        
        new Chart(ctx, {
            type: "bar",
            data: {
                labels: examNames, // x축 라벨링
                datasets: [
                    {
                        label: "국어 원점수",
                        data: korScores,
                        backgroundColor: "rgba(75, 192, 192, 0.5)",
                        borderColor: "rgba(75, 192, 192, 1)",
                    },
                    {
                        label: "수학 원점수",
                        data: mathScores,
                        backgroundColor: "rgba(153, 102, 255, 0.5)",
                        borderColor: "rgba(153, 102, 255, 1)",
                    },
                    {
                        label: "영어 원점수",
                        data: engScores,
                        backgroundColor: "rgba(255, 159, 64, 0.5)",
                        borderColor: "rgba(255, 159, 64, 1)",
                    },
                ],
            },
            options: {
                maintainAspectRatio: false,
                scales: {
                    x: {
                        ticks: {
                            autoSkip: false, // Prevent skipping of labels
                            maxRotation: 45, // Rotate labels for better readability
                            minRotation: 0,
                        },
                    },
                    y: {
                        beginAtZero: true,
                        min: 0, // Start at 0
                        max: 100, // Static range for scores
                        ticks: {
                            stepSize: 10, // Increment by 10
                            callback: function (value) {
                                return value + "점"; // Append "점" to Y-axis labels
                            },
                        },
                    },
                },
            },
        });
    }
}); // end of $(function(){})