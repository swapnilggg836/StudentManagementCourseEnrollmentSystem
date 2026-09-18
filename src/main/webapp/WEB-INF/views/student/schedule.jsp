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
                My Schedule
            </h2>

            <p class="text-muted mb-0">
                View your enrolled course timetable
            </p>
        </div>

        <a href="${pageContext.request.contextPath}/student/courses"
           class="btn btn-outline-primary">

            <i class="bi bi-book me-1"></i>
            Browse Courses

        </a>

    </div>


    <%@ include file="../common/alerts.jsp" %>


    <div class="row g-3 mb-4">

        <div class="col-md-4">

            <div class="card border-0 shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex align-items-center">

                        <div class="schedule-summary-icon bg-primary-subtle text-primary">

                            <i class="bi bi-calendar3"></i>

                        </div>

                        <div class="ms-3">

                            <div class="text-muted small">
                                Enrolled Courses
                            </div>

                            <h4 class="fw-bold mb-0">
                                ${schedule.size()}
                            </h4>

                        </div>

                    </div>

                </div>

            </div>

        </div>


        <div class="col-md-4">

            <div class="card border-0 shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex align-items-center">

                        <div class="schedule-summary-icon bg-success-subtle text-success">

                            <i class="bi bi-clock"></i>

                        </div>

                        <div class="ms-3">

                            <div class="text-muted small">
                                Classes Scheduled
                            </div>

                            <h4 class="fw-bold mb-0">
                                ${schedule.size()}
                            </h4>

                        </div>

                    </div>

                </div>

            </div>

        </div>


        <div class="col-md-4">

            <div class="card border-0 shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex align-items-center">

                        <div class="schedule-summary-icon bg-warning-subtle text-warning">

                            <i class="bi bi-person-workspace"></i>

                        </div>

                        <div class="ms-3">

                            <div class="text-muted small">
                                Student
                            </div>

                            <h6 class="fw-bold mb-0">
                                ${student.firstName} ${student.lastName}
                            </h6>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <div class="card border-0 shadow-sm">

        <div class="card-body p-0">

            <div class="p-4 border-bottom">

                <h5 class="fw-bold mb-1">

                    <i class="bi bi-calendar-week me-2"></i>

                    Weekly Timetable

                </h5>

                <p class="text-muted mb-0 small">
                    Your current enrolled courses and class timings
                </p>

            </div>


            <c:choose>

                <c:when test="${not empty schedule}">

                    <div class="table-responsive">

                        <table class="table schedule-table align-middle mb-0">

                            <thead>

                                <tr>
                                    <th>#</th>
                                    <th>Course</th>
                                    <th>Code</th>
                                    <th>Credits</th>
                                    <th>Faculty</th>
                                    <th>Day</th>
                                    <th>Time</th>
                                </tr>

                            </thead>


                            <tbody>

                                <c:forEach
                                    var="item"
                                    items="${schedule}"
                                    varStatus="status">

                                    <tr>

                                        <td>

                                            <span class="schedule-number">
                                                ${status.index + 1}
                                            </span>

                                        </td>


                                        <td>

                                            <div class="d-flex align-items-center">

                                                <div class="course-schedule-icon">

                                                    <i class="bi bi-journal-text"></i>

                                                </div>

                                                <div class="ms-3">

                                                    <div class="fw-semibold">
                                                        ${item.courseTitle}
                                                    </div>

                                                </div>

                                            </div>

                                        </td>


                                        <td>

                                            <span class="course-code-badge">
                                                ${item.courseCode}
                                            </span>

                                        </td>


                                        <td>

                                            <span class="fw-semibold">
                                                ${item.credits}
                                            </span>

                                        </td>


                                        <td>

                                            <c:choose>

                                                <c:when test="${not empty item.facultyName}">

                                                    <div class="faculty-name">

                                                        <i class="bi bi-person me-1"></i>

                                                        ${item.facultyName}

                                                    </div>

                                                </c:when>

                                                <c:otherwise>

                                                    <span class="text-muted">
                                                        Not assigned
                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>


                                        <td>

                                            <span class="schedule-day">

                                                <i class="bi bi-calendar-day me-1"></i>

                                                ${item.scheduleDay}

                                            </span>

                                        </td>


                                        <td>

                                            <span class="schedule-time">

                                                <i class="bi bi-clock me-1"></i>

                                                ${item.scheduleTime}

                                            </span>

                                        </td>

                                    </tr>

                                </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </c:when>


                <c:otherwise>

                    <div class="text-center py-5 px-3">

                        <div class="schedule-empty-icon mx-auto mb-3">

                            <i class="bi bi-calendar-x"></i>

                        </div>

                        <h5 class="fw-bold">
                            No Schedule Available
                        </h5>

                        <p class="text-muted mb-4">

                            You don't have any currently enrolled
                            courses with a schedule.

                        </p>

                        <a href="${pageContext.request.contextPath}/student/courses"
                           class="btn btn-primary">

                            <i class="bi bi-search me-1"></i>

                            Browse Courses

                        </a>

                    </div>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</div>