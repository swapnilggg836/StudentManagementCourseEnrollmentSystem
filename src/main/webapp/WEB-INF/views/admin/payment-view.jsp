<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/sidebar.jsp" />

<div class="main-content">

    <!-- ===================================================== -->
    <!-- PAGE HEADER -->
    <!-- ===================================================== -->

    <div class="page-header d-flex justify-content-between align-items-center mb-4">

        <div>

            <h2 class="fw-bold mb-1">
                Payment Details
            </h2>

            <p class="text-muted mb-0">
                View payment and transaction information
            </p>

        </div>


        <div class="d-flex gap-2">

            <button type="button"
                    class="btn btn-outline-secondary"
                    onclick="window.print()">

                <i class="bi bi-printer me-1"></i>
                Print

            </button>


            <a href="${pageContext.request.contextPath}/admin/payments"
               class="btn btn-primary">

                <i class="bi bi-arrow-left me-1"></i>
                Back to Payments

            </a>

        </div>

    </div>


    <!-- ===================================================== -->
    <!-- PAYMENT RECEIPT -->
    <!-- ===================================================== -->

    <div class="card border-0 shadow-sm payment-receipt">

        <!-- Header -->

        <div class="card-header bg-white border-bottom py-4">

            <div class="row align-items-center">

                <div class="col-md-8">

                    <div class="d-flex align-items-center">

                        <div class="rounded-circle
                                    bg-primary-subtle
                                    text-primary
                                    d-flex
                                    align-items-center
                                    justify-content-center
                                    me-3"
                             style="width:55px;height:55px;">

                            <i class="bi bi-credit-card fs-4"></i>

                        </div>


                        <div>

                            <h4 class="fw-bold mb-1">
                                EduManage
                            </h4>

                            <p class="text-muted mb-0">
                                Student Management & Course Enrollment System
                            </p>

                        </div>

                    </div>

                </div>


                <div class="col-md-4 text-md-end mt-3 mt-md-0">

                    <c:choose>

                        <c:when test="${payment.paymentStatus == 'PAID'}">

                            <span class="badge bg-success fs-6 px-3 py-2">

                                <i class="bi bi-check-circle me-1"></i>
                                PAID

                            </span>

                        </c:when>


                        <c:when test="${payment.paymentStatus == 'FAILED'}">

                            <span class="badge bg-danger fs-6 px-3 py-2">

                                <i class="bi bi-x-circle me-1"></i>
                                FAILED

                            </span>

                        </c:when>


                        <c:otherwise>

                            <span class="badge bg-warning text-dark fs-6 px-3 py-2">

                                <i class="bi bi-clock me-1"></i>
                                PENDING

                            </span>

                        </c:otherwise>

                    </c:choose>

                </div>

            </div>

        </div>


        <!-- ================================================= -->
        <!-- PAYMENT INFORMATION -->
        <!-- ================================================= -->

        <div class="card-body p-4">

            <div class="row g-4">


                <!-- Payment ID -->

                <div class="col-md-4">

                    <div class="detail-box">

                        <small class="text-muted d-block mb-1">
                            Payment ID
                        </small>

                        <h6 class="fw-bold mb-0">
                            #${payment.paymentId}
                        </h6>

                    </div>

                </div>


                <!-- Transaction Reference -->

                <div class="col-md-8">

                    <div class="detail-box">

                        <small class="text-muted d-block mb-1">
                            Transaction Reference
                        </small>

                        <h6 class="fw-bold mb-0">

                            <code>
                                ${payment.transactionRef}
                            </code>

                        </h6>

                    </div>

                </div>


                <!-- Student -->

                <div class="col-md-6">

                    <div class="detail-box">

                        <small class="text-muted d-block mb-1">
                            Student
                        </small>

                        <div class="d-flex align-items-center">

                            <div class="rounded-circle
                                        bg-primary-subtle
                                        text-primary
                                        d-flex
                                        align-items-center
                                        justify-content-center
                                        me-3"
                                 style="width:45px;height:45px;">

                                <i class="bi bi-person"></i>

                            </div>


                            <div>

                                <h6 class="fw-bold mb-1">
                                    ${payment.studentName}
                                </h6>

                                <small class="text-muted">
                                    Roll No: ${payment.rollNo}
                                </small>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- Semester -->

                <div class="col-md-6">

                    <div class="detail-box">

                        <small class="text-muted d-block mb-1">
                            Semester
                        </small>

                        <h6 class="fw-bold mb-0">

                            <span class="badge bg-light text-dark">

                                Semester ${payment.semester}

                            </span>

                        </h6>

                    </div>

                </div>


                <!-- Amount -->

                <div class="col-md-6">

                    <div class="detail-box">

                        <small class="text-muted d-block mb-1">
                            Amount
                        </small>

                        <h3 class="fw-bold mb-0">

                            ₹ ${payment.amount}

                        </h3>

                    </div>

                </div>


                <!-- Payment Method -->

                <div class="col-md-6">

                    <div class="detail-box">

                        <small class="text-muted d-block mb-1">
                            Payment Method
                        </small>

                        <h6 class="fw-bold mb-0">

                            <c:choose>

                                <c:when test="${payment.paymentMethod == 'UPI'}">

                                    <i class="bi bi-phone text-primary me-2"></i>
                                    UPI

                                </c:when>


                                <c:when test="${payment.paymentMethod == 'CARD'}">

                                    <i class="bi bi-credit-card text-primary me-2"></i>
                                    Card

                                </c:when>


                                <c:otherwise>

                                    <i class="bi bi-bank text-primary me-2"></i>
                                    Net Banking

                                </c:otherwise>

                            </c:choose>

                        </h6>

                    </div>

                </div>


                <!-- Payment Date -->

                <div class="col-md-6">

                    <div class="detail-box">

                        <small class="text-muted d-block mb-1">
                            Payment Date
                        </small>

                        <c:choose>

                            <c:when test="${not empty payment.paymentDate}">

                                <h6 class="fw-bold mb-1">

                                    ${payment.paymentDate.toLocalDate()}

                                </h6>

                                <small class="text-muted">

                                    ${payment.paymentDate.toLocalTime()}

                                </small>

                            </c:when>


                            <c:otherwise>

                                <span class="text-muted">
                                    -
                                </span>

                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>


                <!-- Status -->

                <div class="col-md-6">

                    <div class="detail-box">

                        <small class="text-muted d-block mb-1">
                            Payment Status
                        </small>

                        <c:choose>

                            <c:when test="${payment.paymentStatus == 'PAID'}">

                                <span class="badge bg-success">

                                    <i class="bi bi-check-circle me-1"></i>
                                    Successful

                                </span>

                            </c:when>


                            <c:when test="${payment.paymentStatus == 'FAILED'}">

                                <span class="badge bg-danger">

                                    <i class="bi bi-x-circle me-1"></i>
                                    Failed

                                </span>

                            </c:when>


                            <c:otherwise>

                                <span class="badge bg-warning text-dark">

                                    <i class="bi bi-clock me-1"></i>
                                    Pending

                                </span>

                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>

            </div>


            <!-- ================================================= -->
            <!-- TRANSACTION SUMMARY -->
            <!-- ================================================= -->

            <hr class="my-4">


            <div class="row justify-content-end">

                <div class="col-md-5">

                    <div class="d-flex justify-content-between mb-2">

                        <span class="text-muted">
                            Payment Amount
                        </span>

                        <span>
                            ₹ ${payment.amount}
                        </span>

                    </div>


                    <div class="d-flex justify-content-between mb-3">

                        <span class="text-muted">
                            Payment Status
                        </span>

                        <strong>
                            ${payment.paymentStatus}
                        </strong>

                    </div>


                    <hr>


                    <div class="d-flex justify-content-between">

                        <strong>
                            Total Amount
                        </strong>

                        <strong class="fs-5">
                            ₹ ${payment.amount}
                        </strong>

                    </div>

                </div>

            </div>


            <!-- ================================================= -->
            <!-- LEARNING PROJECT NOTICE -->
            <!-- ================================================= -->

            <div class="alert alert-info mt-4 mb-0">

                <div class="d-flex">

                    <i class="bi bi-info-circle fs-5 me-2"></i>

                    <div>

                        <strong>
                            Learning Project
                        </strong>

                        <br>

                        <small>

                            This payment record belongs to the
                            EduManage simulated payment system.
                            No real financial transaction was performed.

                        </small>

                    </div>

                </div>

            </div>

        </div>


        <!-- ================================================= -->
        <!-- FOOTER -->
        <!-- ================================================= -->

        <div class="card-footer bg-white border-top py-3">

            <div class="d-flex justify-content-between align-items-center">

                <small class="text-muted">

                    Transaction Reference:
                    <code>${payment.transactionRef}</code>

                </small>


                <small class="text-muted">

                    EduManage

                </small>

            </div>

        </div>

    </div>

</div>


<!-- ========================================================= -->
<!-- PRINT STYLE -->
<!-- ========================================================= -->

<style>

    .detail-box {
        background: #f8f9fa;
        border-radius: 10px;
        padding: 18px;
        height: 100%;
    }


    @media print {

        body {
            background: white !important;
        }

        .sidebar,
        .navbar,
        .page-header,
        .btn,
        footer {
            display: none !important;
        }

        .main-content {
            margin-left: 0 !important;
            padding: 0 !important;
        }

        .card {
            box-shadow: none !important;
            border: 1px solid #ddd !important;
        }

        .payment-receipt {
            width: 100%;
        }

    }

</style>


<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

<jsp:include page="../common/footer.jsp" />