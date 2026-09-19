<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/faculty-sidebar.jsp" %>
<%@ include file="../common/faculty-navbar.jsp" %>

<div class="faculty-main-content">

    <div class="faculty-page-header">
        <div>
            <h1>
                <i class="bi bi-calendar-check"></i>
                Attendance
            </h1>

            <p>
                Manage attendance for your assigned courses
            </p>
        </div>
    </div>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success faculty-alert">
            <i class="bi bi-check-circle-fill"></i>
            ${successMessage}
        </div>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger faculty-alert">
            <i class="bi bi-exclamation-triangle-fill"></i>
            ${errorMessage}
        </div>
    </c:if>


    <!-- Course and date selection -->

    <div class="faculty-attendance-filter-card">

        <div class="faculty-attendance-filter-header">

            <div>
                <h5>
                    <i class="bi bi-funnel"></i>
                    Select Course & Date
                </h5>

                <p>
                    Select one of your assigned courses and attendance date.
                </p>
            </div>

        </div>


        <form method="get"
              action="${pageContext.request.contextPath}/faculty/attendance"
              class="faculty-attendance-filter-form">

            <div class="faculty-attendance-field">

                <label for="courseId">
                    Course
                </label>

                <select
                    id="courseId"
                    name="courseId"
                    class="form-select"
                    required>

                    <option value="">
                        Select Course
                    </option>

                    <c:forEach var="course" items="${courses}">

                        <option
                            value="${course.courseId}"
                            <c:if test="${selectedCourse != null &&
                                          selectedCourse.courseId == course.courseId}">
                                selected
                            </c:if>>

                            ${course.courseCode} -
                            ${course.title}

                        </option>

                    </c:forEach>

                </select>

            </div>


            <div class="faculty-attendance-field">

                <label for="attendanceDate">
                    Date
                </label>

                <input
                    type="date"
                    id="attendanceDate"
                    name="date"
                    class="form-control"
                    value="${selectedDate}"
                    required>

            </div>


            <div class="faculty-attendance-filter-action">

                <button type="submit"
                        class="btn faculty-attendance-load-btn">

                    <i class="bi bi-search"></i>
                    Load Students

                </button>

            </div>

        </form>

    </div>


    <!-- Attendance section -->

    <c:if test="${selectedCourse != null}">

        <div class="faculty-attendance-course-card">

            <div class="faculty-attendance-course-info">

                <div class="faculty-attendance-course-icon">
                    <i class="bi bi-book"></i>
                </div>

                <div>

                    <h4>
                        ${selectedCourse.title}
                    </h4>

                    <p>
                        ${selectedCourse.courseCode}
                        &nbsp; • &nbsp;
                        ${selectedDate}
                    </p>

                </div>

            </div>

            <div class="faculty-attendance-course-meta">

                <span>
                    <i class="bi bi-people"></i>
                    ${students.size()} Students
                </span>

            </div>

        </div>


        <div class="faculty-attendance-table-card">

            <div class="faculty-attendance-table-header">

                <div>
                    <h5>
                        Student Attendance
                    </h5>

                    <p>
                        Mark each student as Present or Absent.
                    </p>
                </div>

            </div>


            <c:choose>

                <c:when test="${empty students}">

                    <div class="faculty-attendance-empty">

                        <div class="faculty-attendance-empty-icon">
                            <i class="bi bi-people"></i>
                        </div>

                        <h5>
                            No Enrolled Students
                        </h5>

                        <p>
                            There are no enrolled students in this course.
                        </p>

                    </div>

                </c:when>


                <c:otherwise>

                    <div class="table-responsive">

                        <table class="table faculty-attendance-table">

                            <thead>

                                <tr>

                                    <th>
                                        #
                                    </th>

                                    <th>
                                        Student
                                    </th>

                                    <th>
                                        Roll No
                                    </th>

                                    <th>
                                        Course
                                    </th>

                                    <th>
                                        Attendance
                                    </th>

                                    <th>
                                        Status
                                    </th>

                                </tr>

                            </thead>


                            <tbody>

                                <c:forEach
                                    var="student"
                                    items="${students}"
                                    varStatus="loop">

                                    <tr>

                                        <td>
                                            ${loop.index + 1}
                                        </td>


                                        <td>

                                            <div class="faculty-attendance-student">

                                                <div class="faculty-attendance-avatar">

                                                    ${student.studentName.substring(0,1).toUpperCase()}

                                                </div>

                                                <div>

                                                    <div class="faculty-attendance-student-name">
                                                        ${student.studentName}
                                                    </div>

                                                </div>

                                            </div>

                                        </td>


                                        <td>

                                            <span class="faculty-attendance-roll">

                                                ${student.rollNo}

                                            </span>

                                        </td>


                                        <td>

                                            <div class="faculty-attendance-course-name">

                                                ${student.courseCode}

                                            </div>

                                            <small>
                                                ${student.courseTitle}
                                            </small>

                                        </td>


                                        <td>

                                            <div class="faculty-attendance-actions">

                                                <form
                                                    method="post"
                                                    action="${pageContext.request.contextPath}/faculty/attendance/save"
                                                    class="faculty-attendance-inline-form">

                                                    <input
                                                        type="hidden"
                                                        name="studentId"
                                                        value="${student.studentId}">

                                                    <input
                                                        type="hidden"
                                                        name="courseId"
                                                        value="${selectedCourse.courseId}">

                                                    <input
                                                        type="hidden"
                                                        name="attendanceDate"
                                                        value="${selectedDate}">


                                                    <button
                                                        type="submit"
                                                        name="status"
                                                        value="PRESENT"
                                                        class="faculty-attendance-present-btn
                                                        <c:if test="${student.status == 'PRESENT'}">
                                                            active
                                                        </c:if>">

                                                        <i class="bi bi-check-lg"></i>
                                                        Present

                                                    </button>


                                                    <button
                                                        type="submit"
                                                        name="status"
                                                        value="ABSENT"
                                                        class="faculty-attendance-absent-btn
                                                        <c:if test="${student.status == 'ABSENT'}">
                                                            active
                                                        </c:if>">

                                                        <i class="bi bi-x-lg"></i>
                                                        Absent

                                                    </button>

                                                </form>

                                            </div>

                                        </td>


                                        <td>

                                            <c:choose>

                                                <c:when test="${student.status == 'PRESENT'}">

                                                    <span class="faculty-attendance-status present">
                                                        <i class="bi bi-check-circle-fill"></i>
                                                        Present
                                                    </span>

                                                </c:when>


                                                <c:when test="${student.status == 'ABSENT'}">

                                                    <span class="faculty-attendance-status absent">
                                                        <i class="bi bi-x-circle-fill"></i>
                                                        Absent
                                                    </span>

                                                </c:when>


                                                <c:otherwise>

                                                    <span class="faculty-attendance-status not-marked">
                                                        <i class="bi bi-dash-circle"></i>
                                                        Not Marked
                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>

                                    </tr>

                                </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </c:otherwise>

            </c:choose>

        </div>

    </c:if>

</div>