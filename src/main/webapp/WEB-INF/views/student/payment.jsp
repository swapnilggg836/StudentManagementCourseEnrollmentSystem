<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/student-sidebar.jsp" %>
<%@ include file="../common/student-navbar.jsp" %>


<div class="main-content">

    <!-- ===================================================== -->
    <!-- PAGE HEADER -->
    <!-- ===================================================== -->

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h2 class="fw-bold mb-1">
                Payment
            </h2>

            <p class="text-muted mb-0">
                Complete your course payment
            </p>
        </div>

        <a href="${pageContext.request.contextPath}/student/courses"
           class="btn btn-outline-secondary">

            <i class="bi bi-arrow-left me-1"></i>
            Back to Courses

        </a>

    </div>


    <!-- ===================================================== -->
    <!-- ALERTS -->
    <!-- ===================================================== -->

    <%@ include file="../common/alerts.jsp" %>


    <!-- ===================================================== -->
    <!-- PAYMENT FORM -->
    <!-- ===================================================== -->

    <form method="post"
          action="${pageContext.request.contextPath}/student/payment/process">


        <!-- ================================================= -->
        <!-- IMPORTANT HIDDEN VALUES -->
        <!-- ================================================= -->

        <input type="hidden"
               name="paymentType"
               value="${paymentType}">


        <c:if test="${courseId != null}">

            <input type="hidden"
                   name="courseId"
                   value="${courseId}">

        </c:if>


        <div class="row g-4">


            <!-- ================================================= -->
            <!-- LEFT SIDE - COURSE DETAILS -->
            <!-- ================================================= -->

            <div class="col-lg-8">

                <div class="card border-0 shadow-sm">

                    <div class="card-body p-4">

                        <h5 class="fw-bold mb-4">

                            <i class="bi bi-book me-2"></i>

                            Selected Courses

                        </h5>


                        <c:choose>

                            <c:when test="${not empty paymentCourses}">

                                <c:forEach
                                    var="course"
                                    items="${paymentCourses}">

                                    <div class="border rounded-3 p-3 mb-3">

                                        <div class="row align-items-center">


                                            <!-- COURSE ICON -->

                                            <div class="col-auto">

                                                <div class="rounded-circle
                                                            bg-primary-subtle
                                                            text-primary
                                                            d-flex
                                                            align-items-center
                                                            justify-content-center"
                                                     style="width:50px;height:50px;">

                                                    <i class="bi bi-journal-bookmark fs-4"></i>

                                                </div>

                                            </div>


                                            <!-- COURSE INFORMATION -->

                                            <div class="col">

                                                <h6 class="fw-bold mb-1">

                                                    ${course.title}

                                                </h6>


                                                <div class="small text-muted">

                                                    Course Code:
                                                    <strong>
                                                        ${course.courseCode}
                                                    </strong>

                                                </div>


                                                <div class="small text-muted">

                                                    Credits:
                                                    <strong>
                                                        ${course.credits}
                                                    </strong>

                                                </div>


                                                <c:if test="${not empty course.facultyName}">

                                                    <div class="small text-muted">

                                                        Faculty:
                                                        <strong>
                                                            ${course.facultyName}
                                                        </strong>

                                                    </div>

                                                </c:if>

                                            </div>


                                            <!-- COURSE FEE -->

                                            <div class="col-auto text-end">

                                                <div class="small text-muted">
                                                    Course Fee
                                                </div>

                                                <div class="fw-bold fs-5">

                                                    ₹ ${course.feeAmount}

                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </c:forEach>


                            </c:when>


                            <c:otherwise>

                                <div class="text-center py-5">

                                    <i class="bi bi-cart-x display-4 text-muted"></i>

                                    <h5 class="mt-3">
                                        No courses selected
                                    </h5>

                                    <p class="text-muted">
                                        Please select a course before making payment.
                                    </p>

                                    <a href="${pageContext.request.contextPath}/student/courses"
                                       class="btn btn-primary">

                                        Browse Courses

                                    </a>

                                </div>

                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>


                <!-- ================================================= -->
                <!-- PAYMENT METHOD -->
                <!-- ================================================= -->

                <div class="card border-0 shadow-sm mt-4">

                    <div class="card-body p-4">

                        <h5 class="fw-bold mb-4">

                            <i class="bi bi-credit-card me-2"></i>

                            Select Payment Method

                        </h5>


                        <div class="row g-3">


                            <!-- UPI -->

                            <div class="col-md-4">

                                <input type="radio"
                                       class="btn-check"
                                       name="paymentMethod"
                                       id="upi"
                                       value="UPI"
                                       autocomplete="off"
                                       required>

                                <label class="btn btn-outline-primary w-100 p-3"
                                       for="upi">

                                    <i class="bi bi-phone fs-3 d-block mb-2"></i>

                                    <strong>UPI</strong>

                                    <div class="small text-muted">
                                        Google Pay / PhonePe / UPI
                                    </div>

                                </label>

                            </div>


                            <!-- CARD -->

                            <div class="col-md-4">

                                <input type="radio"
                                       class="btn-check"
                                       name="paymentMethod"
                                       id="card"
                                       value="CARD"
                                       autocomplete="off">

                                <label class="btn btn-outline-primary w-100 p-3"
                                       for="card">

                                    <i class="bi bi-credit-card fs-3 d-block mb-2"></i>

                                    <strong>Card</strong>

                                    <div class="small text-muted">
                                        Debit / Credit Card
                                    </div>

                                </label>

                            </div>


                            <!-- NET BANKING -->

                            <div class="col-md-4">

                                <input type="radio"
                                       class="btn-check"
                                       name="paymentMethod"
                                       id="netbanking"
                                       value="NETBANKING"
                                       autocomplete="off">

                                <label class="btn btn-outline-primary w-100 p-3"
                                       for="netbanking">

                                    <i class="bi bi-bank fs-3 d-block mb-2"></i>

                                    <strong>Net Banking</strong>

                                    <div class="small text-muted">
                                        Internet Banking
                                    </div>

                                </label>

                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <!-- ================================================= -->
            <!-- RIGHT SIDE - PAYMENT SUMMARY -->
            <!-- ================================================= -->

            <div class="col-lg-4">

                <div class="card border-0 shadow-sm">

                    <div class="card-body p-4">

                        <h5 class="fw-bold mb-4">

                            <i class="bi bi-receipt me-2"></i>

                            Payment Summary

                        </h5>


                        <!-- PAYMENT TYPE -->

                        <div class="d-flex justify-content-between mb-3">

                            <span class="text-muted">
                                Payment Type
                            </span>

                            <strong>

                                <c:choose>

                                    <c:when test="${paymentType == 'CART'}">
                                        Cart Payment
                                    </c:when>

                                    <c:otherwise>
                                        Course Payment
                                    </c:otherwise>

                                </c:choose>

                            </strong>

                        </div>


                        <!-- COURSE COUNT -->

                        <div class="d-flex justify-content-between mb-3">

                            <span class="text-muted">
                                Courses
                            </span>

                            <strong>
                                ${paymentCourses.size()}
                            </strong>

                        </div>


                        <hr>


                        <!-- TOTAL -->

                        <div class="d-flex justify-content-between align-items-center">

                            <span class="fw-bold">
                                Total Amount
                            </span>

                            <span class="fw-bold fs-4 text-primary">

                                ₹ ${paymentAmount}

                            </span>

                        </div>


                        <!-- PAYMENT BUTTON -->

                        <button type="submit"
                                class="btn btn-primary w-100 mt-4 py-3"
                                <c:if test="${empty paymentCourses}">
                                    disabled
                                </c:if>
                                >

                            <i class="bi bi-lock-fill me-2"></i>

                            Proceed to Payment

                        </button>


                        <div class="text-center mt-3">

                            <small class="text-muted">

                                <i class="bi bi-shield-check me-1"></i>

                                Secure payment simulation

                            </small>

                        </div>

                    </div>

                </div>


                <!-- ================================================= -->
                <!-- IMPORTANT INFORMATION -->
                <!-- ================================================= -->

                <div class="alert alert-info mt-4">

                    <div class="d-flex">

                        <i class="bi bi-info-circle fs-5 me-2"></i>

                        <div>

                            <strong>Payment Information</strong>

                            <p class="mb-0 small mt-1">

                                This is a simulated payment for the
                                EduManage college project.
                                No real money will be charged.

                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </form>

</div>


<!-- ========================================================= -->
<!-- PAYMENT BUTTON SCRIPT -->
<!-- ========================================================= -->

<script>

document.addEventListener("DOMContentLoaded", function () {

    const form = document.querySelector(
        'form[action*="/student/payment/process"]'
    );

    if (!form) {
        return;
    }


    form.addEventListener("submit", function (event) {

        const selectedMethod =
            document.querySelector(
                'input[name="paymentMethod"]:checked'
            );


        if (!selectedMethod) {

            event.preventDefault();

            alert("Please select a payment method.");

            return;
        }


        const button =
            form.querySelector('button[type="submit"]');


        if (button) {

            button.disabled = true;

            button.innerHTML =
                '<span class="spinner-border spinner-border-sm me-2"></span>' +
                'Processing Payment...';

        }

    });

});

</script>