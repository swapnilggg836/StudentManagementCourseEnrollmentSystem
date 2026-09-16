<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- =========================================================
     HEADER
========================================================= -->

<jsp:include page="../common/header.jsp" />


<!-- =========================================================
     ADMIN APPLICATION
========================================================= -->

<div class="admin-app">


    <!-- =====================================================
         SIDEBAR
    ====================================================== -->

    <jsp:include page="../common/sidebar.jsp" />


    <!-- =====================================================
         MAIN AREA
    ====================================================== -->

    <div class="admin-main">


        <!-- =================================================
             NAVBAR
        ================================================== -->

        <jsp:include page="../common/navbar.jsp" />


        <!-- =================================================
             PAGE CONTENT
        ================================================== -->

        <main class="admin-content">


            <!-- =================================================
                 PAGE HEADER
            ================================================== -->

            <div class="page-header">

                <div class="page-header-left">

                    <div class="breadcrumb-area">

                        <span>
                            EduManage
                        </span>

                        <i class="bi bi-chevron-right"></i>

                        <span>
                            Admin Dashboard
                        </span>

                    </div>


                    <h1 class="page-title">
                        Registrar &amp; Executive Overview
                    </h1>

                </div>


                <!-- ACTION BUTTONS -->

                <div class="page-header-actions">

                    <a href="${pageContext.request.contextPath}/admin/students/add"
                       class="btn btn-primary">

                        <i class="bi bi-person-plus-fill me-2"></i>

                        Add Student

                    </a>


                    <a href="${pageContext.request.contextPath}/admin/courses/add"
                       class="btn btn-outline-primary">

                        <i class="bi bi-plus-circle me-2"></i>

                        Add Course

                    </a>

                </div>

            </div>


            <!-- =================================================
                 STATISTICS CARDS
            ================================================== -->

            <div class="dashboard-stat-grid">


                <!-- STUDENTS -->

                <div class="dashboard-stat-card">

                    <div class="stat-card-top">

                        <span class="stat-label">
                            STUDENTS
                        </span>

                        <div class="stat-icon stat-icon-blue">

                            <i class="bi bi-people-fill"></i>

                        </div>

                    </div>


                    <div class="stat-number">
                        10
                    </div>


                    <div class="stat-status stat-status-green">

                        <i class="bi bi-arrow-up"></i>

                        +12% this sem

                    </div>

                </div>


                <!-- COURSES -->

                <div class="dashboard-stat-card">

                    <div class="stat-card-top">

                        <span class="stat-label">
                            COURSES
                        </span>

                        <div class="stat-icon stat-icon-green">

                            <i class="bi bi-journal-bookmark-fill"></i>

                        </div>

                    </div>


                    <div class="stat-number">
                        8
                    </div>


                    <div class="stat-status stat-status-neutral">
                        Active Catalog
                    </div>

                </div>


                <!-- FACULTY -->

                <div class="dashboard-stat-card">

                    <div class="stat-card-top">

                        <span class="stat-label">
                            FACULTY
                        </span>

                        <div class="stat-icon stat-icon-purple">

                            <i class="bi bi-person-badge-fill"></i>

                        </div>

                    </div>


                    <div class="stat-number">
                        5
                    </div>


                    <div class="stat-status stat-status-neutral">
                        5 Departments
                    </div>

                </div>


                <!-- ENROLLMENTS -->

                <div class="dashboard-stat-card">

                    <div class="stat-card-top">

                        <span class="stat-label">
                            ENROLLMENTS
                        </span>

                        <div class="stat-icon stat-icon-yellow">

                            <i class="bi bi-card-checklist"></i>

                        </div>

                    </div>


                    <div class="stat-number">
                        10
                    </div>


                    <div class="stat-status stat-status-yellow">
                        Confirmed Seats
                    </div>

                </div>


                <!-- PENDING -->

                <div class="dashboard-stat-card">

                    <div class="stat-card-top">

                        <span class="stat-label">
                            PENDING
                        </span>

                        <div class="stat-icon stat-icon-red">

                            <i class="bi bi-clock-history"></i>

                        </div>

                    </div>


                    <div class="stat-number">
                        1
                    </div>


                    <div class="stat-status stat-status-red">
                        Awaiting Payment
                    </div>

                </div>


                <!-- REVENUE -->

                <div class="dashboard-stat-card">

                    <div class="stat-card-top">

                        <span class="stat-label">
                            REVENUE
                        </span>

                        <div class="stat-icon stat-icon-cyan">

                            <i class="bi bi-currency-rupee"></i>

                        </div>

                    </div>


                    <div class="stat-number stat-revenue">
                        ₹98,500
                    </div>


                    <div class="stat-status stat-status-green">
                        Tuition Settled
                    </div>

                </div>

            </div>


            <!-- =================================================
                 CHART SECTION
            ================================================== -->

            <div class="dashboard-chart-grid">


                <!-- =============================================
                     STUDENT ENROLLMENT TREND
                ============================================== -->

                <div class="dashboard-panel enrollment-chart-panel">


                    <div class="panel-header">

                        <div>

                            <h2 class="panel-title">
                                Student Enrollment Trend
                            </h2>

                            <p class="panel-subtitle">
                                Monthly registrations across semesters
                            </p>

                        </div>


                        <span class="academic-badge">
                            Academic Year 2026
                        </span>

                    </div>


                    <!-- Chart -->

                    <div class="chart-container">

                        <canvas id="enrollmentTrendChart"></canvas>

                    </div>

                </div>


                <!-- =============================================
                     DEPARTMENT SHARE
                ============================================== -->

                <div class="dashboard-panel department-chart-panel">


                    <div class="panel-header">

                        <div>

                            <h2 class="panel-title">
                                Department Share
                            </h2>

                            <p class="panel-subtitle">
                                Enrolled student distribution
                            </p>

                        </div>

                    </div>


                    <!-- Chart -->

                    <div class="department-chart-container">

                        <canvas id="departmentShareChart"></canvas>

                    </div>


                    <!-- Legend -->

                    <div class="department-legend">

                        <div class="legend-item">

                            <span class="legend-color legend-blue"></span>

                            <span>CS</span>

                        </div>


                        <div class="legend-item">

                            <span class="legend-color legend-green"></span>

                            <span>IT</span>

                        </div>


                        <div class="legend-item">

                            <span class="legend-color legend-orange"></span>

                            <span>ME</span>

                        </div>


                        <div class="legend-item">

                            <span class="legend-color legend-red"></span>

                            <span>CE</span>

                        </div>


                        <div class="legend-item">

                            <span class="legend-color legend-purple"></span>

                            <span>ET</span>

                        </div>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 LOWER DASHBOARD AREA
            ================================================== -->

            <div class="dashboard-panel dashboard-summary-panel">


                <div class="panel-header">

                    <div>

                        <h2 class="panel-title">
                            Department Operational Summary
                        </h2>

                        <p class="panel-subtitle">
                            Current academic activity across departments
                        </p>

                    </div>


                    <a href="${pageContext.request.contextPath}/admin/reports"
                       class="panel-link">

                        View Reports

                        <i class="bi bi-arrow-right"></i>

                    </a>

                </div>


                <div class="summary-table-wrapper">

                    <table class="dashboard-table">

                        <thead>

                            <tr>

                                <th>
                                    Department
                                </th>

                                <th>
                                    Students
                                </th>

                                <th>
                                    Courses
                                </th>

                                <th>
                                    Faculty
                                </th>

                                <th>
                                    Enrollment
                                </th>

                                <th>
                                    Status
                                </th>

                            </tr>

                        </thead>


                        <tbody>

                            <tr>

                                <td>
                                    <strong>
                                        Computer Science &amp; Engineering
                                    </strong>
                                </td>

                                <td>
                                    120
                                </td>

                                <td>
                                    8
                                </td>

                                <td>
                                    5
                                </td>

                                <td>
                                    85%
                                </td>

                                <td>

                                    <span class="status-badge status-active">
                                        Active
                                    </span>

                                </td>

                            </tr>


                            <tr>

                                <td>
                                    <strong>
                                        Information Technology
                                    </strong>
                                </td>

                                <td>
                                    95
                                </td>

                                <td>
                                    6
                                </td>

                                <td>
                                    4
                                </td>

                                <td>
                                    78%
                                </td>

                                <td>

                                    <span class="status-badge status-active">
                                        Active
                                    </span>

                                </td>

                            </tr>


                            <tr>

                                <td>
                                    <strong>
                                        Mechanical Engineering
                                    </strong>
                                </td>

                                <td>
                                    82
                                </td>

                                <td>
                                    7
                                </td>

                                <td>
                                    4
                                </td>

                                <td>
                                    71%
                                </td>

                                <td>

                                    <span class="status-badge status-active">
                                        Active
                                    </span>

                                </td>

                            </tr>

                        </tbody>

                    </table>

                </div>

            </div>


        </main>


        <!-- =================================================
             FOOTER
        ================================================== -->

        <jsp:include page="../common/footer.jsp" />

    </div>

</div>