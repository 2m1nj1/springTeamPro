package com.javaclass.teamAcademy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	
	@RequestMapping("stu_{view}.do")
	public String returnView(@PathVariable String view) {
		return "student/stu_" + view;
	} // end of returnView

	
	//================================================
	//				Homework part
	//================================================
	// 데이터 물어오는 라우팅(루팅, routing) - [학생] 과제제출 페이지랑 연결.
    @RequestMapping("homeworkList")
    public String getHomeworkList(Model m, HomeworkVO vo) {
        // Fetch homework data using the service
        List<HomeworkVO> homeworkList = homeworkService.getHomeworkList(vo);
        m.addAttribute("homeworkList", homeworkList);
        return "stu_homework.do"; // Renders student/stu_homework.jsp
    } // end of getHomeworkList
    
    
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
	
     
     // 시험 정보와 그에 상응하는 점수 값들을 불러옴.
	  @GetMapping("stu_grade") public String listGradeAndExams(@RequestParam(value="userNo", required=false, defaultValue="28")
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
	 
     
     // JSON 반환 -> 차트 그리는 데에 넣어줄거. 자료 던져주는 역할만 한다.
     @GetMapping("fetchGradeAndExams")
     @ResponseBody
     public Map<String, Object> fetchGradeAndExams( 
    		 @RequestParam(value = "userNo", required = false, defaultValue = "28") int userNo,
    	     @RequestParam(value = "year", required = false) Integer year) {
    	 
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
     }
  
     
} // 컨트롤러 마감.