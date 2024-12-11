package com.javaclass.teamAcademy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.server.ResponseStatusException;

import com.javaclass.teamAcademy.service.AttendanceService;
import com.javaclass.teamAcademy.service.HomeworkService;
import com.javaclass.teamAcademy.service.ServiceTx;
import com.javaclass.teamAcademy.vo.AttendanceVO;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.ExamVO;
import com.javaclass.teamAcademy.vo.GradeVO;
import com.javaclass.teamAcademy.vo.HomeworkVO;

@Controller
public class StudentController {

	@Autowired
    private HomeworkService homeworkService;
	
	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private ServiceTx serviceTx;
	
	
    //================================================
	//				Homework part
	//================================================
	// 데이터 물어오는 라우팅(루팅, routing) - [학생] 과제제출 페이지랑 연결.
	// Render the homework page
    @RequestMapping("stu_homework.do")
    public String getHomeworkPage(@RequestParam(value="userNo", required=false, defaultValue="28") int userNo, Model m) {
    	
    	if (userNo == 0) {
            System.out.println("userNo 파라미터 안 들어옴!");
            return "error/missingUserNo"; // userNo 없는 경우;
        }
    	
        List<CourseVO> courses = homeworkService.getLecturesByUser(userNo);

        m.addAttribute("courses", courses);
        m.addAttribute("userNo", userNo); // userNo 를 JSP 에 전달.
        return "student/stu_homework"; // stu_homework.jsp 로 이동.
    }// end of stu_homework.do
    
    
    // 선택한 강좌를 위한 과제 목록 가져옴.
    @RequestMapping("fetchHomework")
    @ResponseBody
    public List<HomeworkVO> fetchHomeworkByCourse(@RequestParam("courseNo") int courseNo) {
    	System.out.println("Fetching homework for courseNo: " + courseNo);
        return homeworkService.getHomeworkByCourse(courseNo);
    }// end of fetchHomeworkByCourse
    
    
    // 선택한 번호의 과제 정보를 가져옴.
    @RequestMapping("stu_homework_details")
    @ResponseBody
    public HomeworkVO stuHomeworkDetails(@RequestParam("hwNo") int hwNo) {
        // request 콘솔에 찍어보기.
        System.out.println("컨트롤러) Fetching homework details for hwNo: " + hwNo);

        // 서비스 단으로부터 과제 세부 정보 물어옴.
        HomeworkVO homeworkDetails = homeworkService.getHomeworkDetails(hwNo); // HomeworkService에 이 방식 저장.

        if (homeworkDetails == null) {
            // 세부정보 없으면 에러를 반환하거나 메세지 출력토록...
            System.out.println("No homework details found for hwNo: " + hwNo);
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Homework not found");
        }
        System.out.println("컨트롤러) Fetched HomeworkVO: " + homeworkDetails);
        return homeworkDetails;
    }// end of stuGradeDetails
    
    
	/*
	 * @RequestMapping("submit_homework") public String
	 * submitHomework(@RequestParam("hw_no") int hwNo, Model model) {
	 *    System.out.println("Submitting homework with ID: " + hwNo); // 디버깅 //
	 *    Add submission logic here return "redirect:/student/stu_homework.do"; 
	 *    // Redirect after submission 
	 * }
	 */
     
    
    //================================================
  	//				Attendance part
  	//================================================
    // 특정 강좌에 대한 출석부 목록 출력...
 	/*
 	 * [학생]이 현재 수강중인 강좌들에 대한 리스트 출력. 
 	 */
 	@GetMapping("stu_attendance")
     public String viewAttendancePage(@RequestParam(value="userNo", required=false, defaultValue = "28") int userNo, Model m) {
 		System.out.println("Reached viewAttendancePage for userNo: " + userNo);
 		
         // 수강중인 강좌 가져옴.
         List<CourseVO> ongoingCourses = attendanceService.getOngoingCourses(userNo);
         
         for( CourseVO vo : ongoingCourses ) {
         	System.out.println("AttendanceController ongogingCourses : " + vo);
         }
         
         m.addAttribute("ongoingCourses", ongoingCourses);
         m.addAttribute("userNo", userNo); // view 단에 userNo 던져줌. - 리퀘스트 파라미터.
         return "student/stu_attendance"; // JSP page name
     } // end of viewAttendancePage
 	
 	
 	// 출결 validation
 	@GetMapping("validateAttendance")
 	@ResponseBody
 	public Map<String, Object> validateAttendance(
 	    @RequestParam int userNo, 
 	    @RequestParam int courseNo) {
 	    Map<String, Object> response = new HashMap<>();
 	    try {
 	        // Check if the user has already attended or left early today
 	        boolean alreadyAttended = attendanceService.checkAttendanceToday(userNo, courseNo);
 	        boolean alreadyLeftEarly = attendanceService.checkPrematureLeaveToday(userNo, courseNo);
 	        
 	        response.put("status", "success");

 	        // Fetch course start and end times
 	        Map<String, String> courseTimings = attendanceService.getCourseTimings(courseNo);

 	        response.put("alreadyAttended", alreadyAttended);
 	        response.put("alreadyLeftEarly", alreadyLeftEarly);
 	        response.put("courseStartTime", courseTimings.get("courseStartTime"));
 	        response.put("courseEndTime", courseTimings.get("courseEndTime"));
 	        response.put("status", "success");
 	    } catch (Exception e) {
 	        e.printStackTrace();
 	        response.put("status", "error");
 	    }
 	    return response;
 	} // end of validateAttendance

 	
 	// 출석 버튼 누르면 실행되는거
 	@PostMapping("markAttendance")
 	@ResponseBody
 	public String markAttendance(@RequestParam int userNo, @RequestParam int courseNo) {
 		System.out.println("userNo : " + userNo + " courseNo : " + courseNo);
 	    try {
 	        attendanceService.markAttendance(userNo, courseNo, 1); // 1 for 출석
 	        return "successMarkAttendance";
 	    } catch (Exception e) {
 	        e.printStackTrace();
 	        return "failure";
 	    }
 	} // end of markAttendance
 
 	
 	// 조퇴 버튼 누르면 실행되는거
 	@PostMapping("markEarlyLeave")
 	@ResponseBody
 	public String markEarlyLeave(@RequestParam int userNo, @RequestParam int courseNo) {
 		System.out.println("userNo : " + userNo + " courseNo : " + courseNo);
 		try {
 			attendanceService.markEarlyLeave(userNo, courseNo, 3);
 			return "successMarkEarlyLeave";
 		}catch(Exception e){
 			e.printStackTrace();
 			return "failure";
 		}
 	}// end of markEarlyLeave
 	
 	
 	// 학생이 수강중인 강좌 목록 불러옴
 	@GetMapping("fetchOngoingCourses")
 	public List<CourseVO> fetchOngoingCourses(
 			@RequestParam("userNo") int userNo, 
 			@RequestParam("courseNo") int courseNo) {
 		System.out.println("fetchAttendanceRecords] userNo: " + userNo + "courseNo: " + courseNo );
 		
         List<CourseVO> attendanceRecords = attendanceService.getOngoingCourses(userNo);

         // Debugging logs to confirm data flow
         if (attendanceRecords == null || attendanceRecords.isEmpty()) {
             System.out.println("No ongoing courses found for userNo: " + userNo);
         } else {
        	 attendanceRecords.forEach(course -> System.out.println("Found course: " + course.getCourse_name()));
         }

         return attendanceRecords;  // JSON response
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
    		 @RequestParam int userNo,
		     @RequestParam(required = false) Integer courseNo,
		     @RequestParam(required = false) String startDate,
		     @RequestParam(required = false) String endDate,
		     @RequestParam(defaultValue = "0") int page,
		     @RequestParam(defaultValue = "10") int size
		    ) {
    	 
    	System.out.println("Parameters received:");
	    System.out.println("userNo: " + userNo);
	    System.out.println("courseNo: " + courseNo);
	    System.out.println("startDate: " + startDate);
	    System.out.println("endDate: " + endDate);
	    System.out.println("page: " + page);
	    System.out.println("size: " + size);
    	
    	int offset = page * size;
 		
    	Map<String, Object> params = new HashMap<>();
        params.put("userNo", userNo);
        params.put("courseNo", courseNo);
        params.put("startDate", startDate);
        params.put("endDate", endDate);
        params.put("offset", offset);
        params.put("limit", size);
 	    
 		System.out.println("Attendance List Size: " + params.size());
 		return attendanceService.getAttendanceRecords(params);
        
     } // end of fetchAttendanceRecords
		

