<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core" %>

<jsp:include page="../common/header.jsp" />

<div class="student-layout">

    <jsp:include page="../common/student-sidebar.jsp" />

    <div class="student-main">

        <jsp:include page="../common/student-navbar.jsp" />

        <main class="student-content">


            <div class="student-page-header">

                <div>

                    <div class="student-breadcrumb">

                        <a href="${pageContext.request.contextPath}/student/dashboard">
                            Student
                        </a>

                        <i class="bi bi-chevron-right"></i>

                        <a href="${pageContext.request.contextPath}/student/enrollments">
                            My Enrollments
                        </a>

                        <i class="bi bi-chevron-right"></i>

                        <span>
                            Enrollment Details
                        </span>

                    </div>


                    <h1>
                        Enrollment Details
                    </h1>

                    <p>
                        View complete information about your enrollment.
                    </p>

                </div>

            </div>


            <div class="student-enrollment-detail-card">


                <!-- HEADER -->

                <div class="student-enrollment-detail-header">

                    <div class="student-enrollment-detail-icon">

                        <i class="bi bi-book"></i>

                    </div>


                    <div>

                        <span class="student-enrollment-course-code">
                            ${enrollment.courseCode}
                        </span>

                        <h2>
                            ${enrollment.courseTitle}
                        </h2>

                    </div>


                    <div class="student-enrollment-status">

                        <c:choose>

                            <c:when test="${enrollment.status == 'ENROLLED'}">

                                <span class="student-status enrolled">

                                    <i class="bi bi-check-circle-fill"></i>

                                    Enrolled

                                </span>

                            </c:when>

                            <c:when test="${enrollment.status == 'DROPPED'}">

                                <span class="student-status dropped">

                                    <i class="bi bi-x-circle-fill"></i>

                                    Dropped

                                </span>

                            </c:when>

                            <c:when test="${enrollment.status == 'COMPLETED'}">

                                <span class="student-status completed">

                                    <i class="bi bi-check2-circle"></i>

                                    Completed

                                </span>

                            </c:when>

                            <c:otherwise>

                                <span class="student-status">
                                    ${enrollment.status}
                                </span>

                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>


                <!-- COURSE INFORMATION -->

                <div class="student-detail-section">

                    <div class="student-detail-section-title">

                        <i class="bi bi-book"></i>

                        <h3>
                            Course Information
                        </h3>

                    </div>


                    <div class="student-detail-grid">


                        <div class="student-detail-item">

                            <span>
                                Course Code
                            </span>

                            <strong>
                                ${enrollment.courseCode}
                            </strong>

                        </div>


                        <div class="student-detail-item">

                            <span>
                                Course Title
                            </span>

                            <strong>
                                ${enrollment.courseTitle}
                            </strong>

                        </div>


                        <div class="student-detail-item">

                            <span>
                                Department
                            </span>

                            <strong>

                                <c:choose>

                                    <c:when test="${not empty enrollment.departmentCode}">

                                        ${enrollment.departmentCode}
                                        -
                                        ${enrollment.departmentName}

                                    </c:when>

                                    <c:otherwise>

                                        ${enrollment.departmentName}

                                    </c:otherwise>

                                </c:choose>

                            </strong>

                        </div>


                        <div class="student-detail-item">

                            <span>
                                Semester
                            </span>

                            <strong>
                                ${enrollment.semester}
                            </strong>

                        </div>


                        <div class="student-detail-item">

                            <span>
                                Credits
                            </span>

                            <strong>
                                ${enrollment.credits}
                            </strong>

                        </div>


                        <div class="student-detail-item">

                            <span>
                                Enrollment ID
                            </span>

                            <strong>
                                #${enrollment.enrollmentId}
                            </strong>

                        </div>

                    </div>

                </div>


                <!-- STUDENT INFORMATION -->

                <div class="student-detail-section">

                    <div class="student-detail-section-title">

                        <i class="bi bi-person"></i>

                        <h3>
                            Student Information
                        </h3>

                    </div>


                    <div class="student-detail-grid">


                        <div class="student-detail-item">

                            <span>
                                Student Name
                            </span>

                            <strong>
                                ${student.firstName}
                                ${student.lastName}
                            </strong>

                        </div>


                        <div class="student-detail-item">

                            <span>
                                Roll Number
                            </span>

                            <strong>
                                ${student.rollNo}
                            </strong>

                        </div>


                        <div class="student-detail-item">

                            <span>
                                Department
                            </span>

                            <strong>
                                ${student.departmentName}
                            </strong>

                        </div>


                        <div class="student-detail-item">

                            <span>
                                Semester
                            </span>

                            <strong>
                                ${student.semester}
                            </strong>

                        </div>

                    </div>

                </div>


                <!-- ENROLLMENT INFORMATION -->

                <div class="student-detail-section">

                    <div class="student-detail-section-title">

                        <i class="bi bi-calendar-check"></i>

                        <h3>
                            Enrollment Information
                        </h3>

                    </div>


                    <div class="student-detail-grid">


                        <div class="student-detail-item">

                            <span>
                                Enrollment Date
                            </span>

                            <strong>
                                ${enrollment.enrollmentDate}
                            </strong>

                        </div>


                        <div class="student-detail-item">

                            <span>
                                Status
                            </span>

                            <strong>
                                ${enrollment.status}
                            </strong>

                        </div>


                        <div class="student-detail-item">

                            <span>
                                Grade
                            </span>

                            <strong>

                                <c:choose>

                                    <c:when test="${not empty enrollment.grade}">

                                        ${enrollment.grade}

                                    </c:when>

                                    <c:otherwise>

                                        Not assigned

                                    </c:otherwise>

                                </c:choose>

                            </strong>

                        </div>

                    </div>

                </div>


                <!-- ACTIONS -->

                <div class="student-enrollment-detail-actions">


                    <a
                        href="${pageContext.request.contextPath}/student/enrollments"
                        class="student-detail-back-btn">

                        <i class="bi bi-arrow-left"></i>

                        Back to My Enrollments

                    </a>


                    <c:if test="${enrollment.status == 'ENROLLED'}">

                        <form
                            action="${pageContext.request.contextPath}/student/enrollment/drop"
                            method="post"
                            onsubmit="return confirm('Are you sure you want to drop this course?');">

                            <input
                                type="hidden"
                                name="id"
                                value="${enrollment.enrollmentId}">

                            <button
                                type="submit"
                                class="student-detail-drop-btn">

                                <i class="bi bi-x-circle"></i>

                                Drop Course

                            </button>

                        </form>

                    </c:if>

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