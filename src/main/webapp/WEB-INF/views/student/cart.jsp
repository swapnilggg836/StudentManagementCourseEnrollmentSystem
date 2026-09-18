<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../common/header.jsp" />

<div class="student-layout">

    <jsp:include page="../common/student-sidebar.jsp" />

    <div class="student-main">

        <jsp:include page="../common/student-navbar.jsp" />

        <main class="student-content">

            <div class="student-page-header">

                <div>

                    <div class="student-breadcrumb">

                        <span>Student</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>My Cart</span>

                    </div>

                    <h1>
                        My Cart
                    </h1>

                    <p>
                        Review your selected courses before enrollment.
                    </p>

                </div>

            </div>


            <c:if test="${not empty successMessage}">

                <div class="student-alert student-alert-success">

                    <i class="bi bi-check-circle-fill"></i>

                    <span>
                        ${successMessage}
                    </span>

                    <button
                        type="button"
                        class="student-alert-close"
                        onclick="this.parentElement.remove();">

                        <i class="bi bi-x"></i>

                    </button>

                </div>

            </c:if>


            <c:if test="${not empty errorMessage}">

                <div class="student-alert student-alert-error">

                    <i class="bi bi-exclamation-circle-fill"></i>

                    <span>
                        ${errorMessage}
                    </span>

                    <button
                        type="button"
                        class="student-alert-close"
                        onclick="this.parentElement.remove();">

                        <i class="bi bi-x"></i>

                    </button>

                </div>

            </c:if>


            <c:choose>

                <c:when test="${not empty cartCourses}">

                    <div class="student-cart-layout">


                        <div class="student-cart-items">

                            <div class="student-cart-section-header">

                                <div>

                                    <h2>
                                        Selected Courses
                                    </h2>

                                    <span>
                                        ${cartCount} course(s)
                                    </span>

                                </div>


                                <form
                                    action="${pageContext.request.contextPath}/student/cart/clear"
                                    method="post"
                                    onsubmit="return confirm('Clear all courses from your cart?');">

                                    <button
                                        type="submit"
                                        class="student-cart-clear-btn">

                                        <i class="bi bi-trash3"></i>

                                        Clear Cart

                                    </button>

                                </form>

                            </div>


                            <c:forEach
                                var="course"
                                items="${cartCourses}">

                                <div class="student-cart-card">


                                    <div class="student-cart-course-icon">

                                        <i class="bi bi-book"></i>

                                    </div>


                                    <div class="student-cart-course-info">

                                        <div class="student-cart-course-code">

                                            ${course.courseCode}

                                        </div>

                                        <h3>

                                            ${course.title}

                                        </h3>


                                        <div class="student-cart-course-meta">

                                            <span>

                                                <i class="bi bi-building"></i>

                                                ${course.departmentCode}
                                                -
                                                ${course.departmentName}

                                            </span>


                                            <span>

                                                <i class="bi bi-award"></i>

                                                ${course.credits} Credits

                                            </span>


                                            <span>

                                                <i class="bi bi-calendar3"></i>

                                                ${course.scheduleDay}

                                            </span>

                                        </div>

                                    </div>


                                    <div class="student-cart-course-fee">

                                        <span>
                                            Course Fee
                                        </span>

                                        <strong>
                                            ₹${course.feeAmount}
                                        </strong>

                                    </div>


                                    <form
                                        action="${pageContext.request.contextPath}/student/cart/remove"
                                        method="post">

                                        <input
                                            type="hidden"
                                            name="courseId"
                                            value="${course.courseId}">

                                        <button
                                            type="submit"
                                            class="student-cart-remove-btn"
                                            title="Remove from cart">

                                            <i class="bi bi-trash"></i>

                                        </button>

                                    </form>

                                </div>

                            </c:forEach>

                        </div>


                        <div class="student-cart-summary">

                            <div class="student-cart-summary-header">

                                <h2>
                                    Enrollment Summary
                                </h2>

                                <i class="bi bi-receipt"></i>

                            </div>


                            <div class="student-cart-summary-row">

                                <span>
                                    Courses
                                </span>

                                <strong>
                                    ${cartCount}
                                </strong>

                            </div>


                            <div class="student-cart-summary-row">

                                <span>
                                    Total Credits
                                </span>

                                <strong>

                                    <c:set
                                        var="totalCredits"
                                        value="0" />

                                    <c:forEach
                                        var="course"
                                        items="${cartCourses}">

                                        <c:set
                                            var="totalCredits"
                                            value="${totalCredits + course.credits}" />

                                    </c:forEach>

                                    ${totalCredits}

                                </strong>

                            </div>


                            <div class="student-cart-summary-divider"></div>


                            <div class="student-cart-total">

                                <span>
                                    Total Fee
                                </span>

                                <strong>
                                    ₹${cartTotal}
                                </strong>

                            </div>


                            <form
                                action="${pageContext.request.contextPath}/student/cart/enroll"
                                method="post"
                                onsubmit="return confirm('Proceed with enrollment for all courses in your cart?');">

                                <button
                                    type="submit"
                                    class="student-cart-enroll-btn">

                                    <i class="bi bi-check-circle"></i>

                                    Proceed to Enrollment

                                </button>

                            </form>


                            <a
                                href="${pageContext.request.contextPath}/student/courses"
                                class="student-cart-continue-btn">

                                <i class="bi bi-arrow-left"></i>

                                Continue Browsing Courses

                            </a>

                        </div>

                    </div>

                </c:when>


                <c:otherwise>

                    <div class="student-empty-cart">

                        <div class="student-empty-cart-icon">

                            <i class="bi bi-cart-x"></i>

                        </div>

                        <h2>
                            Your Cart is Empty
                        </h2>

                        <p>

                            You haven't added any courses to your cart yet.

                            Browse available courses and add the ones you
                            want to enroll in.

                        </p>

                        <a
                            href="${pageContext.request.contextPath}/student/courses"
                            class="student-browse-courses-btn">

                            <i class="bi bi-book"></i>

                            Browse Available Courses

                        </a>

                    </div>

                </c:otherwise>

            </c:choose>

        </main>

    </div>

</div>


<script>

document.addEventListener("DOMContentLoaded", function () {

    const menuButton =
        document.querySelector(".student-menu-toggle");

    const sidebar =
        document.querySelector(".student-sidebar");

    if (menuButton && sidebar) {

        menuButton.addEventListener("click", function () {

            sidebar.classList.toggle("show");

        });

    }

});

</script>

</body>

</html>