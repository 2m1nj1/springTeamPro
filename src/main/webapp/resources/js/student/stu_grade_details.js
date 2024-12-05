$(function(){
        // 시험 번호를 URL 파라미터에서 받아옵니다.
        const examNo = new URLSearchParams(window.location.search).get('exam_no');  // exam_no 파라미터값 가져오기

        // 하드코딩된 시험 성적 데이터
        let scoreData = [
            {exam_no: 1, exam_name: "5월 모의고사", user_name: "김철수", original_score: 262, percentile_score: 351, exam_date: "2024-05-15", kor: 86, math: 88, eng: 88},
            {exam_no: 2, exam_name: "6월 평가원 모의고사", user_name: "김철수", original_score: 269, percentile_score: 360, exam_date: "2024-06-10", kor: 86, math: 92, eng: 91},
            {exam_no: 3, exam_name: "7월 모의고사", user_name: "김철수", original_score: 238, percentile_score: 319, exam_date: "2024-07-01", kor: 79, math: 79, eng: 80},
            {exam_no: 4, exam_name: "8월 모평", user_name: "김철수", original_score: 227, percentile_score: 304, exam_date: "2024-08-12", kor: 76, math: 76, eng: 75},
            {exam_no: 5, exam_name: "9월 모의고사", user_name: "김철수", original_score: 289, percentile_score: 387, exam_date: "2024-09-05", kor: 96, math: 97, eng: 96}
        ];

        // 해당 시험 데이터 찾기
        const selectedGrade = scoreData.find(grade => grade.exam_no == examNo);

        if (selectedGrade) {
            // 시험 정보 테이블
            let tableBody = $("#gradeTable tbody");
            tableBody.append(
                "<tr>" +
                    "<td>" + selectedGrade.exam_date + "</td>" +
                    "<td>" + selectedGrade.exam_name + "</td>" +
                    "<td>" + selectedGrade.exam_no + "</td>" +
                    "<td>" + selectedGrade.user_name + "</td>" +
                    "<td>" + selectedGrade.original_score + "</td>" +
                    "<td>" + selectedGrade.percentile_score + "</td>" +
                "</tr>"
            );

            // 성적 상세 테이블
            const subjectData = [
                {subject: '국어', score: selectedGrade.kor, avg_percentile: 90, top_30_percentile: 92},
                {subject: '수학', score: selectedGrade.math, avg_percentile: 90, top_30_percentile: 92},
                {subject: '영어', score: selectedGrade.eng, avg_percentile: 90, top_30_percentile: 92}
            ];

            let subjectTableBody = $("#subjectTable tbody");
            subjectData.forEach(function(subject) {
                subjectTableBody.append(
                    "<tr>" +
                        "<td>" + subject.subject + "</td>" +
                        "<td>응시</td>" +
                        "<td>" + subject.avg_percentile + "</td>" +
                        "<td>" + subject.top_30_percentile + "</td>" +
                        "<td>" + subject.score + "</td>" +
                        "<td>" + Math.round(subject.score * 1.2) + "</td>" +  <!-- 내점수 백분위 예시 -->
                        "<td>2</td>" +  <!-- 등급 예시 -->
                        "<td>1/1</td>" +  <!-- 석차 예시 -->
                    "</tr>"
                );
            });

            // 국영수 성적 바 그래프
            const korScore = selectedGrade.kor;
            const mathScore = selectedGrade.math;
            const engScore = selectedGrade.eng;
            const korTop30 = 92;  // 예시 값, 국어의 상위 30% 백분위 점수
            const mathTop30 = 92; // 예시 값, 수학의 상위 30% 백분위 점수
            const engTop30 = 92;  // 예시 값, 영어의 상위 30% 백분위 점수

         // 바 그래프 생성
            var ctx = document.getElementById("myBarChart").getContext('2d');
            var myBarChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['국어', '수학', '영어'],  // 과목명
                    datasets: [
                        {
                            label: '내 백분위',
                            backgroundColor: '#4e73df',  // 'primary' 색상 (#4e73df)
                            hoverBackgroundColor: '#2e59d9',  // 마우스 오버시 색상
                            borderColor: '#4e73df',  // 테두리 색상
                            data: [korScore, mathScore, engScore],  // 내 백분위 점수
                        },
                        {
                            label: '상위 30% 백분위',
                            backgroundColor: '#28a745',  // 상위 30% 백분위 색상 - 'success' 색상 (#28a745)
                            hoverBackgroundColor: '#218838',  // 상위 30% 백분위 색상 - 'success' 색상 (#218838)
                            borderColor: '#28a745',
                            data: [korTop30, mathTop30, engTop30],  // 상위 30% 백분위 점수
                        }
                    ]
                },
                options: {
                    maintainAspectRatio: false,
                    layout: {
                        padding: {
                            left: 10,
                            right: 25,
                            top: 25,
                            bottom: 0
                        }
                    },
                    scales: {
                        x: {
                            grid: {
                                display: false,
                            },
                            ticks: {
                                maxTicksLimit: 5
                            }
                        },
                        y: {
                            // y축의 범위를 0~100으로 고정
                            beginAtZero: true,  // y축이 0부터 시작하도록 설정
                            min: 0,  // y축 최소값을 0으로 설정
                            max: 100,  // y축 최대값을 100으로 설정
                            stepSize: 10,  // y축을 10단위로 표시
                            ticks: {
                                padding: 10,
                                callback: function(value) {
                                    return value + '%';  // 백분위에 '%' 기호 추가
                                },
                            },
                            grid: {
                                color: "rgb(234, 236, 244)",
                                zeroLineColor: "rgb(234, 236, 244)",
                                drawBorder: false,
                            }
                        },
                    },
                    legend: {
                        display: true  // 범례 표시
                    },
                    tooltips: {
                        titleMarginBottom: 10,
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        caretPadding: 10,
                        callbacks: {
                            label: function(tooltipItem, chart) {
                                return tooltipItem.yLabel + '%';  // 툴팁에 백분위 % 표시
                            }
                        }
                    }
                }
            }); // end of 바 그래프
        } else {
            console.error("시험 데이터가 없습니다!");
        }


        //새로운 월별 성적 그래프 추가
        // 월별 국영수 성적 그래프
        const monthlyScoreData = [
            {month: '5월', kor: 86, math: 88, eng: 88},
            {month: '6월', kor: 86, math: 92, eng: 91},
            {month: '7월', kor: 79, math: 79, eng: 80},
            {month: '8월', kor: 76, math: 76, eng: 75},
            {month: '9월', kor: 96, math: 97, eng: 96}
        ];

        // 월별 성적 바 그래프 생성
        var ctxMonthly = document.getElementById("myMonthlyChart").getContext('2d');
        var myMonthlyChart = new Chart(ctxMonthly, {
            type: 'bar',
            data: {
                labels: monthlyScoreData.map(data => data.month),  // 월별
                datasets: [
                    {
                        label: '국어',
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',  // 투명 초록
                        hoverBackgroundColor: 'rgba(75, 192, 192, 0.7)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1,
                        data: monthlyScoreData.map(data => data.kor),  // 월별 국어 성적
                    },
                    {
                        label: '수학',
                        backgroundColor: 'rgba(153, 102, 255, 0.2)',  // 투명 보라
                        hoverBackgroundColor: 'rgba(153, 102, 255, 0.7)',
                        borderColor: 'rgba(153, 102, 255, 1)',
                        borderWidth: 1,
                        data: monthlyScoreData.map(data => data.math),  // 월별 수학 성적
                    },
                    {
                        label: '영어',
                        backgroundColor: 'rgba(255, 159, 64, 0.2)',  // 투명 주황
                        hoverBackgroundColor: 'rgba(255, 159, 64, 0.7)',
                        borderColor: 'rgba(255, 159, 64, 1)',
                        borderWidth: 1,
                        data: monthlyScoreData.map(data => data.eng),  // 월별 영어 성적
                    }
                ]
            },
            options: {
                maintainAspectRatio: false,
                layout: {
                    padding: {
                        left: 10,
                        right: 25,
                        top: 25,
                        bottom: 0
                    }
                },
                scales: {
                    x: {
                        grid: {
                            display: false,
                        },
                        ticks: {
                            maxTicksLimit: 5
                        }
                    },
                    y: {
                        beginAtZero: true,  // y축이 0부터 시작하도록 설정
                        min: 0,  // y축 최소값을 0으로 설정
                        max: 100,  // y축 최대값을 100으로 설정
                        stepSize: 10,  // y축을 10단위로 표시
                        ticks: {
                            padding: 10,
                            callback: function(value) {
                                return value + '%';  // 백분위에 '%' 기호 추가
                            },
                        },
                        grid: {
                            color: "rgb(234, 236, 244)",
                            zeroLineColor: "rgb(234, 236, 244)",
                            drawBorder: false,
                        }
                    },
                },
                legend: {
                    display: true  // 범례 표시
                },
                tooltips: {
                    titleMarginBottom: 10,
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    caretPadding: 10,
                    callbacks: {
                        label: function(tooltipItem, chart) {
                            return tooltipItem.yLabel + '%';  // 툴팁에 백분위 % 표시
                        }
                    }
                }
            }
        });
        // 여기까지 새로운 월별 성적 그래프 추가.
    }); // end of $(function(){})