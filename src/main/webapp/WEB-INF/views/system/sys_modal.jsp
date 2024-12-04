<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Modal : 강사 목록 -->
<div class="modal fade" id="modal_course_instructor" tabindex="-1">
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
						<input id="selectKeyWord" type="text"
							class="form-control form-control-sm">
					</div>
					<div class="col-3">
						<div id="btnOptSelectTch" class="btn btn-primary btn-sm btn-block">검색</div>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<table id="modalTchList" class="table table-hover" id=""
							width="100%" cellspacing="0">
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
			<div class="modal-body row">
				<div class="col">
					<button type="button" class="btn btn-secondary btn-block"
						data-dismiss="modal">닫기</button>
				</div>
				<div class="col">
					<button type="button" id="btnTeacher"
						class="btn btn-primary btn-block btnSysModalAdd">선택</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end of Modal : 강사 목록 -->


<!-- Modal : 강좌 목록 -->
<div class="modal fade" id="modal_course_name" tabindex="-1"
	aria-hidden="true">
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
							<td><input class="chk_classroom" type="radio"
								name="chk_classroom" id="" value="1"></td>
							<td>js조지기</td>
							<td>김승민쌤</td>
						</tr>
						<tr>
							<td><input class="chk_classroom" type="radio"
								name="chk_classroom" id="" value="2"></td>
							<td>자바교실</td>
							<td>김승민</td>
						</tr>
						<tr>
							<td><input class="chk_classroom" type="radio"
								name="chk_classroom" id="" value="3"></td>
							<td>파이썬뽀개기</td>
							<td>김승민</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btnSysModalAdd">선택</button>
			</div>
		</div>
	</div>
</div>
<!-- end of Modal : 강좌 목록 -->

<!-- Modal : 강의실 목록 -->
<div class="modal fade" id="modal_course_classroom" tabindex="-1"
	aria-hidden="true">
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
						<div class="text font-weight-bold text-uppercase">강의실 조회</div>
					</div>
					<div class="row mb-3">
						<div class="col-9">
							<input type="text" id="selectKeyword"
								class="form-control form-control-sm"
								placeholder="검색할 강의실명을 입력해주세요">
						</div>
						<div class="col-3">
							<div id="btnOptSelectClassroom"
								class="btn btn-primary btn-sm btn-block">검색</div>
						</div>
					</div>
					
					<div class="row">
						<table id="modalClassroomList"
							class="table table-hover table-head-fix" cellspacing="0">
							<thead>
								<tr>
									<th></th>
									<th>강의실명</th>
									<th>위치</th>
									<th></th>
								</tr>
							</thead>

							<tbody>
							</tbody>
						</table>
					</div>

				</div>


				<!-- right -->
				<div class="col-5">
					<!-- 새 강의실 등록 -->
					<div class="row mb-5">
						<div id="classroomInsertSpace" class="classroomModal">
							<div class="row mb-3">
								<div class="text font-weight-bold text-uppercase">강의실 등록</div>
							</div>
							
							<form action="" id="classroomInsertForm" method="post">
								<!-- 강의실 pk -->
	
								<div class="row mb-3">
									<label class="col-sm-4 col-form-label">강의실명</label>
									<div class="col-sm-8">
										<input type="text" class="form-control form-control-sm"
											id="classroomName" name="classroom_name" value="">
									</div>
								</div>
	
								<div class="row mb-3">
									<label class="col-sm-4 col-form-label">위치</label>
									<div class="col-sm-8">
										<input type="text" class="form-control form-control-sm"
											id="classroomLoc" name="classroom_location" value="">
									</div>
								</div>
							</form>

							<div class="row mb-3">
								<div class="col-sm">
									<div id="btnClassroomInsert" class="btn btn-primary btn-sm btn-block">등록</div>
								</div>
							</div>

						</div>
					</div>

					<div class="row mb-3">
						<!-- 강의실 상세 (수정/삭제) -->
						<div id="classroomDetailSpace" class="classroomModal">
							<div class="row mb-3">
								<div class="text font-weight-bold text-uppercase">강의실 상세</div>
							</div>
							
							<form action="" id="classroomDetailForm" method="post">
								<!-- 강의실 pk -->
								<input type="hidden" class="form-control form-control-sm"
									id="detailClassroomNo" name="classroom_no" value="">
	
								<div class="row mb-3">
									<label class="col-sm-4 col-form-label">강의실명</label>
									<div class="col-sm-8">
										<input type="text" class="form-control form-control-sm"
											id="detailClassroomName" name="classroom_name" value="" readonly>
									</div>
								</div>
	
								<div class="row mb-3">
									<label class="col-sm-4 col-form-label">위치</label>
									<div class="col-sm-8">
										<input type="text" class="form-control form-control-sm"
											id="detailClassroomLoc" name="classroom_location" value="" readonly>
									</div>
								</div>
							</form>
							
							<div class="row">
								<div id="btnClassroomDeleteOn" class="col">
									<div id="btnClassroomDelete" class="btn btn-secondary btn-block btn-sm btnDetail" style="display: none;">삭제</div>
								</div>
								<div class="col">
									<div id="btnClassroomUpdate" class="btn btn-primary btn-block btn-sm btnDetail" style="display: none;">저장</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end of right -->

			</div>

			<div class=" modal-body row">
				<div class="col">
					<button type="button" class="btn btn-secondary btn-block"
						data-dismiss="modal">닫기</button>
				</div>
				<div class="col">
					<button type="button" id="btnClassroom"
						class="btn btn-primary btn-block btnSysModalAdd">선택</button>
				</div>
			</div>

		</div>


	</div>
</div>
<!-- end of Modal : 강의실 목록 -->