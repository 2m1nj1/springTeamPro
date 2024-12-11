$(function () {
    // 숨겨진 사용자 정보.
    const userNo = $("#userNo").val();

    // 로그인한 학생이 치룬 시험 연도 자료 물어옴.
    function fetchExamYears() {
        $.ajax({
            type: "GET",
            url: "/fetchExamYears",
            data: { userNo },
            success: function (years) {
                const yearDropdown = $("#year");
                yearDropdown.empty();
                yearDropdown.append('<option value="">조회할 연도를 선택하세요</option>');
                years.forEach(year => {
                    yearDropdown.append(`<option value="${year}">${year}</option>`);
                });
            },
            error: function () {
                alert("시험 연도를 불러오기 실패했습니다.");
            }
        });
    }

    // 선택된 연도에 대한 시험 제목들 물어오기.
    $("#year").on("change", function () {
        const year = $(this).val();
        const examDropdown = $("#exam_name");
        const contextInput = $("#exam_context");

        examDropdown.empty().append('<option value="">시험명을 선택하세요</option>');
        contextInput.val("");
        if (!year) {
            examDropdown.prop("disabled", true);
            return;
        }

        $.ajax({
            type: "GET",
            url: "/fetchExamTitles",
            data: { year },
            success: function (titles) {
                titles.forEach(title => {
                    examDropdown.append(`<option value="${title.exam_no}">${title.exam_name}</option>`);
                });
                examDropdown.prop("disabled", false);
            },
            error: function () {
                alert("시험 제목들을 불러오기 실패했습니다.");
            }
        });// ajax
    });

    // 선택된 시험의 상세 정보 물어오기.
    $("#exam_name").on("change", function () {
        const examNo = $(this).val();
        const contextInput = $("#exam_context");

        contextInput.val("");
        if (!examNo) return;

        $.ajax({
            type: "GET",
            url: "/fetchExamContext",
            data: { examNo },
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            //contentType: "application/json; charset=UTF-8", // 명시적으로 UTF-8 설정
            success: function (context) {
            	console.log("Fetched context:", context);
                $("#exam_context").val(context || "No context available.");
            },
            error: function () {
                alert("시험 정보를 불러오기 실패했습니다.");
            }
        });
    }); // end of exam_name onchange

    // 성적 입력단.
    $("#stu_gradeInsertButton").on("click", function () {
        const data = {
            user_no: userNo,
            exam_no: $("#exam_name").val(),
            exam_context: $("#exam_context").val(),
            user_name: $("#user_name").val(),
            original_score: $("#original_score").val(),
            percentile_score: $("#percentile_score").val(),
            kor: $("#kor").val(),
            kor_took: $("#kor_took").is(":checked") ? 1 : 0,
            math: $("#math").val(),
            math_took: $("#math_took").is(":checked") ? 1 : 0,
            eng: $("#eng").val(),
            eng_took: $("#eng_took").is(":checked") ? 1 : 0
        };

        // 필요 항목들 유효성 검사...
        consloe.log( "data.exam_no : " + data.exam_no + "data.user_name" + data.user_name +
        		"data.original_score" + dtat.original_score + "data.percentile_score" + data.percentile_score );
        if ( !data.exam_no || !data.user_name || !data.original_score || !data.percentile_score ) {
            alert("모든 필수 항목을 입력하세요!");
            return;
        }

        $.ajax({
            type: "POST",
            url: "/insertGrade",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(data),
            success: function (response) {
                if (response === "successInsertGrade") {
                    alert("성적 정보가 성공적으로 저장되었습니다!");
                    window.location.href = "stu_grade.do"; // 입력 페이지 -> 성적 메인으로 라우팅.
                } else {
                    alert("성적 저장 실패! 다시 시도하세요.");
                }
            },
            error: function () {
                alert("서버 오류로 인해 성적 저장에 실패했습니다.");
            }
        }); // ajax
    });

    // 초기 로딩
    $(document).ready(function () {
        fetchExamYears(); // 페이지 로딩시 연도 드랍다운 생성
    });
});
