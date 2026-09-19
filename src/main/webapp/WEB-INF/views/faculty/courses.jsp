<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/faculty-sidebar.jsp" %>
<%@ include file="../common/faculty-navbar.jsp" %>


<div class="faculty-main-content">

    <!-- Page Header -->

    <div class="faculty-content-header">

        <div>
            <h2>
                <i class="bi bi-book-half"></i>
                My Courses
            </h2>

            <p>
                View and manage the courses assigned to you.
            </p>
        </div>

        <div class="faculty-course-count">

            <i class="bi bi-journal-bookmark-fill"></i>

            <span>
                ${courses.size()} Course(s)
            </span>

        </div>

    </div>


    <!-- Course List -->

    <c:choose>

        <c:when test="${empty courses}">

            <div class="faculty-empty-state">

                <div class="faculty-empty-icon">
                    <i class="bi bi-book"></i>
                </div>

                <h3>No Courses Assigned</h3>

                <p>
                    There are currently no courses assigned to you.
                </p>

            </div>

        </c:when>


        <c:otherwise>

            <div class="faculty-course-grid">

                <c:forEach var="course" items="${courses}">

                    <div class="faculty-course-card">

                        <div class="faculty-course-card-top">

                            <div class="faculty-course-code">
                                ${course.courseCode}
                            </div>

                            <span class="faculty-course-credits">
                                ${course.credits} Credits
                            </span>

                        </div>


                        <div class="faculty-course-body">

                            <h3>
                                ${course.title}
                            </h3>

                            <p class="faculty-course-description">
                                ${course.description}
                            </p>


                            <div class="faculty-course-info">

                                <div>
                                    <i class="bi bi-building"></i>

                                    <span>
                                        ${course.departmentName}
                                    </span>
                                </div>


                                <div>
                                    <i class="bi bi-calendar3"></i>

                                    <span>
                                        ${course.scheduleDay}
                                    </span>
                                </div>


                                <div>
                                    <i class="bi bi-clock"></i>

                                    <span>
                                        ${course.scheduleTime}
                                    </span>
                                </div>


                                <div>
                                    <i class="bi bi-currency-rupee"></i>

                                    <span>
                                        ₹${course.feeAmount}
                                    </span>
                                </div>

                            </div>


                            <div class="faculty-course-capacity">

                                <div class="faculty-capacity-header">

                                    <span>
                                        Student Capacity
                                    </span>

                                    <strong>
                                        ${course.enrolledStudents}
                                        /
                                        ${course.capacity}
                                    </strong>

                                </div>


                                <div class="faculty-capacity-bar">

                                    <c:choose>

                                        <c:when test="${course.capacity > 0}">

                                            <div
                                                class="faculty-capacity-progress"
                                                style="width:${(course.enrolledStudents * 100) / course.capacity}%">
                                            </div>

                                        </c:when>

                                        <c:otherwise>

                                            <div
                                                class="faculty-capacity-progress"
                                                style="width:0%">
                                            </div>

                                        </c:otherwise>

                                    </c:choose>

                                </div>


                                <div class="faculty-capacity-footer">

                                    <span>
                                        <i class="bi bi-people-fill"></i>
                                        ${course.enrolledStudents} Enrolled
                                    </span>

                                    <span>
                                        ${course.availableSeats} Seats Available
                                    </span>

                                </div>

                            </div>

                        </div>


                        <div class="faculty-course-card-footer">

                            <a
                                href="${pageContext.request.contextPath}/faculty/course?id=${course.courseId}"
                                class="faculty-course-details-btn">

                                <span>
                                    View Details
                                </span>

                                <i class="bi bi-arrow-right"></i>

                            </a>

                        </div>

                    </div>

                </c:forEach>

            </div>

        </c:otherwise>

    </c:choose>

</div>