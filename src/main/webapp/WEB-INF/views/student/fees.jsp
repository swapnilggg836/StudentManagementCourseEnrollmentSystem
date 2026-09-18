<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/student-sidebar.jsp" %>
<%@ include file="../common/student-navbar.jsp" %>


<div class="main-content">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h2 class="fw-bold mb-1">
                Fees & Payment
            </h2>

            <p class="text-muted mb-0">
                View your payment history and transaction details
            </p>
        </div>

        <a href="${pageContext.request.contextPath}/student/courses"
           class="btn btn-primary">

            <i class="bi bi-plus-circle me-1"></i>
            Enroll in Course

        </a>

    </div>


    <%@ include file="../common/alerts.jsp" %>


    <div class="row g-3 mb-4">

        <div class="col-md-6 col-xl-3">

            <div class="card border-0 shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-start">

                        <div>

                            <div class="text-muted small mb-1">
                                Total Paid
                            </div>

                            <h3 class="fw-bold mb-0">
                                ₹ ${totalPaid}
                            </h3>

                        </div>

                        <div class="fees-stat-icon fees-icon-primary">
                            <i class="bi bi-currency-rupee"></i>
                        </div>

                    </div>

                </div>

            </div>

        </div>


        <div class="col-md-6 col-xl-3">

            <div class="card border-0 shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-start">

                        <div>

                            <div class="text-muted small mb-1">
                                Transactions
                            </div>

                            <h3 class="fw-bold mb-0">
                                ${totalTransactions}
                            </h3>

                        </div>

                        <div class="fees-stat-icon fees-icon-blue">
                            <i class="bi bi-receipt"></i>
                        </div>

                    </div>

                </div>

            </div>

        </div>


        <div class="col-md-6 col-xl-3">

            <div class="card border-0 shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-start">

                        <div>

                            <div class="text-muted small mb-1">
                                Successful
                            </div>

                            <h3 class="fw-bold mb-0">
                                ${successfulTransactions}
                            </h3>

                        </div>

                        <div class="fees-stat-icon fees-icon-green">
                            <i class="bi bi-check-circle"></i>
                        </div>

                    </div>

                </div>

            </div>

        </div>


        <div class="col-md-6 col-xl-3">

            <div class="card border-0 shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-start">

                        <div>

                            <div class="text-muted small mb-1">
                                Pending
                            </div>

                            <h3 class="fw-bold mb-0">
                                ${pendingTransactions}
                            </h3>

                        </div>

                        <div class="fees-stat-icon fees-icon-warning">
                            <i class="bi bi-clock-history"></i>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <div class="card border-0 shadow-sm">

        <div class="card-body p-0">

            <div class="p-4 border-bottom">

                <div class="d-flex justify-content-between align-items-center">

                    <div>

                        <h5 class="fw-bold mb-1">
                            <i class="bi bi-credit-card me-2"></i>
                            Payment History
                        </h5>

                        <p class="text-muted small mb-0">
                            Your recent payment transactions
                        </p>

                    </div>

                    <span class="fees-count-badge">
                        ${totalTransactions} Transactions
                    </span>

                </div>

            </div>


            <c:choose>

                <c:when test="${not empty payments}">

                    <div class="table-responsive">

                        <table class="table fees-table align-middle mb-0">

                            <thead>

                                <tr>

                                    <th>#</th>

                                    <th>Transaction</th>

                                    <th>Amount</th>

                                    <th>Method</th>

                                    <th>Status</th>

                                    <th>Date</th>

                                    

                                </tr>

                            </thead>


                            <tbody>

                                <c:forEach
                                    var="payment"
                                    items="${payments}"
                                    varStatus="status">

                                    <tr>

                                        <td>

                                            <span class="fees-number">
                                                ${status.index + 1}
                                            </span>

                                        </td>


                                        <td>

                                            <div class="d-flex align-items-center">

                                                <div class="fees-payment-icon">

                                                    <i class="bi bi-receipt"></i>

                                                </div>


                                                <div class="ms-3">

                                                    <div class="fw-semibold">

                                                        ${payment.transactionRef}

                                                    </div>

                                                    <div class="small text-muted">

                                                        Payment ID:
                                                        #${payment.paymentId}

                                                    </div>

                                                </div>

                                            </div>

                                        </td>


                                        <td>

                                            <span class="fw-bold">

                                                ₹ ${payment.amount}

                                            </span>

                                        </td>


                                        <td>

                                            <c:choose>

                                                <c:when test="${payment.paymentMethod == 'UPI'}">

                                                    <span class="fees-method fees-method-upi">

                                                        <i class="bi bi-phone me-1"></i>
                                                        UPI

                                                    </span>

                                                </c:when>


                                                <c:when test="${payment.paymentMethod == 'CARD'}">

                                                    <span class="fees-method fees-method-card">

                                                        <i class="bi bi-credit-card me-1"></i>
                                                        Card

                                                    </span>

                                                </c:when>


                                                <c:otherwise>

                                                    <span class="fees-method fees-method-bank">

                                                        <i class="bi bi-bank me-1"></i>
                                                        Net Banking

                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>


                                        <td>

                                            <c:choose>

                                                <c:when test="${payment.paymentStatus == 'PAID'}">

                                                    <span class="fees-status fees-status-paid">

                                                        <i class="bi bi-check-circle-fill me-1"></i>
                                                        Paid

                                                    </span>

                                                </c:when>


                                                <c:when test="${payment.paymentStatus == 'PENDING'}">

                                                    <span class="fees-status fees-status-pending">

                                                        <i class="bi bi-clock-fill me-1"></i>
                                                        Pending

                                                    </span>

                                                </c:when>


                                                <c:otherwise>

                                                    <span class="fees-status fees-status-failed">

                                                        <i class="bi bi-x-circle-fill me-1"></i>
                                                        Failed

                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>


                                        <td>

                                            <c:if test="${payment.paymentDate != null}">

                                                <div class="fees-date">

                                                    ${payment.paymentDate}

                                                </div>

                                            </c:if>

                                        </td>


                                        

                                    </tr>

                                </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </c:when>


                <c:otherwise>

                    <div class="text-center py-5 px-3">

                        <div class="fees-empty-icon mx-auto mb-3">

                            <i class="bi bi-wallet2"></i>

                        </div>


                        <h5 class="fw-bold">
                            No Payment History
                        </h5>


                        <p class="text-muted mb-4">
                            You haven't made any course payments yet.
                        </p>


                        <a href="${pageContext.request.contextPath}/student/courses"
                           class="btn btn-primary">

                            <i class="bi bi-book me-1"></i>
                            Browse Courses

                        </a>

                    </div>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</div>