<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../common/header.jsp" />

<div class="student-layout">


    <!-- ==============================
         SIDEBAR
    =============================== -->

    <jsp:include page="../common/student-sidebar.jsp" />


    <!-- ==============================
         MAIN AREA
    =============================== -->

    <div class="student-main">


        <!-- Navbar -->

        <jsp:include page="../common/student-navbar.jsp" />


        <!-- Page Content -->

        <main class="student-content">


            <!-- ==============================
                 WELCOME SECTION
            =============================== -->

            <section class="student-welcome-section">

                <div>

                    <span class="student-welcome-label">
                        STUDENT PORTAL
                    </span>

                    <h1>
                        Welcome, ${student.firstName} 👋
                    </h1>

                    <p>
                        Here's what's happening with your
                        academic journey.
                    </p>

                </div>


                <div class="student-profile-summary">

                    <div class="student-summary-avatar">

                        <i class="bi bi-person-fill"></i>

                    </div>

                    <div>

                        <strong>
                            ${student.fullName}
                        </strong>

                        <span>
                            ${student.departmentCode}
                            -
                            ${student.departmentName}
                        </span>

                        <small>
                            Roll No: ${student.rollNo}
                        </small>

                    </div>

                </div>

            </section>


            <!-- ==============================
                 STATISTICS
            =============================== -->

            <section class="student-stats-grid">


                <!-- Enrolled Courses -->

                <div class="student-stat-card">

                    <div class="student-stat-icon courses-icon">

                        <i class="bi bi-book-fill"></i>

                    </div>

                    <div class="student-stat-content">

                        <span>
                            Enrolled Courses
                        </span>

                        <strong>
                            ${student.enrolledCourses}
                        </strong>

                        <small>
                            Active courses
                        </small>

                    </div>

                </div>


                <!-- Current Semester -->

                <div class="student-stat-card">

                    <div class="student-stat-icon semester-icon">

                        <i class="bi bi-layers-fill"></i>

                    </div>

                    <div class="student-stat-content">

                        <span>
                            Current Semester
                        </span>

                        <strong>
                            ${student.semester}
                        </strong>

                        <small>
                            Current academic semester
                        </small>

                    </div>

                </div>


                <!-- Total Credits -->

                <div class="student-stat-card">

                    <div class="student-stat-icon credits-icon">

                        <i class="bi bi-award-fill"></i>

                    </div>

                    <div class="student-stat-content">

                        <span>
                            Total Credits
                        </span>

                        <strong>
                            ${student.totalCredits}
                        </strong>

                        <small>
                            Active course credits
                        </small>

                    </div>

                </div>


                <!-- Pending Fees -->

                <div class="student-stat-card">

                    <div class="student-stat-icon fees-icon">

                        <i class="bi bi-credit-card-fill"></i>

                    </div>

                    <div class="student-stat-content">

                        <span>
                            Pending Fees
                        </span>

                        <strong>
                            ₹${student.pendingFees}
                        </strong>

                        <small>
                            <c:choose>

                                <c:when test="${student.pendingFees > 0}">
                                    Payment pending
                                </c:when>

                                <c:otherwise>
                                    No pending payment
                                </c:otherwise>

                            </c:choose>
                        </small>

                    </div>

                </div>

            </section>


            <!-- ==============================
                 QUICK ACTIONS
            =============================== -->

            <section class="student-dashboard-section">

                <div class="student-section-header">

                    <div>

                        <h2>
                            Quick Actions
                        </h2>

                        <p>
                            Access your most frequently used
                            student services.
                        </p>

                    </div>

                </div>


                <div class="student-quick-actions">


                    <a href="${pageContext.request.contextPath}/student/courses"
                       class="student-action-card">

                        <div class="student-action-icon">

                            <i class="bi bi-search"></i>

                        </div>

                        <div>

                            <strong>
                                Browse Courses
                            </strong>

                            <span>
                                Explore available courses
                            </span>

                        </div>

                        <i class="bi bi-arrow-right student-action-arrow"></i>

                    </a>


                    <a href="${pageContext.request.contextPath}/student/enrollments"
                       class="student-action-card">

                        <div class="student-action-icon">

                            <i class="bi bi-journal-check"></i>

                        </div>

                        <div>

                            <strong>
                                My Enrollments
                            </strong>

                            <span>
                                View your enrolled courses
                            </span>

                        </div>

                        <i class="bi bi-arrow-right student-action-arrow"></i>

                    </a>


                    <a href="${pageContext.request.contextPath}/student/fees"
                       class="student-action-card">

                        <div class="student-action-icon">

                            <i class="bi bi-wallet2"></i>

                        </div>

                        <div>

                            <strong>
                                Pay Fees
                            </strong>

                            <span>
                                Manage your payments
                            </span>

                        </div>

                        <i class="bi bi-arrow-right student-action-arrow"></i>

                    </a>


                    <a href="${pageContext.request.contextPath}/student/schedule"
                       class="student-action-card">

                        <div class="student-action-icon">

                            <i class="bi bi-calendar3"></i>

                        </div>

                        <div>

                            <strong>
                                View Schedule
                            </strong>

                            <span>
                                Check your timetable
                            </span>

                        </div>

                        <i class="bi bi-arrow-right student-action-arrow"></i>

                    </a>

                </div>

            </section>


            <!-- ==============================
                 UPCOMING CLASSES
            =============================== -->

            <section class="student-dashboard-section">


                <div class="student-section-header">

                    <div>

                        <h2>
                            Upcoming Classes
                        </h2>

                        <p>
                            Your currently enrolled course schedule.
                        </p>

                    </div>


                    <a href="${pageContext.request.contextPath}/student/schedule"
                       class="student-view-all">

                        View Schedule

                        <i class="bi bi-arrow-right"></i>

                    </a>

                </div>


                <div class="student-classes-card">


                    <c:choose>


                        <c:when test="${not empty upcomingClasses}">


                            <div class="student-classes-list">

                                <c:forEach
                                    var="classItem"
                                    items="${upcomingClasses}">


                                    <div class="student-class-item">


                                        <div class="student-class-day">

                                            <span>
                                                ${classItem.scheduleDay}
                                            </span>

                                            <strong>
                                                ${classItem.scheduleTime}
                                            </strong>

                                        </div>


                                        <div class="student-class-info">

                                            <div class="student-class-code">

                                                ${classItem.courseCode}

                                            </div>

                                            <h3>
                                                ${classItem.courseTitle}
                                            </h3>

                                            <div class="student-class-meta">

                                                <span>

                                                    <i class="bi bi-person-workspace"></i>

                                                    ${classItem.facultyName}

                                                </span>

                                                <span>

                                                    <i class="bi bi-award"></i>

                                                    ${classItem.credits} Credits

                                                </span>

                                            </div>

                                        </div>


                                        <div class="student-class-action">

                                            <a href="${pageContext.request.contextPath}/student/courses"
                                               class="student-class-view-btn">

                                                View Course

                                                <i class="bi bi-arrow-up-right"></i>

                                            </a>

                                        </div>


                                    </div>


                                </c:forEach>

                            </div>


                        </c:when>


                        <c:otherwise>


                            <div class="student-empty-state">

                                <div class="student-empty-icon">

                                    <i class="bi bi-calendar-x"></i>

                                </div>

                                <h3>
                                    No Upcoming Classes
                                </h3>

                                <p>
                                    You don't have any enrolled courses
                                    with a schedule yet.
                                </p>

                                <a href="${pageContext.request.contextPath}/student/courses"
                                   class="btn btn-primary">

                                    Browse Courses

                                </a>

                            </div>


                        </c:otherwise>


                    </c:choose>


                </div>

            </section>


            <!-- ==============================
                 STUDENT INFORMATION
            =============================== -->

            <section class="student-dashboard-info">


                <div class="student-info-card">

                    <div class="student-info-icon">

                        <i class="bi bi-person-vcard"></i>

                    </div>

                    <div>

                        <span>
                            Student ID
                        </span>

                        <strong>
                            ${student.studentId}
                        </strong>

                    </div>

                </div>


                <div class="student-info-card">

                    <div class="student-info-icon">

                        <i class="bi bi-envelope"></i>

                    </div>

                    <div>

                        <span>
                            Email
                        </span>

                        <strong>
                            ${student.email}
                        </strong>

                    </div>

                </div>


                <div class="student-info-card">

                    <div class="student-info-icon">

                        <i class="bi bi-building"></i>

                    </div>

                    <div>

                        <span>
                            Department
                        </span>

                        <strong>
                            ${student.departmentName}
                        </strong>

                    </div>

                </div>


            </section>


        </main>

    </div>

</div>


<script>

document.addEventListener("DOMContentLoaded", function () {

    const sidebarToggle =
        document.getElementById("studentSidebarToggle");

    const sidebar =
        document.getElementById("studentSidebar");

    const profileButton =
        document.getElementById(
            "studentProfileDropdownBtn"
        );

    const profileDropdown =
        document.getElementById(
            "studentProfileDropdown"
        );


    if (sidebarToggle && sidebar) {

        sidebarToggle.addEventListener(
            "click",
            function () {

                sidebar.classList.toggle(
                    "show"
                );

            }
        );

    }


    if (profileButton && profileDropdown) {

        profileButton.addEventListener(
            "click",
            function (event) {

                event.stopPropagation();

                profileDropdown.classList.toggle(
                    "show"
                );

            }
        );

    }


    document.addEventListener(
        "click",
        function () {

            if (profileDropdown) {

                profileDropdown.classList.remove(
                    "show"
                );

            }

        }
    );

});

</script>


<jsp:include page="../common/footer.jsp" />