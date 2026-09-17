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

    <div class="page-header mb-4">

        <div>
            <h2 class="fw-bold mb-1">

                <c:choose>
                    <c:when test="${payment.paymentId > 0}">
                        Edit Payment
                    </c:when>

                    <c:otherwise>
                        Add Payment
                    </c:otherwise>
                </c:choose>

            </h2>

            <p class="text-muted mb-0">
                Manage student payment information
            </p>
        </div>

    </div>


    <!-- ===================================================== -->
    <!-- ERROR ALERT -->
    <!-- ===================================================== -->

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


    <!-- ===================================================== -->
    <!-- PAYMENT FORM CARD -->
    <!-- ===================================================== -->

    <div class="card border-0 shadow-sm">

        <div class="card-header bg-white py-3">

            <h5 class="fw-bold mb-0">

                <c:choose>
                    <c:when test="${payment.paymentId > 0}">
                        Update Payment
                    </c:when>

                    <c:otherwise>
                        Payment Details
                    </c:otherwise>
                </c:choose>

            </h5>

        </div>


        <div class="card-body p-4">

            <!-- ================================================= -->
            <!-- EDIT PAYMENT -->
            <!-- ================================================= -->

            <c:choose>

                <c:when test="${payment.paymentId > 0}">

                    <form method="post"
                          action="${pageContext.request.contextPath}/admin/payments/update">

                        <input type="hidden"
                               name="paymentId"
                               value="${payment.paymentId}">


                        <div class="row g-4">

                            <!-- Student -->

                            <div class="col-md-6">

                                <label class="form-label fw-semibold">
                                    Student
                                    <span class="text-danger">*</span>
                                </label>

                                <select name="studentId"
                                        class="form-select"
                                        required>

                                    <option value="">
                                        Select Student
                                    </option>

                                    <c:forEach var="student"
                                               items="${students}">

                                        <option
                                            value="${student.studentId}"
                                            <c:if test="${student.studentId == payment.studentId}">
                                                selected
                                            </c:if>>

                                            ${student.firstName}
                                            ${student.lastName}
                                            - ${student.rollNo}

                                        </option>

                                    </c:forEach>

                                </select>

                            </div>


                            <!-- Amount -->

                            <div class="col-md-6">

                                <label class="form-label fw-semibold">
                                    Amount
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="input-group">

                                    <span class="input-group-text">
                                        ₹
                                    </span>

                                    <input type="number"
                                           name="amount"
                                           class="form-control"
                                           step="0.01"
                                           min="0.01"
                                           value="${payment.amount}"
                                           required>

                                </div>

                            </div>


                            <!-- Transaction Reference -->

                            <div class="col-md-6">

                                <label class="form-label fw-semibold">
                                    Transaction Reference
                                </label>

                                <input type="text"
                                       name="transactionRef"
                                       class="form-control"
                                       value="${payment.transactionRef}"
                                       required>

                            </div>


                            <!-- Payment Method -->

                            <div class="col-md-6">

                                <label class="form-label fw-semibold">
                                    Payment Method
                                    <span class="text-danger">*</span>
                                </label>

                                <select name="paymentMethod"
                                        class="form-select"
                                        required>

                                    <option value="">
                                        Select Payment Method
                                    </option>

                                    <option value="UPI"
                                        <c:if test="${payment.paymentMethod == 'UPI'}">
                                            selected
                                        </c:if>>
                                        UPI
                                    </option>

                                    <option value="CARD"
                                        <c:if test="${payment.paymentMethod == 'CARD'}">
                                            selected
                                        </c:if>>
                                        Card
                                    </option>

                                    <option value="NETBANKING"
                                        <c:if test="${payment.paymentMethod == 'NETBANKING'}">
                                            selected
                                        </c:if>>
                                        Net Banking
                                    </option>

                                </select>

                            </div>


                            <!-- Status -->

                            <div class="col-md-6">

                                <label class="form-label fw-semibold">
                                    Payment Status
                                    <span class="text-danger">*</span>
                                </label>

                                <select name="paymentStatus"
                                        class="form-select"
                                        required>

                                    <option value="PAID"
                                        <c:if test="${payment.paymentStatus == 'PAID'}">
                                            selected
                                        </c:if>>
                                        Paid
                                    </option>

                                    <option value="PENDING"
                                        <c:if test="${payment.paymentStatus == 'PENDING'}">
                                            selected
                                        </c:if>>
                                        Pending
                                    </option>

                                    <option value="FAILED"
                                        <c:if test="${payment.paymentStatus == 'FAILED'}">
                                            selected
                                        </c:if>>
                                        Failed
                                    </option>

                                </select>

                            </div>

                        </div>


                        <!-- Buttons -->

                        <div class="d-flex justify-content-end gap-2 mt-4">

                            <a href="${pageContext.request.contextPath}/admin/payments"
                               class="btn btn-outline-secondary">

                                <i class="bi bi-arrow-left me-1"></i>
                                Cancel

                            </a>


                            <button type="submit"
                                    class="btn btn-primary">

                                <i class="bi bi-save me-1"></i>
                                Update Payment

                            </button>

                        </div>

                    </form>

                </c:when>


                <!-- ================================================= -->
                <!-- ADD / SIMULATED PAYMENT -->
                <!-- ================================================= -->

                <c:otherwise>

                    <form method="post"
                          action="${pageContext.request.contextPath}/admin/payments/process"
                          id="paymentForm">

                        <div class="row g-4">

                            <!-- Student -->

                            <div class="col-md-6">

                                <label class="form-label fw-semibold">
                                    Student
                                    <span class="text-danger">*</span>
                                </label>

                                <select name="studentId"
                                        id="studentId"
                                        class="form-select"
                                        required>

                                    <option value="">
                                        Select Student
                                    </option>

                                    <c:forEach var="student"
                                               items="${students}">

                                        <option value="${student.studentId}">

                                            ${student.firstName}
                                            ${student.lastName}
                                            - ${student.rollNo}

                                        </option>

                                    </c:forEach>

                                </select>

                            </div>


                            <!-- Amount -->

                            <div class="col-md-6">

                                <label class="form-label fw-semibold">
                                    Amount
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="input-group">

                                    <span class="input-group-text">
                                        ₹
                                    </span>

                                    <input type="number"
                                           name="amount"
                                           id="amount"
                                           class="form-control"
                                           placeholder="Enter amount"
                                           step="0.01"
                                           min="0.01"
                                           required>

                                </div>

                            </div>


                            <!-- Payment Method -->

                            <div class="col-12">

                                <label class="form-label fw-semibold">
                                    Payment Method
                                    <span class="text-danger">*</span>
                                </label>

                                <div class="row g-3">

                                    <!-- UPI -->

                                    <div class="col-md-4">

                                        <label class="payment-method-card w-100">

                                            <input type="radio"
                                                   name="paymentMethod"
                                                   value="UPI"
                                                   required
                                                   class="payment-method-radio">

                                            <div class="border rounded-3 p-3">

                                                <div class="d-flex align-items-center">

                                                    <i class="bi bi-phone fs-3 me-3 text-primary"></i>

                                                    <div>

                                                        <div class="fw-semibold">
                                                            UPI
                                                        </div>

                                                        <small class="text-muted">
                                                            Google Pay / PhonePe / UPI
                                                        </small>

                                                    </div>

                                                </div>

                                            </div>

                                        </label>

                                    </div>


                                    <!-- CARD -->

                                    <div class="col-md-4">

                                        <label class="payment-method-card w-100">

                                            <input type="radio"
                                                   name="paymentMethod"
                                                   value="CARD"
                                                   class="payment-method-radio">

                                            <div class="border rounded-3 p-3">

                                                <div class="d-flex align-items-center">

                                                    <i class="bi bi-credit-card fs-3 me-3 text-primary"></i>

                                                    <div>

                                                        <div class="fw-semibold">
                                                            Card
                                                        </div>

                                                        <small class="text-muted">
                                                            Debit / Credit Card
                                                        </small>

                                                    </div>

                                                </div>

                                            </div>

                                        </label>

                                    </div>


                                    <!-- NET BANKING -->

                                    <div class="col-md-4">

                                        <label class="payment-method-card w-100">

                                            <input type="radio"
                                                   name="paymentMethod"
                                                   value="NETBANKING"
                                                   class="payment-method-radio">

                                            <div class="border rounded-3 p-3">

                                                <div class="d-flex align-items-center">

                                                    <i class="bi bi-bank fs-3 me-3 text-primary"></i>

                                                    <div>

                                                        <div class="fw-semibold">
                                                            Net Banking
                                                        </div>

                                                        <small class="text-muted">
                                                            Internet Banking
                                                        </small>

                                                    </div>

                                                </div>

                                            </div>

                                        </label>

                                    </div>

                                </div>

                            </div>


                            <!-- Simulation Information -->

                            <div class="col-12">

                                <div class="alert alert-info mb-0">

                                    <div class="d-flex">

                                        <i class="bi bi-info-circle fs-5 me-2"></i>

                                        <div>

                                            <strong>
                                                Learning Project Payment
                                            </strong>

                                            <br>

                                            <small>

                                                This is a simulated payment.
                                                No real money will be transferred.
                                                A unique transaction reference
                                                will be generated automatically.

                                            </small>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>


                        <!-- Buttons -->

                        <div class="d-flex justify-content-end gap-2 mt-4">

                            <a href="${pageContext.request.contextPath}/admin/payments"
                               class="btn btn-outline-secondary">

                                <i class="bi bi-arrow-left me-1"></i>
                                Cancel

                            </a>


                            <button type="submit"
                                    class="btn btn-success"
                                    id="payButton">

                                <i class="bi bi-credit-card me-1"></i>
                                Pay Now

                            </button>

                        </div>

                    </form>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</div>


