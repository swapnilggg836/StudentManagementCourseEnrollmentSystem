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

                        <span>Student</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>My Enrollments</span>

                    </div>

                    <h1>
                        My Enrollments
                    </h1>

                    <p>
                        View and manage the courses you have enrolled in.
                    </p>

                </div>

            </div>


            <!-- FLASH SUCCESS MESSAGE -->

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


            <!-- FLASH ERROR MESSAGE -->

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


            <!-- SUMMARY -->

            <div class="student-enrollment-summary">

                <div class="student-enrollment-summary-icon">

                    <i class="bi bi-journal-check"></i>

                </div>

                <div>

                    <span>
                        Total Enrollments
                    </span>

                    <strong>
                        ${totalEnrollments}
                    </strong>

                </div>

            </div>


            <!-- ENROLLMENTS -->

            <c:choose>

                <c:when test="${not empty enrollments}">

                    <div class="student-enrollment-list">

                        <c:forEach
                            var="enrollment"
                            items="${enrollments}">

                            <div class="student-enrollment-card">

                                <!-- CARD HEADER -->

                                <div class="student-enrollment-card-header">

                                    <div class="student-enrollment-course-icon">

                                        <i class="bi bi-book"></i>

                                    </div>

                                    <div class="student-enrollment-course-title">

                                        <div class="student-enrollment-course-code">

                                            ${enrollment.courseCode}

                                        </div>

                                        <h3>
                                            ${enrollment.courseTitle}
                                        </h3>

                                    </div>


                                    <c:choose>

                                        <c:when test="${enrollment.status == 'ENROLLED'}">

                                            <span class="student-enrollment-status enrolled">

                                                <i class="bi bi-check-circle-fill"></i>

                                                Enrolled

                                            </span>

                                        </c:when>

                                        <c:when test="${enrollment.status == 'COMPLETED'}">

                                            <span class="student-enrollment-status completed">

                                                <i class="bi bi-check2-all"></i>

                                                Completed

                                            </span>

                                        </c:when>

                                        <c:otherwise>

                                            <span class="student-enrollment-status dropped">

                                                <i class="bi bi-x-circle-fill"></i>

                                                Dropped

                                            </span>

                                        </c:otherwise>

                                    </c:choose>

                                </div>


                                <!-- CARD INFORMATION -->

                                <div class="student-enrollment-card-body">

                                    <div class="student-enrollment-info">

                                        <div>

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


                                        <div>

                                            <span>
                                                Semester
                                            </span>

                                            <strong>
                                                ${enrollment.semester}
                                            </strong>

                                        </div>


                                        <div>

                                            <span>
                                                Credits
                                            </span>

                                            <strong>
                                                ${enrollment.credits}
                                            </strong>

                                        </div>


                                        <div>

                                            <span>
                                                Enrollment ID
                                            </span>

                                            <strong>
                                                #${enrollment.enrollmentId}
                                            </strong>

                                        </div>

                                    </div>


                                    <!-- DATE -->

                                    <div class="student-enrollment-date">

                                        <i class="bi bi-calendar3"></i>

                                        Enrolled on

                                        <strong>

                                            ${enrollment.enrollmentDate}

                                        </strong>

                                    </div>


                                    <!-- GRADE -->

                                    <c:if test="${not empty enrollment.grade}">

                                        <div class="student-enrollment-grade">

                                            <span>
                                                Grade
                                            </span>

                                            <strong>
                                                ${enrollment.grade}
                                            </strong>

                                        </div>

                                    </c:if>

                                </div>


                                <!-- CARD FOOTER -->

                                <div class="student-enrollment-card-footer">

                                    <a
                                        href="${pageContext.request.contextPath}/student/enrollment/view?id=${enrollment.enrollmentId}"
                                        class="student-enrollment-view-btn">

                                        <i class="bi bi-eye"></i>

                                        View Details

                                    </a>


                                    <c:if test="${enrollment.status == 'ENROLLED'}">

                                        <form
                                            action="${pageContext.request.contextPath}/student/enrollment/drop"
                                            method="post"
                                            onsubmit="return confirm('Are you sure you want to drop this enrollment?');">

                                            <input
                                                type="hidden"
                                                name="id"
                                                value="${enrollment.enrollmentId}">

                                            <button
                                                type="submit"
                                                class="student-enrollment-drop-btn">

                                                <i class="bi bi-x-circle"></i>

                                                Drop Course

                                            </button>

                                        </form>

                                    </c:if>

                                </div>

                            </div>

                        </c:forEach>

                    </div>

                </c:when>


                <c:otherwise>

                    <div class="student-empty-enrollment">

                        <div class="student-empty-enrollment-icon">

                            <i class="bi bi-journal-x"></i>

                        </div>

                        <h3>
                            No Enrollments Yet
                        </h3>

                        <p>
                            You have not enrolled in any course yet.
                            Explore the available courses and start learning.
                        </p>

                        <a
                            href="${pageContext.request.contextPath}/student/courses"
                            class="student-browse-courses-btn">

                            <i class="bi bi-book"></i>

                            Browse Courses

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