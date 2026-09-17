<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../common/header.jsp" />

<div class="admin-app">

    <jsp:include page="../common/sidebar.jsp" />

    <div class="admin-main">

        <jsp:include page="../common/navbar.jsp" />

        <main class="admin-content">

            <!-- ================================================= -->
            <!-- PAGE HEADER -->
            <!-- ================================================= -->

            <div class="page-header">

                <div class="page-header-left">

                    <div class="breadcrumb-area">

                        <span>EduManage</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>Admin</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>Students</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>View Student</span>

                    </div>

                    <h1 class="page-title">
                        Student Details
                    </h1>

                </div>


                <div class="page-header-actions">

                    <a href="${pageContext.request.contextPath}/admin/students/edit?id=${student.studentId}"
                       class="btn btn-primary">

                        <i class="bi bi-pencil-square me-2"></i>
                        Edit Student

                    </a>

                    <a href="${pageContext.request.contextPath}/admin/students"
                       class="btn btn-outline-secondary">

                        <i class="bi bi-arrow-left me-2"></i>
                        Back

                    </a>

                </div>

            </div>


            <!-- ================================================= -->
            <!-- STUDENT PROFILE -->
            <!-- ================================================= -->

            <div class="content-card">

                <div class="d-flex align-items-center mb-4">

                    <div class="student-avatar me-3">

                        <i class="bi bi-person-fill"></i>

                    </div>

                    <div>

                        <h3 class="mb-1">

                            ${student.firstName}
                            ${student.lastName}

                        </h3>

                        <p class="text-muted mb-0">

                            Roll No:
                            <strong>${student.rollNo}</strong>

                        </p>

                    </div>

                </div>


                <hr>


                <!-- ================================================= -->
                <!-- BASIC INFORMATION -->
                <!-- ================================================= -->

                <h5 class="mb-3 mt-4">
                    Basic Information
                </h5>

                <div class="row g-4">


                    <!-- STUDENT ID -->

                    <div class="col-md-4">

                        <div class="detail-item">

                            <span class="detail-label">
                                Student ID
                            </span>

                            <span class="detail-value">
                                ${student.studentId}
                            </span>

                        </div>

                    </div>


                    <!-- ROLL NUMBER -->

                    <div class="col-md-4">

                        <div class="detail-item">

                            <span class="detail-label">
                                Roll Number
                            </span>

                            <span class="detail-value">
                                ${student.rollNo}
                            </span>

                        </div>

                    </div>


                    <!-- USER ID -->

                    <div class="col-md-4">

                        <div class="detail-item">

                            <span class="detail-label">
                                User ID
                            </span>

                            <span class="detail-value">
                                ${student.userId}
                            </span>

                        </div>

                    </div>


                    <!-- FIRST NAME -->

                    <div class="col-md-4">

                        <div class="detail-item">

                            <span class="detail-label">
                                First Name
                            </span>

                            <span class="detail-value">
                                ${student.firstName}
                            </span>

                        </div>

                    </div>


                    <!-- LAST NAME -->

                    <div class="col-md-4">

                        <div class="detail-item">

                            <span class="detail-label">
                                Last Name
                            </span>

                            <span class="detail-value">
                                ${student.lastName}
                            </span>

                        </div>

                    </div>


                    <!-- GENDER -->

                    <div class="col-md-4">

                        <div class="detail-item">

                            <span class="detail-label">
                                Gender
                            </span>

                            <span class="detail-value">

                                ${student.gender != null &&
                                  student.gender != ''
                                  ? student.gender
                                  : 'Not Provided'}

                            </span>

                        </div>

                    </div>


                    <!-- ================================================= -->
                    <!-- ACADEMIC INFORMATION -->
                    <!-- ================================================= -->

                    <div class="col-12">

                        <hr>

                        <h5 class="mb-3 mt-2">
                            Academic Information
                        </h5>

                    </div>


                    <!-- DEPARTMENT -->

                    <div class="col-md-4">

                        <div class="detail-item">

                            <span class="detail-label">
                                Department
                            </span>

                            <span class="detail-value">

                                ${student.departmentName}

                            </span>

                        </div>

                    </div>


                    <!-- DEPARTMENT ID -->

                    <div class="col-md-4">

                        <div class="detail-item">

                            <span class="detail-label">
                                Department ID
                            </span>

                            <span class="detail-value">

                                ${student.deptId}

                            </span>

                        </div>

                    </div>


                    <!-- SEMESTER -->

                    <div class="col-md-4">

                        <div class="detail-item">

                            <span class="detail-label">
                                Semester
                            </span>

                            <span class="detail-value">

                                ${student.semester}

                            </span>

                        </div>

                    </div>


                    <!-- ================================================= -->
                    <!-- PERSONAL INFORMATION -->
                    <!-- ================================================= -->

                    <div class="col-12">

                        <hr>

                        <h5 class="mb-3 mt-2">
                            Personal Information
                        </h5>

                    </div>


                    <!-- DATE OF BIRTH -->

                    <div class="col-md-4">

                        <div class="detail-item">

                            <span class="detail-label">
                                Date of Birth
                            </span>

                            <span class="detail-value">

                                ${student.dob != null &&
                                  student.dob != ''
                                  ? student.dob
                                  : 'Not Provided'}

                            </span>

                        </div>

                    </div>


                    <!-- PHONE -->

                    <div class="col-md-4">

                        <div class="detail-item">

                            <span class="detail-label">
                                Phone
                            </span>

                            <span class="detail-value">

                                ${student.phone != null &&
                                  student.phone != ''
                                  ? student.phone
                                  : 'Not Provided'}

                            </span>

                        </div>

                    </div>


                    <!-- ADDRESS -->

                    <div class="col-md-12">

                        <div class="detail-item">

                            <span class="detail-label">
                                Address
                            </span>

                            <span class="detail-value">

                                ${student.address != null &&
                                  student.address != ''
                                  ? student.address
                                  : 'Not Provided'}

                            </span>

                        </div>

                    </div>

                </div>


                <!-- ================================================= -->
                <!-- ACTIONS -->
                <!-- ================================================= -->

                <hr class="mt-4">

                <div class="d-flex gap-2">

                    <a href="${pageContext.request.contextPath}/admin/students/edit?id=${student.studentId}"
                       class="btn btn-primary">

                        <i class="bi bi-pencil-square me-2"></i>
                        Edit Student

                    </a>


                    <form method="post"
                          action="${pageContext.request.contextPath}/admin/students/delete"
                          onsubmit="return confirm('Are you sure you want to delete this student?');">

                        <input type="hidden"
                               name="id"
                               value="${student.studentId}">

                        <button type="submit"
                                class="btn btn-outline-danger">

                            <i class="bi bi-trash me-2"></i>
                            Delete Student

                        </button>

                    </form>

                </div>

            </div>

        </main>

    </div>

</div>

<jsp:include page="../common/footer.jsp" />