    //================================================
   	//			Grade + Exam score  part
   	//================================================
    // 화면 출력
     @GetMapping("fetchExamYears")
     @ResponseBody
     public List<Integer> fetchExamYears(@RequestParam(value="userNo", required=false, defaultValue="28")
    		 int userNo){
    	 List<Integer> examYears = serviceTx.fetchExamYears(userNo); // 서비스단으로부터 가져옴
    	 System.out.println("Exam years fetched: " + examYears);
    	 return examYears;
     } // end of fetchExamYears
	
     
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
	  public String listGradeAndExams(@RequestParam(value="userNo", required=false, defaultValue="28")
		  int userNo, Model m) {
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
	 

	  @RequestMapping("stu_grade_details")
	  public String stuGradeDetails(@RequestParam("exam_no") int examNo, Model model) {
	      // Add logic to retrieve grade details
	      model.addAttribute("examNo", examNo);
	      return "student/stu_grade_details";
	  }// end of stuGradeDetails
	  
	  
     // JSON 반환 -> 차트 그리는 데에 넣어줄거. 자료 던져주는 역할만 한다.
     @GetMapping("fetchGradeAndExams")
     @ResponseBody
     public Map<String, Object> fetchGradeAndExams( 
    		 @RequestParam(value = "userNo", required = false, defaultValue = "28") int userNo,
    	     @RequestParam(value = "year", required = false) Integer year,
     		 @RequestParam(value = "exam_no", required = false) Integer examNo){
    	 
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
     @PostMapping("insertGradesAndExams")
     @ResponseBody
     public String insertGradesAndExams(@RequestBody Map<String, Object> data) {
	     try {
	    	 serviceTx.insertGradesAndExams(data);
	         return "successInsertGradesAndExams";
	     }catch(Exception e){
	    	 e.printStackTrace();
	         return "failure";
	     }
     }// end of insertGradesAndExams

     
} // 컨트롤러 마감.