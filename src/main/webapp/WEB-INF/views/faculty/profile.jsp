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
            <h2>
                <i class="bi bi-person-badge-fill"></i>
                My Profile
            </h2>

            <p>
                View your faculty information and academic details.
            </p>
        </div>

    </div>


    <!-- Profile Main Card -->
    <div class="faculty-profile-card">

        <!-- Profile Header -->
        <div class="faculty-profile-header">

            <div class="faculty-profile-avatar">
                <i class="bi bi-person-fill"></i>
            </div>

            <div class="faculty-profile-heading">

                <h3>
                    ${faculty.fullName}
                </h3>

                <p>
                    ${faculty.designation}
                </p>

                <span class="faculty-status-badge">
                    <i class="bi bi-check-circle-fill"></i>
                    ${faculty.status}
                </span>

            </div>

        </div>


        <!-- Profile Information -->
        <div class="faculty-profile-body">

            <div class="faculty-section-title">
                <i class="bi bi-person-vcard-fill"></i>
                Personal Information
            </div>


            <div class="faculty-profile-grid">

                <!-- Employee Code -->
                <div class="faculty-profile-item">

                    <div class="faculty-profile-icon">
                        <i class="bi bi-person-badge"></i>
                    </div>

                    <div>
                        <span>Employee Code</span>
                        <strong>${faculty.employeeCode}</strong>
                    </div>

                </div>


                <!-- First Name -->
                <div class="faculty-profile-item">

                    <div class="faculty-profile-icon">
                        <i class="bi bi-person"></i>
                    </div>

                    <div>
                        <span>First Name</span>
                        <strong>${faculty.firstName}</strong>
                    </div>

                </div>


                <!-- Last Name -->
                <div class="faculty-profile-item">

                    <div class="faculty-profile-icon">
                        <i class="bi bi-person"></i>
                    </div>

                    <div>
                        <span>Last Name</span>
                        <strong>${faculty.lastName}</strong>
                    </div>

                </div>


                <!-- Email -->
                <div class="faculty-profile-item">

                    <div class="faculty-profile-icon">
                        <i class="bi bi-envelope"></i>
                    </div>

                    <div>
                        <span>Email Address</span>
                        <strong>${faculty.email}</strong>
                    </div>

                </div>


                <!-- Phone -->
                <div class="faculty-profile-item">

                    <div class="faculty-profile-icon">
                        <i class="bi bi-telephone"></i>
                    </div>

                    <div>
                        <span>Phone Number</span>
                        <strong>${faculty.phone}</strong>
                    </div>

                </div>


                <!-- Designation -->
                <div class="faculty-profile-item">

                    <div class="faculty-profile-icon">
                        <i class="bi bi-briefcase"></i>
                    </div>

                    <div>
                        <span>Designation</span>
                        <strong>${faculty.designation}</strong>
                    </div>

                </div>

            </div>


            <!-- Academic Information -->

            <div class="faculty-section-title faculty-section-spacing">

                <i class="bi bi-mortarboard-fill"></i>
                Academic Information

            </div>


            <div class="faculty-profile-grid">

                <!-- Department -->
                <div class="faculty-profile-item">

                    <div class="faculty-profile-icon">
                        <i class="bi bi-building"></i>
                    </div>

                    <div>
                        <span>Department</span>
                        <strong>${faculty.departmentName}</strong>
                    </div>

                </div>


                <!-- Department Code -->
                <div class="faculty-profile-item">

                    <div class="faculty-profile-icon">
                        <i class="bi bi-code-square"></i>
                    </div>

                    <div>
                        <span>Department Code</span>
                        <strong>${faculty.departmentCode}</strong>
                    </div>

                </div>


                <!-- Qualification -->
                <div class="faculty-profile-item">

                    <div class="faculty-profile-icon">
                        <i class="bi bi-award"></i>
                    </div>

                    <div>
                        <span>Qualification</span>
                        <strong>${faculty.qualification}</strong>
                    </div>

                </div>


                <!-- Assigned Courses -->
                <div class="faculty-profile-item">

                    <div class="faculty-profile-icon">
                        <i class="bi bi-book"></i>
                    </div>

                    <div>
                        <span>Assigned Courses</span>
                        <strong>${faculty.assignedCourses}</strong>
                    </div>

                </div>

            </div>

        </div>

    </div>

</div>