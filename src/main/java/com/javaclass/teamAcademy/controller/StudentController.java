package com.javaclass.teamAcademy.controller;

import java.io.File;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javaclass.teamAcademy.service.AttendanceService;
import com.javaclass.teamAcademy.service.BoardService;
import com.javaclass.teamAcademy.service.HomeworkService;
import com.javaclass.teamAcademy.service.ProfileService;
import com.javaclass.teamAcademy.service.ServiceTx;
import com.javaclass.teamAcademy.vo.AttendanceVO;
import com.javaclass.teamAcademy.vo.BoardVO;
import com.javaclass.teamAcademy.vo.CourseSchVO;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.ExamVO;
import com.javaclass.teamAcademy.vo.GradeVO;
import com.javaclass.teamAcademy.vo.HomeworkDoneVO;
import com.javaclass.teamAcademy.vo.HomeworkVO;
import com.javaclass.teamAcademy.vo.LogVO;

@Controller
public class StudentController {

	@Autowired
    private HomeworkService homeworkService;
	
	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private ServiceTx serviceTx;
	
	@Autowired
	private ProfileService profileService;
	
	@Autowired
	private BoardService boardService;

    //================================================
	//				   Homework part
	//================================================
	// 데이터 물어오는 라우팅(루팅, routing) - [학생] 과제제출 페이지랑 연결.
	// stu_homework.jsp 페이지 로딩
    @RequestMapping("stu_homework")
    public String getHomeworkPage(HttpSession session, Model m) {
        Integer userNo = (Integer)session.getAttribute("loginUserPK");
        if (userNo == null) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "User not logged in");
        }
        System.out.println("Accessing stu_homework.do with userNo: " + userNo);
        try {
            List<CourseVO> courses = homeworkService.getLecturesByUser(userNo);
            m.addAttribute("courses", courses);
            m.addAttribute("userNo", userNo); // userNo to JSP
        } catch (Exception e) {
            System.out.println("stu_homework error: " + e.getMessage());
        }
        return "student/stu_homework"; // stu_homework.jsp 로 이동.
    }// end of stu_homework.do
    
    
    // 선택한 강좌를 위한 과제 목록 가져옴.
    @RequestMapping("fetchHomework")
    @ResponseBody
    public List<HomeworkVO> fetchHomeworkByCourse(@RequestParam("courseNo") int courseNo) {
    	System.out.println("Fetching homework for courseNo: " + courseNo);
        return homeworkService.getHomeworkByCourse(courseNo);
    }// end of fetchHomeworkByCourse
    
    
    // fetchHomeworkStatus 로 라우팅.
    @RequestMapping("fetchHomeworkStatus.do")
    @ResponseBody
    public Map<String, Object> fetchHomeworkStatus(
        @RequestParam("hwNo") int hwNo,
        HttpSession session
    ) {
        Integer userNo = (Integer) session.getAttribute("loginUserPK");
        if (userNo == null) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "User not logged in");
        }

        boolean isSubmitted = homeworkService.isHomeworkSubmitted(hwNo, userNo);
        Map<String, Object> response = new HashMap<>();
        response.put("isSubmitted", isSubmitted);

        return response;
    }// end of fetchHomeworkStatus
    
    
    // 선택한 번호의 과제 정보를 가져옴.
    @RequestMapping(value="stu_homework_details", method=RequestMethod.GET)
    @ResponseBody
    public HomeworkVO stuHomeworkDetails(@RequestParam("hwNo") int hwNo) {
        // request 콘솔에 찍어보기.
        System.out.println("컨트롤러) Fetching homework details for hwNo: " + hwNo );

        // 서비스 단으로부터 과제 세부 정보 물어옴.
        HomeworkVO homeworkDetails = homeworkService.getHomeworkDetails(hwNo); // HomeworkService에 이 방식 저장.

        if (homeworkDetails == null) {
            // 세부정보 없으면 에러를 반환하거나 메세지 출력토록...
            System.out.println("No homework details found for hwNo: " + hwNo );
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Homework not found");
        }
        System.out.println("컨트롤러) Fetched HomeworkVO: " + homeworkDetails);
        return homeworkDetails;
    }// end of stuGradeDetails
    
    
    @PostMapping("/submitHomework.do")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> submitHomework(
            @RequestParam(value = "hw_no", required = false) Integer hwNo,
            HttpSession session,
            @RequestParam("file") MultipartFile file) {
    	
    	Integer userNo = (Integer) session.getAttribute("loginUserPK");
        System.out.println("Received hw_no: " + hwNo);
        System.out.println("Received user_no: " + userNo);
        System.out.println("Received file: " + file.getOriginalFilename());

        Map<String, Object> response = new HashMap<>();
        
        try {
            if (hwNo == null || userNo == null || file.isEmpty()) {
                throw new IllegalArgumentException("Missing parameters or file is empty!");
            }
            
            // 파일 업로드 경로 지정
            String uploadDir = "/team2pro/src/main/webapp/resources/static/uploads/homework/";
            File uploadFolder = new File(uploadDir);

            // 디렉토리 생성해주기 - 없을 경우;
            if (!uploadFolder.exists()) {
                uploadFolder.mkdirs();
            }

            // 고유명 파일 경로 만들어주기
            String uniqueFileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            String fullPath = uploadDir + uniqueFileName;

            // 파일을 서버에 저장하기
            file.transferTo(new File(fullPath));

            // 파일 경로를 데이터베이스에 저장
            homeworkService.saveUpload(hwNo, fullPath);
            
            // 가장 최근에 생성된 upload_no 반환.
            int uploadNo = homeworkService.getLastUploadId();
            System.out.println("Latest upload_no: " + uploadNo);

            // 제출 과제 저장...
            HomeworkDoneVO homeworkDone = new HomeworkDoneVO();
            homeworkDone.setHwNo(hwNo);
            homeworkDone.setUserNo(userNo);
            homeworkDone.setDoneTitle(file.getOriginalFilename());
            homeworkDone.setDoneDate(String.valueOf(System.currentTimeMillis())); // Example timestamp
            homeworkDone.setUploadNo(uploadNo);

            homeworkService.saveHomeworkSubmission(homeworkDone);
            
            response.put("success", true);
            response.put("message", "Homework submitted successfully.");
            response.put("filePath", fullPath);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("message", "Error: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }// end of submitHomework


	//================================================
  	//				Attendance part
  	//================================================
    // 특정 강좌에 대한 출석부 목록 출력...
 	/*
 	 * [학생]이 현재 수강중인 강좌들에 대한 리스트 출력. 
 	 */
 	@RequestMapping("stu_attendance.do")
 	public String viewAttendancePage(HttpSession session, Model m) {
 	    Integer userNo = (Integer)session.getAttribute("loginUserPK");
 	    if (userNo == null) {
 	        throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "User not logged in");
 	    }
 	    System.out.println("Reached viewAttendancePage for userNo: " + userNo);

 	    List<CourseVO> ongoingCourses = attendanceService.getOngoingCourses(userNo);
 	    for (CourseVO vo : ongoingCourses) {
 	        System.out.println("OngoingCourses: " + vo);
 	    }
 	    m.addAttribute("ongoingCourses", ongoingCourses);
 	    m.addAttribute("userNo", userNo); // view 단에 session loginUserPK 던져줌. - 리퀘스트 파라미터.
        return "student/stu_attendance"; // JSP page name
     } // end of viewAttendancePage
 	
 	
 	// 출결 validation
 	@RequestMapping(value = "/validateAttendance", method = RequestMethod.GET)
 	@ResponseBody
 	public Map<String, Object> validateAttendance(@RequestParam int userNo, @RequestParam int courseNo) {
 	    Map<String, Object> response = new HashMap<>();
 	    try {
 	        System.out.println("Validating attendance for userNo: " + userNo + ", courseNo: " + courseNo);

 	        CourseSchVO courseTimings = attendanceService.getCourseTimings(courseNo);
 	        if (courseTimings == null ) {
 	            response.put("status", "error");
 	            response.put("message", "No timings found for courseNo: " + courseNo);
 	            return response;
 	        }

 	        response.put("status", "success");
 	        response.put("courseStartTime", courseTimings.getCourse_startTime());
 	        response.put("courseEndTime", courseTimings.getCourse_endTime());
 	        response.put("courseDayOfWeek", courseTimings.getCourse_dayOfWeek());
 	    } catch (Exception e) {
 	        e.printStackTrace();
 	        response.put("status", "error");
 	        response.put("message", "Validation failed: " + e.getMessage());
 	    }
 	    return response;
 	}// end of validateAttendance

 	
 	// 출석 버튼 누르면 실행되는거
 	@PostMapping("/markAttendance")
 	@ResponseBody
 	public String markAttendance(HttpSession session, @RequestParam int courseNo, @RequestParam int attendanceStatus) {
 	    Integer userNo = (Integer) session.getAttribute("loginUserPK");
 	    System.out.println("Received courseNo: " + courseNo + ", userNo: " + userNo);
 	    
 	    if (userNo == null) {
 	        return "로그인 세션이 만료되었습니다.";
 	    }

 	    if (courseNo == 0) {
 	        return "강좌를 선택해주세요.";
 	    }
 	    
 	    try {
 	    	CourseSchVO courseTimings = attendanceService.getCourseTimings(courseNo);
 	        if (courseTimings == null) {
 	            return "markAttendance - errorFetchingCourseTimings";
 	        }

 	        String startTime = courseTimings.getCourse_startTime();
 	        LocalTime courseStartTime = LocalTime.parse(startTime);
 	        LocalTime now = LocalTime.now();
 	        if (now.isAfter(courseStartTime.minusMinutes(30)) && now.isBefore(courseStartTime)) {
 	            attendanceStatus = 1; // 출석
 	        } else {
 	            attendanceStatus = 2; // 지각
 	        }

 	        attendanceService.markAttendance(userNo, courseNo, attendanceStatus);
 	        return attendanceStatus == 1 ? "successMarkAttendance" : "markedLate";
 	    } catch (Exception e) {
 	        e.printStackTrace();
 	        return "failure";
 	    }
 	} // end of markAttendance
 
 	
 	// 조퇴 버튼 누르면 실행되는거
 	@PostMapping("markEarlyLeave")
 	@ResponseBody
 	public String markEarlyLeave(HttpSession session, @RequestParam int courseNo) {
 	    Integer userNo = (Integer) session.getAttribute("loginUserPK");

 	    try {
 	        boolean hasAttendanceToday = attendanceService.checkAttendanceToday(userNo, courseNo);
 	        if (!hasAttendanceToday) {
 	            return "오늘 출석하지 않으셨습니다!";
 	        }

 	        attendanceService.markEarlyLeave(userNo, courseNo, 3); // Premature leave
 	        return "successMarkEarlyLeave";
 	    } catch (Exception e) {
 	        e.printStackTrace();
 	        return "failure";
 	    }
 	}// end of markEarlyLeave
 	
 	
 	// 학생이 수강중인 강좌 목록 불러옴
 	@GetMapping("fetchOngoingCourses")
 	public List<CourseVO> fetchOngoingCourses(HttpSession session) {
 	    Integer userNo = (Integer) session.getAttribute("loginUserPK");
 	    if (userNo == null) {
 	        throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "User not logged in");
 	    }
 	    System.out.println("Fetching ongoing courses for userNo: " + userNo);
 	    return attendanceService.getOngoingCourses(userNo);  // JSON response
     } // end of fetchOngoingCourses

 	
 	// 특정 강좌에 대한 출석부 내 출석정보(Attendance no pk값으로) 열람
 	/* 
 	 * 위에서 선택된 강좌에 해당하는 출석 기록 불러오기. 
 	 * @param 으로 학생 번호 - userNo, 강좌 번호 - courseNo 받음.
 	 * 출석 기록 list 로 받음.
 	 */
     @GetMapping("records")
     @ResponseBody
     public List<AttendanceVO> fetchAttendanceRecords(
    	        HttpSession session,
    	        @RequestParam(required = false) Integer courseNo,
    	        @RequestParam(required = false) String startDate,
    	        @RequestParam(required = false) String endDate,
    	        @RequestParam(defaultValue = "0") int page,
    	        @RequestParam(defaultValue = "10") int size) {
    	    Integer userNo = (Integer) session.getAttribute("loginUserPK");
    	    if (userNo == null) {
    	        throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "User not logged in");
    	    }
    	    System.out.println("Fetching attendance records for userNo: " + userNo);

    	    int offset = page * size;
    	    Map<String, Object> params = new HashMap<>();
    	    params.put("userNo", userNo);
    	    params.put("courseNo", courseNo);
    	    params.put("startDate", startDate);
    	    params.put("endDate", endDate);
    	    params.put("offset", offset);
    	    params.put("limit", size);

    	    return attendanceService.getAttendanceRecords(params);
        
     } // end of fetchAttendanceRecords
		

    //================================================
   	//			Grade + Exam score  part
   	//================================================
    // 화면 출력
    @GetMapping("fetchExamYears")
    @ResponseBody
    public List<Integer> fetchExamYears(HttpSession session) {
    	Integer userNo = (Integer) session.getAttribute("loginUserPK");
        List<Integer> examYears = serviceTx.fetchExamYears(userNo); // Fetch from the service layer
        System.out.println("Exam years fetched: " + examYears);
        return examYears;
    } // end of fetchExamYears
	
    
    // Fetch test titles for the selected year
    @GetMapping("fetchExamTitles")
    @ResponseBody
    public List<ExamVO> fetchExamTitles(@RequestParam(value = "year") int year) {
        return serviceTx.fetchExamTitles(year);
    }// end of feetchExamTitles
    

    // Fetch exam context for the selected test title
    @GetMapping(value="fetchExamContext", produces="application/text; charset=UTF-8")
    @ResponseBody
    public String fetchExamContext(@RequestParam(value = "examNo") int examNo) {
        String result = serviceTx.fetchExamContext(examNo);
        System.out.println("[ 컨트롤러: fetchExamContext/ ] ;result = " + result);
        
        return result;
    }// end of fetchExamContext
    
     
    // 시험정보 목록 물어옴.
    @GetMapping("fetchExamList")
    @ResponseBody
    public List<ExamVO> fetchExamList() {
        // Fetch the list of exams from the database
        List<ExamVO> examList = serviceTx.getAllExams();
        return examList; // Return as JSON
    }// end of fetchExamList
     
     
    // 시험 정보와 그에 상응하는 점수 값들을 불러옴.
	@GetMapping("stu_grade")
	public String listGradeAndExams(HttpSession session, Model m) {
		Integer userNo = (Integer) session.getAttribute("loginUserPK");
		System.out.println("received userNo: " + userNo);
		  
		List<GradeVO> gradeList = serviceTx.fetchGradeList(userNo);
		System.out.println("gradeList size: " + gradeList.size());
		  
		List<ExamVO> examList = serviceTx.fetchExamList(userNo);
		System.out.println("examList size: " + examList.size());
		  
		for( GradeVO gvo : gradeList ) { System.out.println(gvo); }
		 
		for( ExamVO evo : examList ) { System.out.println(evo); }
		  
		m.addAttribute("gradeList", gradeList); m.addAttribute("examList", examList);
		m.addAttribute("userNo", userNo);
		  
		return "student/stu_grade"; 
	} // end of listGradeAndExams
	 
	  
	// 성적 상세보기 페이지
	@RequestMapping("stu_grade_details")
	public String stuGradeDetails(@RequestParam("exam_no") int examNo, Model model) {
	    // 성적 세부정보 반환하는 로직
	    model.addAttribute("examNo", examNo);
	    return "student/stu_grade_details";
	}// end of stuGradeDetails
	  
	  
	// 성적 등록 페이지
	@RequestMapping("stu_gradeInsert")
	public String showGradeInsertPage(HttpSession session, Model model) {
		Integer userNo = (Integer) session.getAttribute("loginUserPK");
	    model.addAttribute("userNo", userNo);
	    return "student/stu_gradeInsert";
	}// end of showGradeInsertPage
	  
	  
    // JSON 반환 -> 차트 그리는 데에 넣어줄거. 자료 던져주는 역할만 한다.
    @GetMapping("fetchGradeAndExams")
    @ResponseBody
    public Map<String, Object> fetchGradeAndExams( 
    	HttpSession session,
    	@RequestParam(value = "year", required = false) Integer year,
     	@RequestParam(value = "exam_no", required = false) Integer examNo){
    	
    	Integer userNo = (Integer) session.getAttribute("loginUserPK");
    	
    	System.out.println("Received userNo : " + userNo);
    	System.out.println("Received examNo : " + examNo);
    	 
    	// gradeList 에 연도에 해당하는 DB 값들을 가져옴
    	List<GradeVO> gradeList = year != null
    			? serviceTx.fetchGradeListByYear(userNo, year) :
    			 serviceTx.fetchGradeList(userNo);
    	
    	List<ExamVO> examList = serviceTx.fetchExamList(userNo);
    	 
    	Map<String, Object> response = new HashMap<>();
    	 
    	response.put("gradeList", gradeList);
    	response.put("examList", examList);
    	
    	System.out.println("Grade list size: " + (gradeList != null ? gradeList.size() : "null"));
    	System.out.println("Exam list size: " + (examList != null ? examList.size() : "null"));
    	 
    	return response;
    } // end of fetchGradeAndExams

     
    // 시험 정보와 성적 정보들 삽입
    @PostMapping("insertGrade")
    @ResponseBody
    public String insertGrade(@RequestBody GradeVO gradeVO) {
        try {
            serviceTx.insertGrade(gradeVO);
            return "successInsertGrade";
        } catch (Exception e) {
            e.printStackTrace();
            return "failure";
        }
    }// end of insertGrade
    
    @RequestMapping("sstu_{view}.do")
	public String returnView(@PathVariable String view,
					        Model m,
					        HttpSession session,
					        @ModelAttribute("log") LogVO logvo) {
		
    	if (view.equals("profileSetting")) {
            Integer user_No = (Integer) session.getAttribute("loginUserPK");
            System.out.println(user_No);
            
            if (user_No == null) {
                return "redirect:comm_loginform.do";
            }

            LogVO log = profileService.getUserProfile(user_No);
            m.addAttribute("log", log);

            return "student/sstu_" + view;

        } else if (view.equals("profile")) {
            m.addAttribute("log", logvo);

            List<BoardVO> list = boardService.getBoardList();
            m.addAttribute("boardList", list);

            return "student/sstu_" + view;

        } else {
            return "student/sstu_" + view;
        }
    
	} // end of returnView	

    @RequestMapping("updateProfile1.do")
	public String updateProfile(LogVO logvo, RedirectAttributes redirectAttributes) {
		System.out.println("저장!!!!!!!!!!!!!!!");
		System.out.println("입력값: " + logvo.toString());
		
		try {
			profileService.updateProfile(logvo);	// 프로필 업데이트
			redirectAttributes.addFlashAttribute("msg", "프로필 업데이트에 성공했습니다.");
		} catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "프로필 업데이트에 실패했습니다.");
        }
		
		redirectAttributes.addFlashAttribute("log", logvo);
		
		return "redirect:sstu_profile.do?user_No=" + logvo.getUser_No();
		//return "redirect:stu_profile.do";
	}
     
} // 컨트롤러 마감.