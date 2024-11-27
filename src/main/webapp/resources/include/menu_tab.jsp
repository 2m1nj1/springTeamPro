<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
    <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">교담</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
<!--             <li class="nav-item active"> -->
<!--                 <a class="nav-link" href="index.jsp"> -->
<!--                     <i class="fas fa-fw fa-tachometer-alt"></i> -->
<!--                     <span>Dashboard</span></a> -->
<!--             </li> -->

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>수강생</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Custom Components:</h6> -->
                        <a class="collapse-item" href="stu_course_regi.do">수강신청</a>
                        <a class="collapse-item" href="stu_lecture_select.do">강좌조회</a>
                        <a class="collapse-item" href="stu_attendance.do">출결조회</a>
                        <a class="collapse-item" href="stu_homework.do">과제제출</a>
                        <a class="collapse-item" href="stu_grade.do">성적조회</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>강사</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="tch_stu_select.do">수강생조회</a>
                        <a class="collapse-item" href="tch_attendance.do">출결관리</a>
                        <a class="collapse-item" href="tch_homework.do">과제관리</a>
                        <a class="collapse-item" href="tch_garde.do">성적조회</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <!-- <div class="sidebar-heading">
                Addons
            </div> -->
            
            
            <!-- Nav Item - 쪽지 -->
            <li class="nav-item">
                <a class="nav-link" href="comm_message.do">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>쪽지</span></a>
            </li>
	
			<!-- Nav Item - 커뮤니티 -->
            <li class="nav-item">
                <a class="nav-link" href="comm_community.do">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>커뮤니티</span></a>
            </li>
            
            <!-- Nav Item - 공지사항 -->
            <li class="nav-item">
                <a class="nav-link" href="comm_notice.do">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>공지사항</span></a>
            </li>
	
			<!-- Nav Item - 문의사항 -->
            <li class="nav-item">
                <a class="nav-link" href="comm_inquiry.do">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>문의하기</span></a>
            </li>
            
			<!-- Divider -->
            <hr class="sidebar-divider">
			
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>마이페이지</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="stu_info.do">수강생개인정보</a>
                        <a class="collapse-item" href="tch_info.do">강사개인정보</a>
                        <a class="collapse-item" href="stu_profile.do">수강생프로필</a>
                        <a class="collapse-item" href="tch_profile.do">강사프로필</a>
                        <a class="collapse-item" href="stu_payment.do">결제관리</a>
                    </div>
                </div>
            </li>

			<!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>관리자</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="sys_student.do">수강생관리</a>
                        <a class="collapse-item" href="sys_teacher.do">강사관리</a>
                        <a class="collapse-item" href="sys_lecture.do">강좌관리</a>
                        <a class="collapse-item" href="sys_classroom.do">강의실관리</a>
                        <a class="collapse-item" href="sys_notice.do">공지사항관리</a>
                        <a class="collapse-item" href="sys_community.do">커뮤니티관리</a>
                        <a class="collapse-item" href="sys_inquriy.do">문의관리</a>
                        <a class="collapse-item" href="sys_declar.do">신고관리</a>
                        
                    </div>
                </div>
            </li>
				
            <!-- Nav Item - 로그인 -->
            <li class="nav-item">
                <a class="nav-link" href="comm_login.do">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>로그인</span></a>
            </li>

            <!-- Nav Item - 로그아웃 -->
            <li class="nav-item">
                <a class="nav-link" href="comm_logout.do">
                    <i class="fas fa-fw fa-table"></i>
                    <span>로그아웃</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->
<!--             <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
            </div> -->

        </ul>
        <!-- End of Sidebar -->