<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!-- Modal : 강사 목록 -->
<div class="modal fade" id="modal_course_instructor" tabindex="-1" >
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="">강사 선택</h5>
        <button type="button" class="btn btn-close" data-dismiss="modal">
        	<i class="fa-solid fa-xmark"></i>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row mb-3">
      		<div class="col-4">
      			<select class="custom-select custom-select-sm">
					<option value="0">선택해주세요</option>
					<option value="1">회원번호</option>
					<option value="2">강사명</option>
				</select>
      		</div>
   			<div class="col-5">
   				<input id="selectKeyWord" type="text" class="form-control form-control-sm">
   			</div>
   			<div class="col-3">
   				<div id="btnOptSelectTch" class="btn btn-primary btn-sm btn-block">검색</div>
   			</div>
      	</div>
      	
      	<div class="row">
      		<div class="col">
      			 <table id="modalTchList" class="table table-hover" id="" width="100%" cellspacing="0">
		        	<thead>
		        		<tr>
		        			<th></th>
		        			<th>회원번호</th>
		        			<th>강사명</th>
		        			<th>연락처</th>
		        		</tr>
		        	</thead>
		        	
		        	<tbody>
		        		
		        	</tbody>
		        </table>
      		</div>
      	</div>
      	
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary btnSysModalAdd">선택</button></div>
    </div>
  </div>
</div>
<!-- end of Modal : 강사 목록 -->


<!-- Modal : 강좌 목록 -->
<div class="modal fade" id="modal_course_name" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="">강좌 선택</h5>
        <button type="button" class="btn btn-close" data-dismiss="modal">
        	<i class="fa-solid fa-xmark"></i>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-hover" id="" width="100%" cellspacing="0">
        	<thead>
        		<tr>
        			<th></th>
        			<th>강좌명</th>
        			<th>담당강사</th>
        		</tr>
        	</thead>
        	
        	<tbody>
        		<tr>
        			<td><input class="chk_classroom" type="radio" name="chk_classroom" id="" value="1"></td>
        			<td>js조지기</td>
        			<td>김승민쌤</td>
        		</tr>
        		<tr>
        			<td><input class="chk_classroom" type="radio" name="chk_classroom" id="" value="2"></td>
        			<td>자바교실</td>
        			<td>김승민</td>
        		</tr>
        		<tr>
        			<td><input class="chk_classroom" type="radio" name="chk_classroom" id="" value="3"></td>
        			<td>파이썬뽀개기</td>
        			<td>김승민</td>
        		</tr>
        	</tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary btnSysModalAdd">선택</button></div>
    </div>
  </div>
</div>
<!-- end of Modal : 강좌 목록 -->

<!-- Modal : 강의실 목록 -->
<div class="modal fade" id="modal_course_classroom" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="">강의실 선택</h5>
        <button type="button" class="btn btn-close" data-dismiss="modal">
        	<i class="fa-solid fa-xmark"></i>
        </button>
      </div>
      <div class="modal-body row">
      	
      	<!-- 강의실 조회 -->
      	<div class="col-7 classroomModal">
      		<div class="row mb-3">
      			<div class="text font-weight-bold text-uppercase">
					강의실 조회
				</div>
      		</div>
      		<div class="row mb-3">
      			<div class="col-9">
      				<input type="text" id="selectKeyword" class="form-control form-control-sm" placeholder="검색할 강의실명을 입력해주세요">
      			</div>
      			<div class="col-3">
      				<div id="btnOptSelectClassroom" class="btn btn-primary btn-sm btn-block">검색</div>
      			</div>
      		</div>
      		
      		<div class="row">
      			<table id="modalClassroomList" class="table table-hover table-head-fix" id="" cellspacing="0">
	        	<thead>
	        		<tr>
	        			<th></th>
	        			<th>강의실명</th>
	        			<th>위치</th>
	        		</tr>
	        	</thead>
	        	
	        	<tbody>
	        	</tbody>
	        </table>
      		</div>
      		
      	</div>
      	
      	
      	<!-- 새 강의실 등록 -->
      	<div class="col-5 classroomModal">
      		<div class="row mb-3">
      			<div class="text font-weight-bold text-uppercase">
					강의실 등록
				</div>
      		</div>
      		<div class="row mb-3">
				<label class="col-sm-4 col-form-label">강의실명</label>
				<div class="col-sm-8">
					<input type="text" class="form-control form-control-sm"
						id="" name="" value="">
				</div>
      		</div>
      		
      		<div class="row mb-3">
				<label class="col-sm-4 col-form-label">위치</label>
				<div class="col-sm-8">
					<input type="text" class="form-control form-control-sm"
						id="" name="" value="">
				</div>
      		</div>
      		
      		<div class="row mb-3">
				<a href="#" class="btn btn-primary btn-block btn-sm">등록</a>
      		</div>
      		
      	</div>
      
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary btnSysModalAdd">선택</button></div>
    </div>
  </div>
</div>
<!-- end of Modal : 강의실 목록 -->