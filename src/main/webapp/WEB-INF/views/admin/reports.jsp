<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../common/header.jsp" />

<div class="admin-app">

    <jsp:include page="../common/sidebar.jsp" />

    <div class="admin-main">

        <jsp:include page="../common/navbar.jsp" />

        <main class="admin-content">


            <!-- =================================================
                 PAGE HEADER
                 ================================================= -->

            <div class="page-header">

                <div class="page-header-left">

                    <div class="breadcrumb-area">

                        <span>EduManage</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>Admin</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>Reports</span>

                    </div>

                    <h1 class="page-title">
                        Reports & Analytics
                    </h1>

                    <p class="text-muted mb-0 mt-1">
                        Generate academic, enrollment and payment reports
                    </p>

                </div>


                <div class="page-header-actions">

                    <a href="${pageContext.request.contextPath}/admin/reports/export?type=${reportType}&deptId=${selectedDeptId}&semester=${selectedSemester}&status=${selectedStatus}&dateFrom=${dateFrom}&dateTo=${dateTo}"
                       class="btn btn-success">

                        <i class="bi bi-download me-1"></i>
                        Export CSV

                    </a>

                    <button type="button"
                            onclick="window.print()"
                            class="btn btn-outline-secondary">

                        <i class="bi bi-printer me-1"></i>
                        Print

                    </button>

                </div>

            </div>


            <!-- =================================================
                 REPORT TYPE
                 ================================================= -->

            <div class="content-card mb-4">

                <div class="row g-3 align-items-end">

                    <div class="col-lg-3 col-md-6">

                        <label class="form-label">
                            Report Type
                        </label>

                        <select id="reportType"
                                class="form-select"
                                onchange="changeReportType(this.value)">

                            <option value="students"
                                <c:if test="${reportType == 'students'}">
                                    selected
                                </c:if>>
                                Student Report
                            </option>

                            <option value="courses"
                                <c:if test="${reportType == 'courses'}">
                                    selected
                                </c:if>>
                                Course Report
                            </option>

                            <option value="enrollments"
                                <c:if test="${reportType == 'enrollments'}">
                                    selected
                                </c:if>>
                                Enrollment Report
                            </option>

                            <option value="payments"
                                <c:if test="${reportType == 'payments'}">
                                    selected
                                </c:if>>
                                Payment Report
                            </option>

                        </select>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 FILTERS
                 ================================================= -->

            <div class="content-card mb-4">

                <div class="mb-3">

                    <h4 class="mb-1">
                        <i class="bi bi-funnel me-2"></i>
                        Report Filters
                    </h4>

                    <p class="text-muted mb-0">
                        Filter the report using department, semester,
                        status and date range.
                    </p>

                </div>


                <form method="get"
                      action="${pageContext.request.contextPath}/admin/reports">

                    <input type="hidden"
                           name="type"
                           value="${reportType}">


                    <div class="row g-3">


                        <!-- Department -->

                        <div class="col-lg-3 col-md-6">

                            <label for="deptId"
                                   class="form-label">

                                Department

                            </label>

                            <select id="deptId"
                                    name="deptId"
                                    class="form-select">

                                <option value="">
                                    All Departments
                                </option>

                                <c:forEach var="department"
                                           items="${departments}">

                                    <option value="${department.deptId}"
                                        <c:if test="${selectedDeptId == department.deptId}">
                                            selected
                                        </c:if>>

                                        ${department.deptCode}
                                        -
                                        ${department.deptName}

                                    </option>

                                </c:forEach>

                            </select>

                        </div>


                        <!-- Semester -->

                        <div class="col-lg-2 col-md-6">

                            <label for="semester"
                                   class="form-label">

                                Semester

                            </label>

                            <select id="semester"
                                    name="semester"
                                    class="form-select">

                                <option value="">
                                    All Semesters
                                </option>

                                <c:forEach var="sem"
                                           begin="1"
                                           end="8">

                                    <option value="${sem}"
                                        <c:if test="${selectedSemester == sem}">
                                            selected
                                        </c:if>>

                                        Semester ${sem}

                                    </option>

                                </c:forEach>

                            </select>

                        </div>


                        <!-- Status -->

                        <div class="col-lg-2 col-md-6">

                            <label for="status"
                                   class="form-label">

                                Status

                            </label>

                            <select id="status"
                                    name="status"
                                    class="form-select">

                                <option value="">
                                    All Status
                                </option>

                                <option value="ENROLLED"
                                    <c:if test="${selectedStatus == 'ENROLLED'}">
                                        selected
                                    </c:if>>
                                    Enrolled
                                </option>

                                <option value="DROPPED"
                                    <c:if test="${selectedStatus == 'DROPPED'}">
                                        selected
                                    </c:if>>
                                    Dropped
                                </option>

                                <option value="COMPLETED"
                                    <c:if test="${selectedStatus == 'COMPLETED'}">
                                        selected
                                    </c:if>>
                                    Completed
                                </option>

                                <option value="PAID"
                                    <c:if test="${selectedStatus == 'PAID'}">
                                        selected
                                    </c:if>>
                                    Paid
                                </option>

                                <option value="PENDING"
                                    <c:if test="${selectedStatus == 'PENDING'}">
                                        selected
                                    </c:if>>
                                    Pending
                                </option>

                                <option value="FAILED"
                                    <c:if test="${selectedStatus == 'FAILED'}">
                                        selected
                                    </c:if>>
                                    Failed
                                </option>

                            </select>

                        </div>


                        <!-- From -->

                        <div class="col-lg-2 col-md-6">

                            <label for="dateFrom"
                                   class="form-label">

                                From Date

                            </label>

                            <input type="date"
                                   id="dateFrom"
                                   name="dateFrom"
                                   value="${dateFrom}"
                                   class="form-control">

                        </div>


                        <!-- To -->

                        <div class="col-lg-2 col-md-6">

                            <label for="dateTo"
                                   class="form-label">

                                To Date

                            </label>

                            <input type="date"
                                   id="dateTo"
                                   name="dateTo"
                                   value="${dateTo}"
                                   class="form-control">

                        </div>


                        <!-- Buttons -->

                        <div class="col-lg-1 col-md-6 d-flex gap-2">

                            <button type="submit"
                                    class="btn btn-primary">

                                <i class="bi bi-search"></i>

                            </button>

                            <a href="${pageContext.request.contextPath}/admin/reports?type=${reportType}"
                               class="btn btn-outline-secondary">

                                <i class="bi bi-arrow-clockwise"></i>

                            </a>

                        </div>

                    </div>

                </form>

            </div>


            <!-- =================================================
                 STUDENT REPORT
                 ================================================= -->

            <c:if test="${reportType == 'students'}">

                <div class="row g-3 mb-4">

                    <div class="col-md-4">

                        <div class="content-card">

                            <div class="d-flex align-items-center">

                                <div class="dashboard-stat-icon blue me-3">

                                    <i class="bi bi-people"></i>

                                </div>

                                <div>

                                    <small class="text-muted">
                                        Total Students
                                    </small>

                                    <h3 class="mb-0">
                                        ${totalStudents}
                                    </h3>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>


                <div class="content-card">

                    <div class="d-flex justify-content-between align-items-center mb-3">

                        <div>

                            <h3 class="mb-1">
                                Student Report
                            </h3>

                            <p class="text-muted mb-0">
                                Student records by department and semester
                            </p>

                        </div>

                        <span class="badge bg-light text-dark">
                            ${students.size()} Records
                        </span>

                    </div>


                    <div class="table-responsive">

                        <table class="table align-middle">

                            <thead>

                                <tr>

                                    <th>#</th>
                                    <th>Roll No</th>
                                    <th>Student Name</th>
                                    <th>Department</th>
                                    <th>Semester</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Status</th>

                                </tr>

                            </thead>


                            <tbody>

                                <c:choose>

                                    <c:when test="${not empty students}">

                                        <c:forEach var="student"
                                                   items="${students}"
                                                   varStatus="loop">

                                            <tr>

                                                <td>
                                                    ${loop.count}
                                                </td>

                                                <td>
                                                    ${student.roll_no}
                                                </td>

                                                <td>
                                                    <strong>
                                                        ${student.student_name}
                                                    </strong>
                                                </td>

                                                <td>
                                                    ${student.dept_code}
                                                </td>

                                                <td>
                                                    Sem ${student.semester}
                                                </td>

                                                <td>
                                                    ${student.email}
                                                </td>

                                                <td>
                                                    ${student.phone}
                                                </td>

                                                <td>

                                                    <span class="badge bg-success">
                                                        ${student.user_status}
                                                    </span>

                                                </td>

                                            </tr>

                                        </c:forEach>

                                    </c:when>


                                    <c:otherwise>

                                        <tr>

                                            <td colspan="8"
                                                class="text-center py-5">

                                                <i class="bi bi-people fs-1 text-muted"></i>

                                                <h5 class="mt-3">
                                                    No Student Records Found
                                                </h5>

                                            </td>

                                        </tr>

                                    </c:otherwise>

                                </c:choose>

                            </tbody>

                        </table>

                    </div>

                </div>

            </c:if>


            <!-- =================================================
                 COURSE REPORT
                 ================================================= -->

            <c:if test="${reportType == 'courses'}">

                <div class="row g-3 mb-4">

                    <div class="col-md-6">

                        <div class="content-card">

                            <div class="d-flex align-items-center">

                                <div class="dashboard-stat-icon blue me-3">

                                    <i class="bi bi-book"></i>

                                </div>

                                <div>

                                    <small class="text-muted">
                                        Total Courses
                                    </small>

                                    <h3 class="mb-0">
                                        ${totalCourses}
                                    </h3>

                                </div>

                            </div>

                        </div>

                    </div>


                    <div class="col-md-6">

                        <div class="content-card">

                            <div class="d-flex align-items-center">

                                <div class="dashboard-stat-icon red me-3">

                                    <i class="bi bi-exclamation-circle"></i>

                                </div>

                                <div>

                                    <small class="text-muted">
                                        Full Courses
                                    </small>

                                    <h3 class="mb-0">
                                        ${fullCourses}
                                    </h3>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>


                <div class="content-card">

                    <div class="d-flex justify-content-between align-items-center mb-3">

                        <div>

                            <h3 class="mb-1">
                                Course Report
                            </h3>

                            <p class="text-muted mb-0">
                                Course capacity and enrollment information
                            </p>

                        </div>

                        <span class="badge bg-light text-dark">
                            ${courses.size()} Records
                        </span>

                    </div>


                    <div class="table-responsive">

                        <table class="table align-middle">

                            <thead>

                                <tr>

                                    <th>Code</th>
                                    <th>Course</th>
                                    <th>Department</th>
                                    <th>Credits</th>
                                    <th>Capacity</th>
                                    <th>Enrolled</th>
                                    <th>Available</th>
                                    <th>Faculty</th>
                                    <th>Fee</th>

                                </tr>

                            </thead>


                            <tbody>

                                <c:choose>

                                    <c:when test="${not empty courses}">

                                        <c:forEach var="course"
                                                   items="${courses}">

                                            <tr>

                                                <td>
                                                    <strong>
                                                        ${course.course_code}
                                                    </strong>
                                                </td>

                                                <td>
                                                    ${course.title}
                                                </td>

                                                <td>
                                                    ${course.dept_code}
                                                </td>

                                                <td>
                                                    ${course.credits}
                                                </td>

                                                <td>
                                                    ${course.capacity}
                                                </td>

                                                <td>
                                                    ${course.enrolled_students}
                                                </td>

                                                <td>
                                                    ${course.available_seats}
                                                </td>

                                                <td>

                                                    <c:choose>

                                                        <c:when test="${not empty course.faculty_name}">
                                                            ${course.faculty_name}
                                                        </c:when>

                                                        <c:otherwise>
                                                            <span class="text-muted">
                                                                Not Assigned
                                                            </span>
                                                        </c:otherwise>

                                                    </c:choose>

                                                </td>

                                                <td>
                                                    ₹ ${course.fee_amount}
                                                </td>

                                            </tr>

                                        </c:forEach>

                                    </c:when>


                                    <c:otherwise>

                                        <tr>

                                            <td colspan="9"
                                                class="text-center py-5">

                                                <i class="bi bi-book fs-1 text-muted"></i>

                                                <h5 class="mt-3">
                                                    No Course Records Found
                                                </h5>

                                            </td>

                                        </tr>

                                    </c:otherwise>

                                </c:choose>

                            </tbody>

                        </table>

                    </div>

                </div>

            </c:if>


            <!-- =================================================
                 ENROLLMENT REPORT
                 ================================================= -->

            <c:if test="${reportType == 'enrollments'}">

                <div class="row g-3 mb-4">

                    <div class="col-xl-3 col-md-6">

                        <div class="content-card">

                            <small class="text-muted">
                                Total
                            </small>

                            <h3>
                                ${totalEnrollments}
                            </h3>

                        </div>

                    </div>


                    <div class="col-xl-3 col-md-6">

                        <div class="content-card">

                            <small class="text-muted">
                                Enrolled
                            </small>

                            <h3 class="text-success">
                                ${enrolledCount}
                            </h3>

                        </div>

                    </div>


                    <div class="col-xl-3 col-md-6">

                        <div class="content-card">

                            <small class="text-muted">
                                Dropped
                            </small>

                            <h3 class="text-danger">
                                ${droppedCount}
                            </h3>

                        </div>

                    </div>


                    <div class="col-xl-3 col-md-6">

                        <div class="content-card">

                            <small class="text-muted">
                                Completed
                            </small>

                            <h3 class="text-primary">
                                ${completedCount}
                            </h3>

                        </div>

                    </div>

                </div>


                <div class="content-card">

                    <div class="d-flex justify-content-between align-items-center mb-3">

                        <div>

                            <h3 class="mb-1">
                                Enrollment Report
                            </h3>

                            <p class="text-muted mb-0">
                                Student course enrollment records
                            </p>

                        </div>

                        <span class="badge bg-light text-dark">
                            ${enrollments.size()} Records
                        </span>

                    </div>


                    <div class="table-responsive">

                        <table class="table align-middle">

                            <thead>

                                <tr>

                                    <th>ID</th>
                                    <th>Student</th>
                                    <th>Roll No</th>
                                    <th>Department</th>
                                    <th>Semester</th>
                                    <th>Course</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>Grade</th>

                                </tr>

                            </thead>


                            <tbody>

                                <c:choose>

                                    <c:when test="${not empty enrollments}">

                                        <c:forEach var="enrollment"
                                                   items="${enrollments}">

                                            <tr>

                                                <td>
                                                    #${enrollment.enrollment_id}
                                                </td>

                                                <td>
                                                    <strong>
                                                        ${enrollment.student_name}
                                                    </strong>
                                                </td>

                                                <td>
                                                    ${enrollment.roll_no}
                                                </td>

                                                <td>
                                                    ${enrollment.dept_code}
                                                </td>

                                                <td>
                                                    Sem ${enrollment.semester}
                                                </td>

                                                <td>
                                                    ${enrollment.course_code}
                                                    -
                                                    ${enrollment.course_title}
                                                </td>

                                                <td>
                                                    ${enrollment.enrollment_date}
                                                </td>

                                                <td>

                                                    <c:choose>

                                                        <c:when test="${enrollment.status == 'ENROLLED'}">

                                                            <span class="badge bg-success">
                                                                Enrolled
                                                            </span>

                                                        </c:when>

                                                        <c:when test="${enrollment.status == 'DROPPED'}">

                                                            <span class="badge bg-danger">
                                                                Dropped
                                                            </span>

                                                        </c:when>

                                                        <c:otherwise>

                                                            <span class="badge bg-primary">
                                                                Completed
                                                            </span>

                                                        </c:otherwise>

                                                    </c:choose>

                                                </td>

                                                <td>
                                                    ${enrollment.grade}
                                                </td>

                                            </tr>

                                        </c:forEach>

                                    </c:when>


                                    <c:otherwise>

                                        <tr>

                                            <td colspan="9"
                                                class="text-center py-5">

                                                <i class="bi bi-journal-text fs-1 text-muted"></i>

                                                <h5 class="mt-3">
                                                    No Enrollment Records Found
                                                </h5>

                                            </td>

                                        </tr>

                                    </c:otherwise>

                                </c:choose>

                            </tbody>

                        </table>

                    </div>

                </div>

            </c:if>


            <!-- =================================================
                 PAYMENT REPORT
                 ================================================= -->

            <c:if test="${reportType == 'payments'}">

                <div class="row g-3 mb-4">

                    <div class="col-xl-3 col-md-6">

                        <div class="content-card">

                            <small class="text-muted">
                                Total Revenue
                            </small>

                            <h3>
                                ₹ ${paymentRevenue}
                            </h3>

                        </div>

                    </div>


                    <div class="col-xl-3 col-md-6">

                        <div class="content-card">

                            <small class="text-muted">
                                Successful
                            </small>

                            <h3 class="text-success">
                                ${paidCount}
                            </h3>

                        </div>

                    </div>


                    <div class="col-xl-3 col-md-6">

                        <div class="content-card">

                            <small class="text-muted">
                                Pending
                            </small>

                            <h3 class="text-warning">
                                ${pendingCount}
                            </h3>

                        </div>

                    </div>


                    <div class="col-xl-3 col-md-6">

                        <div class="content-card">

                            <small class="text-muted">
                                Failed
                            </small>

                            <h3 class="text-danger">
                                ${failedCount}
                            </h3>

                        </div>

                    </div>

                </div>


                <div class="content-card">

                    <div class="d-flex justify-content-between align-items-center mb-3">

                        <div>

                            <h3 class="mb-1">
                                Payment Report
                            </h3>

                            <p class="text-muted mb-0">
                                Student payment and transaction records
                            </p>

                        </div>

                        <span class="badge bg-light text-dark">
                            ${payments.size()} Records
                        </span>

                    </div>


                    <div class="table-responsive">

                        <table class="table align-middle">

                            <thead>

                                <tr>

                                    <th>ID</th>
                                    <th>Student</th>
                                    <th>Roll No</th>
                                    <th>Semester</th>
                                    <th>Amount</th>
                                    <th>Method</th>
                                    <th>Transaction Reference</th>
                                    <th>Date</th>
                                    <th>Status</th>

                                </tr>

                            </thead>


                            <tbody>

                                <c:choose>

                                    <c:when test="${not empty payments}">

                                        <c:forEach var="payment"
                                                   items="${payments}">

                                            <tr>

                                                <td>
                                                    #${payment.payment_id}
                                                </td>

                                                <td>
                                                    <strong>
                                                        ${payment.student_name}
                                                    </strong>
                                                </td>

                                                <td>
                                                    ${payment.roll_no}
                                                </td>

                                                <td>
                                                    Sem ${payment.semester}
                                                </td>

                                                <td>

                                                    <strong>
                                                        ₹ ${payment.amount}
                                                    </strong>

                                                </td>

                                                <td>
                                                    ${payment.payment_method}
                                                </td>

                                                <td>
                                                    <code>
                                                        ${payment.transaction_ref}
                                                    </code>
                                                </td>

                                                <td>
                                                    ${payment.payment_date}
                                                </td>

                                                <td>

                                                    <c:choose>

                                                        <c:when test="${payment.payment_status == 'PAID'}">

                                                            <span class="badge bg-success">
                                                                Paid
                                                            </span>

                                                        </c:when>

                                                        <c:when test="${payment.payment_status == 'FAILED'}">

                                                            <span class="badge bg-danger">
                                                                Failed
                                                            </span>

                                                        </c:when>

                                                        <c:otherwise>

                                                            <span class="badge bg-warning text-dark">
                                                                Pending
                                                            </span>

                                                        </c:otherwise>

                                                    </c:choose>

                                                </td>

                                            </tr>

                                        </c:forEach>

                                    </c:when>


                                    <c:otherwise>

                                        <tr>

                                            <td colspan="9"
                                                class="text-center py-5">

                                                <i class="bi bi-credit-card fs-1 text-muted"></i>

                                                <h5 class="mt-3">
                                                    No Payment Records Found
                                                </h5>

                                            </td>

                                        </tr>

                                    </c:otherwise>

                                </c:choose>

                            </tbody>

                        </table>

                    </div>

                </div>

            </c:if>


        </main>

    </div>

</div>


<script>

function changeReportType(type) {

    window.location.href =
        '${pageContext.request.contextPath}/admin/reports?type='
        + encodeURIComponent(type);

}

</script>


<style>

@media print {

    .admin-sidebar,
    .admin-navbar,
    .page-header-actions,
    .report-filter,
    button,
    .btn,
    .sidebar {
        display: none !important;
    }

    .admin-main {
        width: 100% !important;
        margin-left: 0 !important;
    }

    .admin-content {
        padding: 0 !important;
    }

    .content-card {
        box-shadow: none !important;
        border: 1px solid #ddd !important;
    }

}

</style>


<jsp:include page="../common/footer.jsp" />