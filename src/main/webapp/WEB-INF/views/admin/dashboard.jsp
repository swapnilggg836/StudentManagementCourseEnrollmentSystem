<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../common/header.jsp" />

<div class="admin-app">

    <jsp:include page="../common/sidebar.jsp" />

    <div class="admin-main">

        <jsp:include page="../common/navbar.jsp" />

        <main class="admin-content">

            <!-- PAGE HEADER -->
            <div class="page-header">

                <div class="page-header-left">

                    <div class="breadcrumb-area">
                        <span>EduManage</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>Admin Dashboard</span>
                    </div>

                    <h1 class="page-title">
                        Registrar &amp; Executive Overview
                    </h1>

                </div>

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


            <!-- STATISTICS CARDS -->
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

                    <div class="stat-value">
                        ${stats.totalStudents}
                    </div>

                    <div class="stat-status stat-status-green">
                        <i class="bi bi-arrow-up"></i>
                        Total Registered
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

                    <div class="stat-value">
                        ${stats.totalCourses}
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

                    <div class="stat-value">
                        ${stats.totalFaculty}
                    </div>

                    <div class="stat-status stat-status-neutral">
                        Teaching Staff
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

                    <div class="stat-value">
                        ${stats.totalEnrollments}
                    </div>

                    <div class="stat-status stat-status-yellow">
                        Confirmed Seats
                    </div>

                </div>


                <!-- PENDING PAYMENTS -->
                <div class="dashboard-stat-card">

                    <div class="stat-card-top">

                        <span class="stat-label">
                            PENDING
                        </span>

                        <div class="stat-icon stat-icon-red">
                            <i class="bi bi-clock-history"></i>
                        </div>

                    </div>

                    <div class="stat-value">
                        ${stats.pendingPayments}
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

                    <div class="stat-value">
                        ₹${stats.totalRevenue}
                    </div>

                    <div class="stat-status stat-status-green">
                        Tuition Settled
                    </div>

                </div>

            </div>


            <!-- CHART SECTION -->
            <div class="dashboard-chart-grid">

                <!-- STUDENT ENROLLMENT TREND -->
                <div class="dashboard-panel enrollment-chart-panel">

                    <div class="panel-header">

                        <div>

                            <h2 class="panel-title">
                                Student Enrollment Trend
                            </h2>

                            <p class="panel-subtitle">
                                Monthly enrollments across semesters
                            </p>

                        </div>

                        <span class="academic-badge">
                            Academic Year 2026
                        </span>

                    </div>

                    <div class="chart-container">
                        <canvas id="enrollmentTrendChart"></canvas>
                    </div>

                </div>


                <!-- DEPARTMENT SHARE -->
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

                    <div class="department-chart-container">
                        <canvas id="departmentShareChart"></canvas>
                    </div>


                    <!-- DYNAMIC DEPARTMENT LEGEND -->
                    <div class="department-legend">

                        <c:forEach var="department"
                                   items="${departmentShare}"
                                   varStatus="status">

                            <div class="legend-item">

                                <span class="${status.index == 0 ? 'legend-blue' :
                                              status.index == 1 ? 'legend-green' :
                                              status.index == 2 ? 'legend-orange' :
                                              status.index == 3 ? 'legend-red' :
                                              'legend-purple'}">
                                </span>

                                <span>
                                    ${department.departmentCode}
                                </span>

                            </div>

                        </c:forEach>

                    </div>

                </div>

            </div>


            <!-- DEPARTMENT OPERATIONAL SUMMARY -->
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

                            <c:choose>

                                <c:when test="${not empty departmentSummary}">

                                    <c:forEach var="department"
                                               items="${departmentSummary}">

                                        <tr>

                                            <td>

                                                <strong>
                                                    ${department.departmentName}
                                                </strong>

                                                <small style="display:block;
                                                              color:#94a3b8;
                                                              margin-top:3px;">
                                                    ${department.departmentCode}
                                                </small>

                                            </td>


                                            <td>
                                                ${department.studentCount}
                                            </td>


                                            <td>
                                                ${department.courseCount}
                                            </td>


                                            <td>
                                                ${department.facultyCount}
                                            </td>


                                            <td>
                                                ${department.enrollmentPercentage}%
                                            </td>


                                            <td>

                                                <c:choose>

                                                    <c:when test="${department.status == 'Active'}">

                                                        <span class="status-badge status-active">
                                                            Active
                                                        </span>

                                                    </c:when>

                                                    <c:otherwise>

                                                        <span class="status-badge">
                                                            Inactive
                                                        </span>

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>

                                        </tr>

                                    </c:forEach>

                                </c:when>


                                <c:otherwise>

                                    <tr>

                                        <td colspan="6"
                                            style="text-align:center;
                                                   padding:30px;
                                                   color:#94a3b8;">

                                            No department data available.

                                        </td>

                                    </tr>

                                </c:otherwise>

                            </c:choose>

                        </tbody>

                    </table>

                </div>

            </div>

        </main>


        <jsp:include page="../common/footer.jsp" />

    </div>

</div>


<!-- BACKEND DATA FOR JAVASCRIPT -->

<script>

    /*
     * ========================================================
     * ADMIN DASHBOARD BACKEND DATA
     * ========================================================
     *
     * MySQL
     *    ↓
     * DashboardRepository
     *    ↓
     * DashboardService
     *    ↓
     * AdminController
     *    ↓
     * dashboard.jsp
     *    ↓
     * script.js
     */


    /* ========================================================
       STUDENT ENROLLMENT TREND DATA
       ======================================================== */

    window.enrollmentTrendData = [

        <c:forEach var="trend"
                   items="${enrollmentTrend}"
                   varStatus="status">

            {
                month: "${trend.month}",
                totalEnrollments: ${trend.totalEnrollments}
            }

            <c:if test="${!status.last}">
                ,
            </c:if>

        </c:forEach>

    ];


    /* ========================================================
       DEPARTMENT SHARE DATA
       ======================================================== */

    window.departmentShareData = [

        <c:forEach var="department"
                   items="${departmentShare}"
                   varStatus="status">

            {
                code: "${department.departmentCode}",
                name: "${department.departmentName}",
                studentCount: ${department.studentCount}
            }

            <c:if test="${!status.last}">
                ,
            </c:if>

        </c:forEach>

    ];


    /* ========================================================
       DEBUG DATA
       ======================================================== */

    console.log(
        "Enrollment Trend Data:",
        window.enrollmentTrendData
    );

    console.log(
        "Department Share Data:",
        window.departmentShareData
    );

</script>