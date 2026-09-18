<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../common/header.jsp" />

<div class="student-layout">

    <!-- ===================================================== -->
    <!-- STUDENT SIDEBAR -->
    <!-- ===================================================== -->

    <jsp:include page="../common/student-sidebar.jsp" />


    <!-- ===================================================== -->
    <!-- MAIN CONTENT -->
    <!-- ===================================================== -->

    <div class="student-main">

        <!-- ================================================= -->
        <!-- NAVBAR -->
        <!-- ================================================= -->

        <jsp:include page="../common/student-navbar.jsp" />


        <!-- ================================================= -->
        <!-- PAGE CONTENT -->
        <!-- ================================================= -->

        <main class="student-content">

            <!-- PAGE HEADER -->

            <div class="student-page-header">

                <div>
                    <div class="student-breadcrumb">
                        <span>Student</span>
                        <i class="bi bi-chevron-right"></i>
                        <span>Profile</span>
                    </div>

                    <h1>My Profile</h1>

                    <p>
                        View your personal and academic information.
                    </p>
                </div>

            </div>


            <!-- ================================================= -->
            <!-- PROFILE CARD -->
            <!-- ================================================= -->

            <div class="student-profile-card">

                <!-- PROFILE HEADER -->

                <div class="student-profile-header">

                    <div class="student-profile-avatar">
                        <i class="bi bi-person"></i>
                    </div>

                    <div class="student-profile-title">

                        <h2>
                            ${student.fullName}
                        </h2>

                        <p>
                            Roll No: ${student.rollNo}
                        </p>

                        <div class="student-profile-badges">

                            <span class="student-profile-badge">
                                <i class="bi bi-mortarboard-fill"></i>
                                Student
                            </span>

                            <c:choose>

                                <c:when test="${student.status == 'ACTIVE'}">

                                    <span class="student-profile-status active">
                                        <i class="bi bi-check-circle-fill"></i>
                                        Active
                                    </span>

                                </c:when>

                                <c:otherwise>

                                    <span class="student-profile-status inactive">
                                        <i class="bi bi-x-circle-fill"></i>
                                        ${student.status}
                                    </span>

                                </c:otherwise>

                            </c:choose>

                        </div>

                    </div>

                </div>


                <!-- ================================================= -->
                <!-- PERSONAL INFORMATION -->
                <!-- ================================================= -->

                <div class="student-profile-section">

                    <div class="student-profile-section-title">

                        <div class="student-section-icon">
                            <i class="bi bi-person-vcard"></i>
                        </div>

                        <div>
                            <h3>Personal Information</h3>
                            <p>Your registered personal details</p>
                        </div>

                    </div>


                    <div class="student-profile-grid">

                        <!-- FIRST NAME -->

                        <div class="student-profile-field">

                            <label>First Name</label>

                            <div class="student-profile-value">
                                <i class="bi bi-person"></i>
                                <span>${student.firstName}</span>
                            </div>

                        </div>


                        <!-- LAST NAME -->

                        <div class="student-profile-field">

                            <label>Last Name</label>

                            <div class="student-profile-value">
                                <i class="bi bi-person"></i>
                                <span>${student.lastName}</span>
                            </div>

                        </div>


                        <!-- EMAIL -->

                        <div class="student-profile-field">

                            <label>Email Address</label>

                            <div class="student-profile-value">

                                <i class="bi bi-envelope"></i>

                                <span>
                                    ${student.email}
                                </span>

                            </div>

                        </div>


                        <!-- PHONE -->

                        <div class="student-profile-field">

                            <label>Phone Number</label>

                            <div class="student-profile-value">

                                <i class="bi bi-telephone"></i>

                                <span>
                                    <c:choose>

                                        <c:when test="${not empty student.phone}">
                                            ${student.phone}
                                        </c:when>

                                        <c:otherwise>
                                            Not provided
                                        </c:otherwise>

                                    </c:choose>
                                </span>

                            </div>

                        </div>


                        <!-- GENDER -->

                        <div class="student-profile-field">

                            <label>Gender</label>

                            <div class="student-profile-value">

                                <i class="bi bi-gender-ambiguous"></i>

                                <span>
                                    <c:choose>

                                        <c:when test="${not empty student.gender}">
                                            ${student.gender}
                                        </c:when>

                                        <c:otherwise>
                                            Not provided
                                        </c:otherwise>

                                    </c:choose>
                                </span>

                            </div>

                        </div>


                        <!-- DATE OF BIRTH -->

                        <div class="student-profile-field">

                            <label>Date of Birth</label>

                            <div class="student-profile-value">

                                <i class="bi bi-calendar3"></i>

                                <span>
                                    <c:choose>

                                        <c:when test="${not empty student.dob}">
                                            ${student.dob}
                                        </c:when>

                                        <c:otherwise>
                                            Not provided
                                        </c:otherwise>

                                    </c:choose>
                                </span>

                            </div>

                        </div>


                        <!-- ADDRESS -->

                        <div class="student-profile-field full-width">

                            <label>Address</label>

                            <div class="student-profile-value">

                                <i class="bi bi-geo-alt"></i>

                                <span>

                                    <c:choose>

                                        <c:when test="${not empty student.address}">
                                            ${student.address}
                                        </c:when>

                                        <c:otherwise>
                                            Not provided
                                        </c:otherwise>

                                    </c:choose>

                                </span>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- ================================================= -->
                <!-- ACADEMIC INFORMATION -->
                <!-- ================================================= -->

                <div class="student-profile-section">

                    <div class="student-profile-section-title">

                        <div class="student-section-icon">
                            <i class="bi bi-mortarboard"></i>
                        </div>

                        <div>
                            <h3>Academic Information</h3>
                            <p>Your current academic details</p>
                        </div>

                    </div>


                    <div class="student-profile-grid">

                        <!-- STUDENT ID -->

                        <div class="student-profile-field">

                            <label>Student ID</label>

                            <div class="student-profile-value">

                                <i class="bi bi-hash"></i>

                                <span>
                                    ${student.studentId}
                                </span>

                            </div>

                        </div>


                        <!-- ROLL NUMBER -->

                        <div class="student-profile-field">

                            <label>Roll Number</label>

                            <div class="student-profile-value">

                                <i class="bi bi-card-text"></i>

                                <span>
                                    ${student.rollNo}
                                </span>

                            </div>

                        </div>


                        <!-- DEPARTMENT -->

                        <div class="student-profile-field">

                            <label>Department</label>

                            <div class="student-profile-value">

                                <i class="bi bi-building"></i>

                                <span>
                                    <c:choose>

                                        <c:when test="${not empty student.departmentCode}">
                                            ${student.departmentCode} -
                                            ${student.departmentName}
                                        </c:when>

                                        <c:otherwise>
                                            ${student.departmentName}
                                        </c:otherwise>

                                    </c:choose>
                                </span>

                            </div>

                        </div>


                        <!-- SEMESTER -->

                        <div class="student-profile-field">

                            <label>Current Semester</label>

                            <div class="student-profile-value">

                                <i class="bi bi-calendar-week"></i>

                                <span>
                                    Semester ${student.semester}
                                </span>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- ================================================= -->
                <!-- ACCOUNT INFORMATION -->
                <!-- ================================================= -->

                <div class="student-profile-section">

                    <div class="student-profile-section-title">

                        <div class="student-section-icon">
                            <i class="bi bi-shield-lock"></i>
                        </div>

                        <div>
                            <h3>Account Information</h3>
                            <p>Your EduManage account details</p>
                        </div>

                    </div>


                    <div class="student-account-info">

                        <div class="student-account-item">

                            <div class="student-account-icon">
                                <i class="bi bi-person-badge"></i>
                            </div>

                            <div>

                                <span class="student-account-label">
                                    Account Type
                                </span>

                                <strong>
                                    Student
                                </strong>

                            </div>

                        </div>


                        <div class="student-account-item">

                            <div class="student-account-icon">
                                <i class="bi bi-envelope"></i>
                            </div>

                            <div>

                                <span class="student-account-label">
                                    Login Email
                                </span>

                                <strong>
                                    ${student.email}
                                </strong>

                            </div>

                        </div>


                        <div class="student-account-item">

                            <div class="student-account-icon">
                                <i class="bi bi-shield-check"></i>
                            </div>

                            <div>

                                <span class="student-account-label">
                                    Account Status
                                </span>

                                <strong>
                                    ${student.status}
                                </strong>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </main>

    </div>

</div>


<!-- ========================================================= -->
<!-- PROFILE PAGE JAVASCRIPT -->
<!-- ========================================================= -->

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