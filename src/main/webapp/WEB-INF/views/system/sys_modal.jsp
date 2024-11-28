<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
<!-- Modal : 강사 목록 -->
<div class="modal fade" id="modal_course_instructor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="">강사 선택</h5>
        <button type="button" class="btn btn-close" data-dismiss="modal">
        	<i class="fa-solid fa-xmark"></i>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-hover" id="" width="100%" cellspacing="0">
        	<thead>
        		<tr>
        			<th></th>
        			<th>강사명</th>
        			<th>연락처</th>
        		</tr>
        	</thead>
        	
        	<tbody>
        		<tr>
        			<td><input class="chk_tch" type="radio" name="chk_selector" id="" value="1"></td>
        			<td>이민지</td>
        			<td>010-1111-1111</td>
        		</tr>
        		<tr>
        			<td><input class="chk_tch" type="radio" name="chk_selector" id="" value="2"></td>
        			<td>이민자</td>
        			<td>010-2222-2222</td>
        		</tr>
        		<tr>
        			<td><input class="chk_tch" type="radio" name="chk_selector" id="" value="3"></td>
        			<td>이만지</td>
        			<td>010-3333-3333</td>
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
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="">강의실 선택</h5>
        <button type="button" class="btn btn-close" data-dismiss="modal">
        	<i class="fa-solid fa-xmark"></i>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-hover" id="" width="100%" cellspacing="0">
        	<thead>
        		<tr>
        			<th></th>
        			<th>강의실명</th>
        			<th>위치</th>
        		</tr>
        	</thead>
        	
        	<tbody>
        		<tr>
        			<td><input class="chk_classroom" type="radio" name="chk_classroom" id="" value="1"></td>
        			<td>101호</td>
        			<td>1층 오른쪽</td>
        		</tr>
        		<tr>
        			<td><input class="chk_classroom" type="radio" name="chk_classroom" id="" value="2"></td>
        			<td>102호</td>
        			<td>1층 왼쪽</td>
        		</tr>
        		<tr>
        			<td><input class="chk_classroom" type="radio" name="chk_classroom" id="" value="3"></td>
        			<td>201호</td>
        			<td>2층 어딘가...</td>
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
<!-- end of Modal : 강의실 목록 -->