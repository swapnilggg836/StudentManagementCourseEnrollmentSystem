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

            <!-- PAGE HEADER -->

            <div class="student-page-header">

                <div>

                    <div class="student-breadcrumb">

                        <a href="${pageContext.request.contextPath}/student/courses">
                            Courses
                        </a>

                        <i class="bi bi-chevron-right"></i>

                        <span>
                            Course Details
                        </span>

                    </div>

                    <h1>
                        Course Details
                    </h1>

                    <p>
                        View complete information about this course.
                    </p>

                </div>

            </div>


            <!-- COURSE DETAILS -->

            <div class="student-course-detail-card">

                <!-- COURSE HEADER -->

                <div class="student-course-detail-header">

                    <div class="student-course-detail-icon">
                        <i class="bi bi-book"></i>
                    </div>

                    <div class="student-course-detail-title">

                        <div class="student-course-detail-code">
                            ${course.courseCode}
                        </div>

                        <h2>
                            ${course.title}
                        </h2>

                        <div class="student-course-detail-department">

                            <i class="bi bi-building"></i>

                            <c:choose>

                                <c:when test="${not empty course.departmentCode}">

                                    ${course.departmentCode}
                                    -
                                    ${course.departmentName}

                                </c:when>

                                <c:otherwise>

                                    ${course.departmentName}

                                </c:otherwise>

                            </c:choose>

                        </div>

                    </div>

                </div>


                <!-- DESCRIPTION -->

                <div class="student-course-detail-section">

                    <div class="student-course-detail-section-heading">

                        <i class="bi bi-info-circle"></i>

                        <h3>
                            Course Description
                        </h3>

                    </div>

                    <c:choose>

                        <c:when test="${not empty course.description}">

                            <p class="student-course-detail-description">
                                ${course.description}
                            </p>

                        </c:when>

                        <c:otherwise>

                            <p class="student-course-detail-description muted">
                                No course description has been provided.
                            </p>

                        </c:otherwise>

                    </c:choose>

                </div>


                <!-- COURSE INFORMATION -->

                <div class="student-course-detail-section">

                    <div class="student-course-detail-section-heading">

                        <i class="bi bi-grid"></i>

                        <h3>
                            Course Information
                        </h3>

                    </div>


                    <div class="student-course-detail-grid">

                        <div class="student-course-detail-item">

                            <span>
                                Course Code
                            </span>

                            <strong>
                                ${course.courseCode}
                            </strong>

                        </div>


                        <div class="student-course-detail-item">

                            <span>
                                Credits
                            </span>

                            <strong>
                                ${course.credits}
                            </strong>

                        </div>


                        <div class="student-course-detail-item">

                            <span>
                                Department
                            </span>

                            <strong>
                                ${course.departmentName}
                            </strong>

                        </div>


                        <div class="student-course-detail-item">

                            <span>
                                Faculty
                            </span>

                            <strong>

                                <c:choose>

                                    <c:when test="${not empty course.facultyName}">
                                        ${course.facultyName}
                                    </c:when>

                                    <c:otherwise>
                                        Not assigned
                                    </c:otherwise>

                                </c:choose>

                            </strong>

                        </div>


                        <div class="student-course-detail-item">

                            <span>
                                Schedule
                            </span>

                            <strong>

                                <c:choose>

                                    <c:when test="${not empty course.scheduleDay}">

                                        ${course.scheduleDay}

                                        <c:if test="${not empty course.scheduleTime}">
                                            · ${course.scheduleTime}
                                        </c:if>

                                    </c:when>

                                    <c:otherwise>
                                        Not available
                                    </c:otherwise>

                                </c:choose>

                            </strong>

                        </div>


                        <div class="student-course-detail-item">

                            <span>
                                Course Fee
                            </span>

                            <strong>
                                ₹${course.feeAmount}
                            </strong>

                        </div>

                    </div>

                </div>


                <!-- ENROLLMENT INFORMATION -->

                <div class="student-course-detail-section">

                    <div class="student-course-detail-section-heading">

                        <i class="bi bi-people"></i>

                        <h3>
                            Enrollment Information
                        </h3>

                    </div>


                    <div class="student-course-enrollment-info">

                        <div class="student-course-enrollment-stat">

                            <div class="student-course-enrollment-stat-icon">
                                <i class="bi bi-person-check"></i>
                            </div>

                            <div>

                                <span>
                                    Enrolled Students
                                </span>

                                <strong>
                                    ${course.enrolledStudents}
                                </strong>

                            </div>

                        </div>


                        <div class="student-course-enrollment-stat">

                            <div class="student-course-enrollment-stat-icon">
                                <i class="bi bi-person-plus"></i>
                            </div>

                            <div>

                                <span>
                                    Available Seats
                                </span>

                                <strong>
                                    ${course.availableSeats}
                                </strong>

                            </div>

                        </div>


                        <div class="student-course-enrollment-stat">

                            <div class="student-course-enrollment-stat-icon">
                                <i class="bi bi-people"></i>
                            </div>

                            <div>

                                <span>
                                    Total Capacity
                                </span>

                                <strong>
                                    ${course.capacity}
                                </strong>

                            </div>

                        </div>

                    </div>


                    <c:choose>

                        <c:when test="${course.enrolled}">

                            <div class="student-course-detail-status enrolled">

                                <i class="bi bi-check-circle-fill"></i>

                                You are already enrolled in this course.

                            </div>

                        </c:when>

                        <c:when test="${course.availableSeats <= 0}">

                            <div class="student-course-detail-status full">

                                <i class="bi bi-x-circle-fill"></i>

                                This course is currently full.

                            </div>

                        </c:when>

                        <c:otherwise>

                            <div class="student-course-detail-status available">

                                <i class="bi bi-check-circle-fill"></i>

                                This course is available for enrollment.

                            </div>

                        </c:otherwise>

                    </c:choose>

                </div>


                <!-- ACTIONS -->

                <div class="student-course-detail-actions">

                    <a
                        href="${pageContext.request.contextPath}/student/courses"
                        class="student-course-back-btn">

                        <i class="bi bi-arrow-left"></i>

                        Back to Courses

                    </a>


                    <c:choose>

                        <c:when test="${course.enrolled}">

                            <button
                                type="button"
                                class="student-course-enrolled-btn"
                                disabled>

                                <i class="bi bi-check-circle-fill"></i>

                                Already Enrolled

                            </button>

                        </c:when>

                        <c:when test="${course.availableSeats <= 0}">

                            <button
                                type="button"
                                class="student-course-full-btn"
                                disabled>

                                <i class="bi bi-lock-fill"></i>

                                Course Full

                            </button>

                        </c:when>

                        <c:otherwise>

                            <a
                                href="${pageContext.request.contextPath}/student/enroll?courseId=${course.courseId}"
                                class="student-course-detail-enroll-btn">

                                <i class="bi bi-plus-circle"></i>

                                Enroll Now

                            </a>

                        </c:otherwise>

                    </c:choose>

                </div>

            </div>

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