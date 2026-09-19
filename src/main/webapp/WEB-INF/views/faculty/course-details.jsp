<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/faculty-sidebar.jsp" %>
<%@ include file="../common/faculty-navbar.jsp" %>


<div class="faculty-main-content">

    <div class="faculty-content-header">

        <div>

            <a
                href="${pageContext.request.contextPath}/faculty/courses"
                class="faculty-back-link">

                <i class="bi bi-arrow-left"></i>
                Back to My Courses

            </a>

            <h2>
                <i class="bi bi-journal-text"></i>
                Course Details
            </h2>

            <p>
                View complete information about your assigned course.
            </p>

        </div>

    </div>


    <div class="faculty-course-detail-card">

        <!-- Course Header -->

        <div class="faculty-course-detail-header">

            <div>

                <span class="faculty-detail-course-code">
                    ${course.courseCode}
                </span>

                <h1>
                    ${course.title}
                </h1>

                <p>
                    ${course.description}
                </p>

            </div>

            <div class="faculty-detail-credits">

                <strong>
                    ${course.credits}
                </strong>

                <span>
                    Credits
                </span>

            </div>

        </div>


        <!-- Course Information -->

        <div class="faculty-detail-section">

            <div class="faculty-section-title">

                <i class="bi bi-info-circle-fill"></i>
                Course Information

            </div>


            <div class="faculty-detail-grid">

                <div class="faculty-detail-item">

                    <i class="bi bi-building"></i>

                    <div>
                        <span>Department</span>
                        <strong>${course.departmentName}</strong>
                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-code-square"></i>

                    <div>
                        <span>Department Code</span>
                        <strong>${course.departmentCode}</strong>
                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-calendar3"></i>

                    <div>
                        <span>Schedule Day</span>
                        <strong>${course.scheduleDay}</strong>
                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-clock"></i>

                    <div>
                        <span>Schedule Time</span>
                        <strong>${course.scheduleTime}</strong>
                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-currency-rupee"></i>

                    <div>
                        <span>Course Fee</span>
                        <strong>₹${course.feeAmount}</strong>
                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-award"></i>

                    <div>
                        <span>Credits</span>
                        <strong>${course.credits}</strong>
                    </div>

                </div>

            </div>

        </div>


        <!-- Student Statistics -->

        <div class="faculty-detail-section">

            <div class="faculty-section-title">

                <i class="bi bi-people-fill"></i>
                Student Statistics

            </div>


            <div class="faculty-student-stat-grid">

                <div class="faculty-student-stat">

                    <div class="faculty-student-stat-icon">
                        <i class="bi bi-people"></i>
                    </div>

                    <div>

                        <span>Enrolled Students</span>

                        <strong>
                            ${course.enrolledStudents}
                        </strong>

                    </div>

                </div>


                <div class="faculty-student-stat">

                    <div class="faculty-student-stat-icon">
                        <i class="bi bi-person-check"></i>
                    </div>

                    <div>

                        <span>Available Seats</span>

                        <strong>
                            ${course.availableSeats}
                        </strong>

                    </div>

                </div>


                <div class="faculty-student-stat">

                    <div class="faculty-student-stat-icon">
                        <i class="bi bi-people-fill"></i>
                    </div>

                    <div>

                        <span>Total Capacity</span>

                        <strong>
                            ${course.capacity}
                        </strong>

                    </div>

                </div>

            </div>

        </div>


        <!-- Capacity -->

        <div class="faculty-detail-section">

            <div class="faculty-section-title">

                <i class="bi bi-bar-chart-fill"></i>
                Course Capacity

            </div>


            <div class="faculty-detail-capacity">

                <div class="faculty-capacity-header">

                    <span>
                        Enrollment Progress
                    </span>

                    <strong>
                        ${course.enrolledStudents}
                        /
                        ${course.capacity}
                    </strong>

                </div>


                <div class="faculty-capacity-bar faculty-capacity-large">

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

            </div>

        </div>

    </div>

</div>