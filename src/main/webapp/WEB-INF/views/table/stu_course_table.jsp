<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
	
<br/>
<div id="conCourseList">
	<!-- 강좌 1개 틀 -->
	<c:forEach var="item" items="${courseInfoList}">
		<div class="row stuDetailCourse">
			<input class="stuDetailCourseNo" type="hidden" value="${item.course_no}">
			
			
			<div class="col-5">
				<div class="row">
					<div class="col">
						<h6 class="font-weight-bold text-primary" style="display: inline;">${item.course_name}</h6>
						<span class="text">&nbsp;|&nbsp;${item.course_instructor}</span>
						<span class="text">&nbsp;|&nbsp;${item.classroom_name}</span>
					</div>
				</div>
				<hr />
				<div class="row">
					<div class="col">
						<span class="text">강좌 기간 : ${item.course_startDate}</span> <span
							class="text"> ~ ${item.course_endDate}&nbsp;|&nbsp;</span> <span
							class="text">${item.course_fee}&nbsp;원</span>
					</div>
				</div>
			</div>
			<div
				class="col-2 d-flex justify-content-center align-items-center flex-column">
				<c:forEach var="schList" items="${item.course_sch_list}">
					<div class="row">
						<div class="col text-center">
							<span class="text">${schList}</span>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-4 justify-content-center align-items-center">
				<div class="row">
					<div class="col">
						<span class="text">출석률 : </span>
						<span class="text">${item.attendance_rate}%&nbsp;&nbsp;</span>
						<div class="btn btn-sm btn-primary"><i class="fa-solid fa-gear fa-sm"></i></div>
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col">
						<div class="progress" style="width: 100%;">
							  <div class="progress-bar" role="progressbar"
						            style="width: ${item.attendance_rate}%;" aria-valuenow="${item.attendance_rate}" aria-valuemin="0" aria-valuemax="100">
						            ${item.attendance_rate}%
						       </div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-1 d-flex justify-content-center align-items-center">
				<div id="btnStuDetailCourseCancel" 
				class="btn btn-sm btn-secondary btn-block">수강<br>취소</div>
			</div>
		</div>
		<hr />
	</c:forEach>
	<!-- end of 강좌 1개 틀 -->
</div>
<!-- end of ConList -->