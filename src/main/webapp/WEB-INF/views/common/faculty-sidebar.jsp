<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="faculty-sidebar">

    <div class="faculty-brand">

        <div class="faculty-brand-icon">
            <i class="bi bi-mortarboard-fill"></i>
        </div>

        <div>
            <div class="faculty-brand-name">
                EduManage
            </div>

            <div class="faculty-brand-subtitle">
                Faculty Portal
            </div>
        </div>

    </div>


    <div class="faculty-menu">

        <div class="faculty-menu-label">
            MAIN MENU
        </div>


        <a href="${pageContext.request.contextPath}/faculty/dashboard"
           class="faculty-menu-item">

            <i class="bi bi-grid-1x2-fill"></i>

            <span>Dashboard</span>

        </a>


        <a href="${pageContext.request.contextPath}/faculty/profile"
           class="faculty-menu-item">

            <i class="bi bi-person-circle"></i>

            <span>Profile</span>

        </a>


        <a href="${pageContext.request.contextPath}/faculty/courses"
           class="faculty-menu-item">

            <i class="bi bi-book"></i>

            <span>My Courses</span>

        </a>


        <a href="${pageContext.request.contextPath}/faculty/students"
           class="faculty-menu-item">

            <i class="bi bi-people"></i>

            <span>Students</span>

        </a>


        <div class="faculty-menu-label mt-4">
            ACADEMIC
        </div>


        <a href="${pageContext.request.contextPath}/faculty/attendance"
           class="faculty-menu-item">

            <i class="bi bi-calendar-check"></i>

            <span>Attendance</span>

        </a>


        


        <div class="faculty-menu-label mt-4">
            ACCOUNT
        </div>


        <a href="${pageContext.request.contextPath}/logout"
           class="faculty-menu-item faculty-logout">

            <i class="bi bi-box-arrow-right"></i>

            <span>Logout</span>

        </a>

    </div>

</div>