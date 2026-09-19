<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp" %>

<%@ include file="../common/faculty-sidebar.jsp" %>

<%@ include file="../common/faculty-navbar.jsp" %>


<div class="faculty-main-content">


    <!-- PAGE HEADER -->

    <div class="faculty-page-header">

        <div>

            <h2 class="fw-bold mb-1">
                Faculty Dashboard
            </h2>

            <p class="text-muted mb-0">
                Welcome back, ${faculty.firstName}.
                Here's an overview of your academic activities.
            </p>

        </div>

    </div>


    <!-- SUMMARY CARDS -->

    <div class="row g-4 mb-4">


        <!-- ASSIGNED COURSES -->

        <div class="col-md-6 col-xl-3">

            <div class="card border-0 shadow-sm faculty-stat-card">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-start">

                        <div>

                            <div class="faculty-stat-label">
                                Assigned Courses
                            </div>

                            <h3 class="faculty-stat-value">
                                ${dashboardStats.assignedCourses}
                            </h3>

                            <div class="faculty-stat-description">
                                Courses assigned to you
                            </div>

                        </div>


                        <div class="faculty-stat-icon faculty-icon-blue">

                            <i class="bi bi-book-fill"></i>

                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- TOTAL STUDENTS -->

        <div class="col-md-6 col-xl-3">

            <div class="card border-0 shadow-sm faculty-stat-card">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-start">

                        <div>

                            <div class="faculty-stat-label">
                                Total Students
                            </div>

                            <h3 class="faculty-stat-value">
                                ${dashboardStats.totalStudents}
                            </h3>

                            <div class="faculty-stat-description">
                                Currently enrolled
                            </div>

                        </div>


                        <div class="faculty-stat-icon faculty-icon-green">

                            <i class="bi bi-people-fill"></i>

                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- TOTAL CAPACITY -->

        <div class="col-md-6 col-xl-3">

            <div class="card border-0 shadow-sm faculty-stat-card">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-start">

                        <div>

                            <div class="faculty-stat-label">
                                Total Capacity
                            </div>

                            <h3 class="faculty-stat-value">
                                ${dashboardStats.totalCapacity}
                            </h3>

                            <div class="faculty-stat-description">
                                Across your courses
                            </div>

                        </div>


                        <div class="faculty-stat-icon faculty-icon-purple">

                            <i class="bi bi-person-workspace"></i>

                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- DEPARTMENT -->

        <div class="col-md-6 col-xl-3">

            <div class="card border-0 shadow-sm faculty-stat-card">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-start">

                        <div>

                            <div class="faculty-stat-label">
                                Department
                            </div>

                            <h3 class="faculty-stat-value faculty-department-value">
                                ${dashboardStats.departmentName}
                            </h3>

                            <div class="faculty-stat-description">
                                ${dashboardStats.departmentCode}
                            </div>

                        </div>


                        <div class="faculty-stat-icon faculty-icon-orange">

                            <i class="bi bi-building"></i>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <!-- FACULTY INFORMATION -->

    <div class="row g-4">


        <!-- PROFILE CARD -->

        <div class="col-lg-4">

            <div class="card border-0 shadow-sm h-100">

                <div class="card-body p-4">

                    <div class="d-flex align-items-center mb-4">

                        <div class="faculty-profile-avatar">

                            <i class="bi bi-person-fill"></i>

                        </div>

                        <div class="ms-3">

                            <h5 class="fw-bold mb-1">
                                ${faculty.fullName}
                            </h5>

                            <p class="text-muted mb-0">
                                ${faculty.designation}
                            </p>

                        </div>

                    </div>


                    <div class="faculty-info-list">


                        <div class="faculty-info-item">

                            <div class="faculty-info-icon">

                                <i class="bi bi-person-badge"></i>

                            </div>

                            <div>

                                <div class="faculty-info-label">
                                    Employee Code
                                </div>

                                <div class="faculty-info-value">
                                    ${faculty.employeeCode}
                                </div>

                            </div>

                        </div>


                        <div class="faculty-info-item">

                            <div class="faculty-info-icon">

                                <i class="bi bi-envelope"></i>

                            </div>

                            <div>

                                <div class="faculty-info-label">
                                    Email
                                </div>

                                <div class="faculty-info-value">
                                    ${faculty.email}
                                </div>

                            </div>

                        </div>


                        <div class="faculty-info-item">

                            <div class="faculty-info-icon">

                                <i class="bi bi-building"></i>

                            </div>

                            <div>

                                <div class="faculty-info-label">
                                    Department
                                </div>

                                <div class="faculty-info-value">
                                    ${faculty.departmentName}
                                </div>

                            </div>

                        </div>


                        <div class="faculty-info-item">

                            <div class="faculty-info-icon">

                                <i class="bi bi-mortarboard"></i>

                            </div>

                            <div>

                                <div class="faculty-info-label">
                                    Qualification
                                </div>

                                <div class="faculty-info-value">
                                    ${faculty.qualification}
                                </div>

                            </div>

                        </div>


                    </div>


                    <a href="${pageContext.request.contextPath}/faculty/profile"
                       class="btn btn-outline-primary w-100 mt-3">

                        <i class="bi bi-person me-1"></i>

                        View Profile

                    </a>

                </div>

            </div>

        </div>


        <!-- ACADEMIC OVERVIEW -->

        <div class="col-lg-8">

            <div class="card border-0 shadow-sm h-100">

                <div class="card-body p-4">

                    <div class="d-flex justify-content-between align-items-center mb-4">

                        <div>

                            <h5 class="fw-bold mb-1">
                                Academic Overview
                            </h5>

                            <p class="text-muted small mb-0">
                                Your current teaching information
                            </p>

                        </div>

                        <div class="faculty-overview-icon">

                            <i class="bi bi-bar-chart-line-fill"></i>

                        </div>

                    </div>


                    <div class="faculty-overview-grid">


                        <div class="faculty-overview-item">

                            <div class="faculty-overview-number">
                                ${dashboardStats.assignedCourses}
                            </div>

                            <div class="faculty-overview-label">
                                Courses
                            </div>

                        </div>


                        <div class="faculty-overview-item">

                            <div class="faculty-overview-number">
                                ${dashboardStats.totalStudents}
                            </div>

                            <div class="faculty-overview-label">
                                Active Students
                            </div>

                        </div>


                        <div class="faculty-overview-item">

                            <div class="faculty-overview-number">
                                ${dashboardStats.totalCapacity}
                            </div>

                            <div class="faculty-overview-label">
                                Total Seats
                            </div>

                        </div>

                    </div>


                    <div class="faculty-quick-actions mt-4">

                        <h6 class="fw-bold mb-3">
                            Quick Actions
                        </h6>


                        <div class="row g-3">


                            <div class="col-md-4">

                                <a href="${pageContext.request.contextPath}/faculty/courses"
                                   class="faculty-quick-action">

                                    <i class="bi bi-book"></i>

                                    <span>
                                        My Courses
                                    </span>

                                </a>

                            </div>


                            <div class="col-md-4">

                                <a href="${pageContext.request.contextPath}/faculty/students"
                                   class="faculty-quick-action">

                                    <i class="bi bi-people"></i>

                                    <span>
                                        Students
                                    </span>

                                </a>

                            </div>


                            <div class="col-md-4">

                                <a href="${pageContext.request.contextPath}/faculty/attendance"
                                   class="faculty-quick-action">

                                    <i class="bi bi-calendar-check"></i>

                                    <span>
                                        Attendance
                                    </span>

                                </a>

                            </div>


                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>