<!-- ========================================================= -->
<!-- PAGE SCRIPT -->
<!-- ========================================================= -->

<script>

    document.addEventListener("DOMContentLoaded", function () {

        const paymentForm =
            document.getElementById("paymentForm");

        const payButton =
            document.getElementById("payButton");


        if (paymentForm && payButton) {

            paymentForm.addEventListener("submit", function () {

                payButton.disabled = true;

                payButton.innerHTML =
                    '<span class="spinner-border spinner-border-sm me-2"></span>' +
                    'Processing Payment...';

            });

        }


        const methodCards =
            document.querySelectorAll(".payment-method-card");


        methodCards.forEach(function (card) {

            card.addEventListener("click", function () {

                methodCards.forEach(function (item) {

                    item.classList.remove(
                        "border-primary"
                    );

                });


                card.classList.add(
                    "border-primary"
                );

            });

        });

    });

</script>


<style>

    .payment-method-card {
        cursor: pointer;
    }

    .payment-method-card input {
        position: absolute;
        opacity: 0;
        pointer-events: none;
    }

    .payment-method-card > div {
        transition: all 0.2s ease;
    }

    .payment-method-card:hover > div {
        border-color: var(--bs-primary) !important;
        background-color: #f8f9fa;
    }

    .payment-method-card:has(
        input:checked
    ) > div {

        border-color: var(--bs-primary) !important;
        background-color: #f0f7ff;
        box-shadow: 0 0 0 1px var(--bs-primary);

    }

</style>


<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

<jsp:include page="../common/footer.jsp" />