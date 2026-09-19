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
                <i class="bi bi-people-fill"></i>
                My Students
            </h2>

            <p>
                View students enrolled in your assigned courses.
            </p>

        </div>

        <div class="faculty-course-count">

            <i class="bi bi-people"></i>

            <span>
                ${students.size()} Student(s)
            </span>

        </div>

    </div>


    <!-- Search -->

    <div class="faculty-student-search-card">

        <form
            action="${pageContext.request.contextPath}/faculty/students"
            method="get"
            class="faculty-student-search-form">

            <div class="faculty-search-input-wrapper">

                <i class="bi bi-search"></i>

                <input
                    type="text"
                    name="keyword"
                    value="${keyword}"
                    placeholder="Search by roll no, name, course or department...">

            </div>

            <button
                type="submit"
                class="faculty-search-btn">

                <i class="bi bi-search"></i>
                Search

            </button>

            <c:if test="${not empty keyword}">

                <a
                    href="${pageContext.request.contextPath}/faculty/students"
                    class="faculty-clear-search">

                    <i class="bi bi-x-circle"></i>
                    Clear

                </a>

            </c:if>

        </form>

    </div>


    <!-- Students -->

    <c:choose>

        <c:when test="${empty students}">

            <div class="faculty-empty-state">

                <div class="faculty-empty-icon">
                    <i class="bi bi-people"></i>
                </div>

                <h3>No Students Found</h3>

                <p>
                    No students are currently enrolled in your courses.
                </p>

            </div>

        </c:when>


        <c:otherwise>

            <div class="faculty-students-card">

                <div class="faculty-students-table-wrapper">

                    <table class="faculty-students-table">

                        <thead>

                            <tr>

                                <th>Student</th>

                                <th>Roll No</th>

                                <th>Department</th>

                                <th>Semester</th>

                                <th>Course</th>

                                <th>Status</th>

                                <th>Grade</th>

                                <th>Action</th>

                            </tr>

                        </thead>


                        <tbody>

                            <c:forEach
                                var="student"
                                items="${students}">

                                <tr>

                                    <!-- Student -->

                                    <td>

                                        <div class="faculty-student-name">

                                            <div class="faculty-student-avatar">

                                                <i class="bi bi-person-fill"></i>

                                            </div>

                                            <div>

                                                <strong>
                                                    ${student.fullName}
                                                </strong>

                                                <span>
                                                    ${student.phone}
                                                </span>

                                            </div>

                                        </div>

                                    </td>


                                    <!-- Roll No -->

                                    <td>

                                        <span class="faculty-roll-badge">
                                            ${student.rollNo}
                                        </span>

                                    </td>


                                    <!-- Department -->

                                    <td>

                                        <div class="faculty-table-department">

                                            <strong>
                                                ${student.departmentName}
                                            </strong>

                                            <span>
                                                ${student.departmentCode}
                                            </span>

                                        </div>

                                    </td>


                                    <!-- Semester -->

                                    <td>
                                        ${student.semester}
                                    </td>


                                    <!-- Course -->

                                    <td>

                                        <div class="faculty-table-course">

                                            <strong>
                                                ${student.courseTitle}
                                            </strong>

                                            <span>
                                                ${student.courseCode}
                                            </span>

                                        </div>

                                    </td>


                                    <!-- Status -->

                                    <td>

                                        <c:choose>

                                            <c:when test="${student.enrollmentStatus == 'ENROLLED'}">

                                                <span class="faculty-enrollment-status enrolled">
                                                    <i class="bi bi-check-circle-fill"></i>
                                                    Enrolled
                                                </span>

                                            </c:when>

                                            <c:when test="${student.enrollmentStatus == 'COMPLETED'}">

                                                <span class="faculty-enrollment-status completed">
                                                    <i class="bi bi-check2-all"></i>
                                                    Completed
                                                </span>

                                            </c:when>

                                            <c:otherwise>

                                                <span class="faculty-enrollment-status dropped">
                                                    <i class="bi bi-x-circle-fill"></i>
                                                    ${student.enrollmentStatus}
                                                </span>

                                            </c:otherwise>

                                        </c:choose>

                                    </td>


                                    <!-- Grade -->

                                    <td>

                                        <c:choose>

                                            <c:when test="${not empty student.grade}">

                                                <span class="faculty-grade-badge">
                                                    ${student.grade}
                                                </span>

                                            </c:when>

                                            <c:otherwise>

                                                <span class="faculty-no-grade">
                                                    Not Assigned
                                                </span>

                                            </c:otherwise>

                                        </c:choose>

                                    </td>


                                    <!-- Action -->

                                    <td>

                                        <a
                                            href="${pageContext.request.contextPath}/faculty/student?id=${student.studentId}"
                                            class="faculty-view-student-btn"
                                            title="View Student">

                                            <i class="bi bi-eye"></i>

                                        </a>

                                    </td>

                                </tr>

                            </c:forEach>

                        </tbody>

                    </table>

                </div>

            </div>

        </c:otherwise>

    </c:choose>

</div>