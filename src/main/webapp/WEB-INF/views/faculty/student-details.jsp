<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../common/header.jsp" %>
<%@ include file="../common/faculty-sidebar.jsp" %>
<%@ include file="../common/faculty-navbar.jsp" %>


<div class="faculty-main-content">

    <!-- Page Header -->

    <div class="faculty-content-header">

        <div>

            <a
                href="${pageContext.request.contextPath}/faculty/students"
                class="faculty-back-link">

                <i class="bi bi-arrow-left"></i>
                Back to My Students

            </a>

            <h2>

                <i class="bi bi-person-vcard-fill"></i>
                Student Details

            </h2>

            <p>
                View student and enrollment information.
            </p>

        </div>

    </div>


    <!-- Student Profile -->

    <div class="faculty-student-detail-card">


        <!-- Profile Header -->

        <div class="faculty-student-detail-header">

            <div class="faculty-student-large-avatar">

                <i class="bi bi-person-fill"></i>

            </div>


            <div class="faculty-student-detail-name">

                <h1>
                    ${student.fullName}
                </h1>

                <p>
                    Roll No: ${student.rollNo}
                </p>

                <span class="faculty-enrollment-status enrolled">

                    <i class="bi bi-check-circle-fill"></i>

                    ${student.enrollmentStatus}

                </span>

            </div>

        </div>


        <!-- Personal Information -->

        <div class="faculty-student-detail-section">

            <div class="faculty-section-title">

                <i class="bi bi-person-vcard-fill"></i>
                Personal Information

            </div>


            <div class="faculty-detail-grid">


                <div class="faculty-detail-item">

                    <i class="bi bi-person"></i>

                    <div>

                        <span>First Name</span>

                        <strong>
                            ${student.firstName}
                        </strong>

                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-person"></i>

                    <div>

                        <span>Last Name</span>

                        <strong>
                            ${student.lastName}
                        </strong>

                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-person-badge"></i>

                    <div>

                        <span>Roll Number</span>

                        <strong>
                            ${student.rollNo}
                        </strong>

                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-telephone"></i>

                    <div>

                        <span>Phone</span>

                        <strong>
                            ${student.phone}
                        </strong>

                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-gender-ambiguous"></i>

                    <div>

                        <span>Gender</span>

                        <strong>
                            ${student.gender}
                        </strong>

                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-calendar-date"></i>

                    <div>

                        <span>Date of Birth</span>

                        <strong>
                            ${student.dob}
                        </strong>

                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-geo-alt"></i>

                    <div>

                        <span>Address</span>

                        <strong>
                            ${student.address}
                        </strong>

                    </div>

                </div>

            </div>

        </div>


        <!-- Academic Information -->

        <div class="faculty-student-detail-section">

            <div class="faculty-section-title">

                <i class="bi bi-mortarboard-fill"></i>
                Academic Information

            </div>


            <div class="faculty-detail-grid">


                <div class="faculty-detail-item">

                    <i class="bi bi-building"></i>

                    <div>

                        <span>Department</span>

                        <strong>
                            ${student.departmentName}
                        </strong>

                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-code-square"></i>

                    <div>

                        <span>Department Code</span>

                        <strong>
                            ${student.departmentCode}
                        </strong>

                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-layers"></i>

                    <div>

                        <span>Semester</span>

                        <strong>
                            ${student.semester}
                        </strong>

                    </div>

                </div>


                <div class="faculty-detail-item">

                    <i class="bi bi-book"></i>

                    <div>

                        <span>Course</span>

                        <strong>
                            ${student.courseTitle}
                        </strong>

                    </div>

                </div>

            </div>

        </div>


        <!-- Enrollment Information -->

        <div class="faculty-student-detail-section">

            <div class="faculty-section-title">

                <i class="bi bi-journal-check"></i>
                Enrollment Information

            </div>


            <div class="faculty-student-enrollment-box">


                <div>

                    <span>Course Code</span>

                    <strong>
                        ${student.courseCode}
                    </strong>

                </div>


                <div>

                    <span>Enrollment Date</span>

                    <strong>
                        ${student.enrollmentDate}
                    </strong>

                </div>


                <div>

                    <span>Status</span>

                    <strong>
                        ${student.enrollmentStatus}
                    </strong>

                </div>


                <div>

                    <span>Grade</span>

                    <c:choose>

                        <c:when test="${not empty student.grade}">

                            <strong class="faculty-grade-large">
                                ${student.grade}
                            </strong>

                        </c:when>

                        <c:otherwise>

                            <strong class="faculty-no-grade">
                                Not Assigned
                            </strong>

                        </c:otherwise>

                    </c:choose>

                </div>


            </div>

        </div>


    </div>

</div>