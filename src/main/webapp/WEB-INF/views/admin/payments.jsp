<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../common/header.jsp" />

<div class="admin-app">

    <!-- Sidebar -->
    <jsp:include page="../common/sidebar.jsp" />

    <div class="admin-main">

        <!-- Navbar -->
        <jsp:include page="../common/navbar.jsp" />

        <!-- =====================================================
             PAYMENT CONTENT
             ===================================================== -->

        <main class="admin-content">

            <!-- Page Header -->
            <div class="page-header">

                <div class="page-header-left">

                    <div class="breadcrumb-area">
                        <span>Admin</span>
                        <i class="bi bi-chevron-right"></i>
                        <span>Payments</span>
                    </div>

                    <h1 class="page-title">
                        Payment Management
                    </h1>

                    <p class="text-muted mb-0 mt-1">
                        Manage student payment and transaction records
                    </p>

                </div>

                <div class="page-header-actions">

                    <a href="${pageContext.request.contextPath}/admin/payments/add"
                       class="btn btn-primary">

                        <i class="bi bi-plus-lg me-1"></i>
                        Add Payment

                    </a>

                </div>

            </div>


            <!-- =================================================
                 ALERTS
                 ================================================= -->

            <c:if test="${not empty success}">
                <div class="alert alert-success alert-dismissible fade show"
                     role="alert">

                    <i class="bi bi-check-circle me-2"></i>
                    ${success}

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>
            </c:if>


            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show"
                     role="alert">

                    <i class="bi bi-exclamation-triangle me-2"></i>
                    ${error}

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>
            </c:if>


            <!-- =================================================
                 PAYMENT STATISTICS
                 ================================================= -->

            <div class="row g-3 mb-4">

                <!-- Total Payments -->
                <div class="col-xl-3 col-md-6">

                    <div class="dashboard-stat-card">

                        <div class="dashboard-stat-icon blue">
                            <i class="bi bi-credit-card"></i>
                        </div>

                        <div class="dashboard-stat-content">

                            <span class="dashboard-stat-label">
                                Total Payments
                            </span>

                            <h3 class="dashboard-stat-value">
                                ${totalPayments}
                            </h3>

                        </div>

                    </div>

                </div>


                <!-- Successful -->
                <div class="col-xl-3 col-md-6">

                    <div class="dashboard-stat-card">

                        <div class="dashboard-stat-icon green">
                            <i class="bi bi-check-circle"></i>
                        </div>

                        <div class="dashboard-stat-content">

                            <span class="dashboard-stat-label">
                                Successful
                            </span>

                            <h3 class="dashboard-stat-value">
                                ${paidCount}
                            </h3>

                        </div>

                    </div>

                </div>


                <!-- Failed -->
                <div class="col-xl-3 col-md-6">

                    <div class="dashboard-stat-card">

                        <div class="dashboard-stat-icon red">
                            <i class="bi bi-x-circle"></i>
                        </div>

                        <div class="dashboard-stat-content">

                            <span class="dashboard-stat-label">
                                Failed
                            </span>

                            <h3 class="dashboard-stat-value">
                                ${failedCount}
                            </h3>

                        </div>

                    </div>

                </div>


                <!-- Total Revenue -->
                <div class="col-xl-3 col-md-6">

                    <div class="dashboard-stat-card">

                        <div class="dashboard-stat-icon yellow">
                            <i class="bi bi-currency-rupee"></i>
                        </div>

                        <div class="dashboard-stat-content">

                            <span class="dashboard-stat-label">
                                Total Revenue
                            </span>

                            <h3 class="dashboard-stat-value">
                                ₹ ${totalRevenue}
                            </h3>

                        </div>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 FILTER CARD
                 ================================================= -->

            <div class="admin-card mb-4">

                <div class="admin-card-header">

                    <div>

                        <h5 class="admin-card-title">
                            <i class="bi bi-funnel me-2"></i>
                            Filter Payments
                        </h5>

                        <p class="admin-card-subtitle">
                            Search payment records using student,
                            semester or payment status
                        </p>

                    </div>

                </div>


                <div class="admin-card-body">

                    <form method="get"
                          action="${pageContext.request.contextPath}/admin/payments">

                        <div class="row g-3 align-items-end">

                            <!-- Student -->
                            <div class="col-lg-4 col-md-6">

                                <label for="studentId"
                                       class="form-label">
                                    Student
                                </label>

                                <select id="studentId"
                                        name="studentId"
                                        class="form-select">

                                    <option value="">
                                        All Students
                                    </option>

                                    <c:forEach var="student"
                                               items="${students}">

                                        <option value="${student.studentId}"
                                            <c:if test="${selectedStudentId == student.studentId}">
                                                selected
                                            </c:if>>

                                            ${student.firstName}
                                            ${student.lastName}
                                            - ${student.rollNo}

                                        </option>

                                    </c:forEach>

                                </select>

                            </div>


                            <!-- Semester -->
                            <div class="col-lg-3 col-md-6">

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
                            <div class="col-lg-3 col-md-6">

                                <label for="status"
                                       class="form-label">
                                    Payment Status
                                </label>

                                <select id="status"
                                        name="status"
                                        class="form-select">

                                    <option value="">
                                        All Status
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


                            <!-- Filter Button -->
                            <div class="col-lg-2 col-md-6">

                                <button type="submit"
                                        class="btn btn-primary w-100">

                                    <i class="bi bi-search me-1"></i>
                                    Filter

                                </button>

                            </div>

                        </div>

                    </form>

                </div>

            </div>


            <!-- =================================================
                 PAYMENT TABLE
                 ================================================= -->

            <div class="admin-card">

                <div class="admin-card-header">

                    <div>

                        <h5 class="admin-card-title">
                            Payment Records
                        </h5>

                        <p class="admin-card-subtitle">
                            All student payment transactions
                        </p>

                    </div>

                    <span class="badge bg-light text-dark">
                        ${payments.size()} Records
                    </span>

                </div>


                <div class="admin-card-body p-0">

                    <div class="table-responsive">

                        <table class="table table-hover align-middle mb-0">

                            <thead>

                                <tr>

                                    <th>
                                        Payment ID
                                    </th>

                                    <th>
                                        Student
                                    </th>

                                    <th>
                                        Roll Number
                                    </th>

                                    <th>
                                        Semester
                                    </th>

                                    <th>
                                        Amount
                                    </th>

                                    <th>
                                        Payment Date
                                    </th>

                                    <th>
                                        Transaction Reference
                                    </th>

                                    <th>
                                        Status
                                    </th>

                                    <th class="text-center">
                                        Action
                                    </th>

                                </tr>

                            </thead>


                            <tbody>

                                <c:choose>

                                    <c:when test="${not empty payments}">

                                        <c:forEach var="payment"
                                                   items="${payments}">

                                            <tr>

                                                <!-- Payment ID -->
                                                <td>

                                                    <strong>
                                                        #${payment.paymentId}
                                                    </strong>

                                                </td>


                                                <!-- Student -->
                                                <td>

                                                    <div class="d-flex align-items-center">

                                                        <div class="student-avatar me-2">
                                                            <i class="bi bi-person"></i>
                                                        </div>

                                                        <div>

                                                            <div class="fw-semibold">
                                                                ${payment.studentName}
                                                            </div>

                                                        </div>

                                                    </div>

                                                </td>


                                                <!-- Roll Number -->
                                                <td>
                                                    ${payment.rollNo}
                                                </td>


                                                <!-- Semester -->
                                                <td>

                                                    <span class="badge bg-light text-dark">
                                                        Sem ${payment.semester}
                                                    </span>

                                                </td>


                                                <!-- Amount -->
                                                <td>

                                                    <strong class="text-primary">
                                                        ₹ ${payment.amount}
                                                    </strong>

                                                </td>


                                                <!-- Payment Date -->
                                                <td>

                                                    <c:choose>

                                                        <c:when test="${not empty payment.paymentDate}">
                                                            ${payment.paymentDate}
                                                        </c:when>

                                                        <c:otherwise>
                                                            -
                                                        </c:otherwise>

                                                    </c:choose>

                                                </td>


                                                <!-- Transaction Reference -->
                                                <td>

                                                    <code>
                                                        ${payment.transactionRef}
                                                    </code>

                                                </td>


                                                <!-- Status -->
                                                <td>

                                                    <c:choose>

                                                        <c:when test="${payment.paymentStatus == 'PAID'}">

                                                            <span class="badge bg-success-subtle text-success">
                                                                <i class="bi bi-check-circle me-1"></i>
                                                                Paid
                                                            </span>

                                                        </c:when>


                                                        <c:when test="${payment.paymentStatus == 'FAILED'}">

                                                            <span class="badge bg-danger-subtle text-danger">
                                                                <i class="bi bi-x-circle me-1"></i>
                                                                Failed
                                                            </span>

                                                        </c:when>


                                                        <c:otherwise>

                                                            <span class="badge bg-warning-subtle text-warning">
                                                                <i class="bi bi-clock me-1"></i>
                                                                Pending
                                                            </span>

                                                        </c:otherwise>

                                                    </c:choose>

                                                </td>


                                                <!-- Actions -->
                                                <td>

                                                    <div class="d-flex justify-content-center gap-1">

                                                        <!-- View -->
                                                        <a href="${pageContext.request.contextPath}/admin/payments/view?id=${payment.paymentId}"
                                                           class="btn btn-sm btn-outline-primary"
                                                           title="View Payment">

                                                            <i class="bi bi-eye"></i>

                                                        </a>


                                                        <!-- Edit -->
                                                        <a href="${pageContext.request.contextPath}/admin/payments/edit?id=${payment.paymentId}"
                                                           class="btn btn-sm btn-outline-secondary"
                                                           title="Edit Payment">

                                                            <i class="bi bi-pencil"></i>

                                                        </a>


                                                        <!-- Delete -->
                                                        <form method="post"
                                                              action="${pageContext.request.contextPath}/admin/payments/delete"
                                                              class="d-inline"
                                                              onsubmit="return confirm('Are you sure you want to delete this payment record?');">

                                                            <input type="hidden"
                                                                   name="id"
                                                                   value="${payment.paymentId}">

                                                            <button type="submit"
                                                                    class="btn btn-sm btn-outline-danger"
                                                                    title="Delete Payment">

                                                                <i class="bi bi-trash"></i>

                                                            </button>

                                                        </form>

                                                    </div>

                                                </td>

                                            </tr>

                                        </c:forEach>

                                    </c:when>


                                    <c:otherwise>

                                        <tr>

                                            <td colspan="9"
                                                class="text-center py-5">

                                                <div class="empty-state">

                                                    <div class="empty-state-icon">
                                                        <i class="bi bi-credit-card"></i>
                                                    </div>

                                                    <h5 class="mt-3">
                                                        No Payment Records Found
                                                    </h5>

                                                    <p class="text-muted mb-3">
                                                        There are no payment records
                                                        matching your selected filters.
                                                    </p>

                                                    <a href="${pageContext.request.contextPath}/admin/payments/add"
                                                       class="btn btn-primary">

                                                        <i class="bi bi-plus-lg me-1"></i>
                                                        Add Payment

                                                    </a>

                                                </div>

                                            </td>

                                        </tr>

                                    </c:otherwise>

                                </c:choose>

                            </tbody>

                        </table>

                    </div>

                </div>

            </div>

        </main>

    </div>

</div>


<!-- Bootstrap JS -->
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>


<jsp:include page="../common/footer.jsp" />