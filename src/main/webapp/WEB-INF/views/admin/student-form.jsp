<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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

                        <span>
                            ${student.studentId > 0 ? 'Edit Student' : 'Add Student'}
                        </span>

                    </div>

                    <h1 class="page-title">

                        ${student.studentId > 0
                            ? 'Edit Student'
                            : 'Add Student'}

                    </h1>

                </div>

            </div>


            <!-- ================================================= -->
            <!-- STUDENT FORM -->
            <!-- ================================================= -->

            <div class="content-card">

                <div class="mb-4">

                    <h3 class="mb-1">

                        ${student.studentId > 0
                            ? 'Edit Student Information'
                            : 'Student Information'}

                    </h3>

                    <p class="text-muted mb-0">

                        ${student.studentId > 0
                            ? 'Update the student information below.'
                            : 'Enter student details and create the student account.'}

                    </p>

                </div>


                <!-- ================================================= -->
                <!-- ADD / UPDATE FORM -->
                <!-- ================================================= -->

                <form method="post"

                      action="${pageContext.request.contextPath}${student.studentId > 0 ? '/admin/students/update' : '/admin/students/save'}">


                    <!-- ================================================= -->
                    <!-- STUDENT ID - ONLY FOR EDIT -->
                    <!-- ================================================= -->

                    <c:if test="${student.studentId > 0}">

                        <input type="hidden"
                               name="studentId"
                               value="${student.studentId}">

                    </c:if>


                    <div class="row g-4">


                        <!-- ================================================= -->
                        <!-- FIRST NAME -->
                        <!-- ================================================= -->

                        <div class="col-md-6">

                            <label for="firstName"
                                   class="form-label">

                                First Name
                                <span class="text-danger">*</span>

                            </label>

                            <input type="text"
                                   id="firstName"
                                   name="firstName"
                                   class="form-control"
                                   value="${student.firstName}"
                                   placeholder="Enter first name"
                                   required>

                        </div>


                        <!-- ================================================= -->
                        <!-- LAST NAME -->
                        <!-- ================================================= -->

                        <div class="col-md-6">

                            <label for="lastName"
                                   class="form-label">

                                Last Name
                                <span class="text-danger">*</span>

                            </label>

                            <input type="text"
                                   id="lastName"
                                   name="lastName"
                                   class="form-control"
                                   value="${student.lastName}"
                                   placeholder="Enter last name"
                                   required>

                        </div>


                        <!-- ================================================= -->
                        <!-- ROLL NUMBER -->
                        <!-- ================================================= -->

                        <div class="col-md-6">

                            <label for="rollNo"
                                   class="form-label">

                                Roll Number
                                <span class="text-danger">*</span>

                            </label>

                            <input type="text"
                                   id="rollNo"
                                   name="rollNo"
                                   class="form-control"
                                   value="${student.rollNo}"
                                   placeholder="Enter roll number"
                                   required>

                        </div>


                        <!-- ================================================= -->
                        <!-- DEPARTMENT -->
                        <!-- ================================================= -->

                        <div class="col-md-6">

                            <label for="deptId"
                                   class="form-label">

                                Department
                                <span class="text-danger">*</span>

                            </label>

                            <select id="deptId"
                                    name="deptId"
                                    class="form-select"
                                    required>

                                <option value="">
                                    Select Department
                                </option>

                                <c:forEach
                                        var="department"
                                        items="${departments}">

                                    <option
                                        value="${department.deptId}"
                                        ${student.deptId == department.deptId ? 'selected' : ''}>

                                        ${department.deptCode}
                                        -
                                        ${department.deptName}

                                    </option>

                                </c:forEach>

                            </select>

                        </div>


                        <!-- ================================================= -->
                        <!-- SEMESTER -->
                        <!-- ================================================= -->

                        <div class="col-md-6">

                            <label for="semester"
                                   class="form-label">

                                Semester
                                <span class="text-danger">*</span>

                            </label>

                            <select id="semester"
                                    name="semester"
                                    class="form-select"
                                    required>

                                <option value="">
                                    Select Semester
                                </option>

                                <c:forEach
                                        var="sem"
                                        begin="1"
                                        end="8">

                                    <option
                                        value="${sem}"
                                        ${student.semester == sem ? 'selected' : ''}>

                                        Semester ${sem}

                                    </option>

                                </c:forEach>

                            </select>

                        </div>


                        <!-- ================================================= -->
                        <!-- GENDER -->
                        <!-- ================================================= -->

                        <div class="col-md-6">

                            <label for="gender"
                                   class="form-label">

                                Gender

                            </label>

                            <select id="gender"
                                    name="gender"
                                    class="form-select">

                                <option value="">
                                    Select Gender
                                </option>

                                <option value="MALE"
                                    ${student.gender == 'MALE'
                                        ? 'selected'
                                        : ''}>

                                    Male

                                </option>

                                <option value="FEMALE"
                                    ${student.gender == 'FEMALE'
                                        ? 'selected'
                                        : ''}>

                                    Female

                                </option>

                                <option value="OTHER"
                                    ${student.gender == 'OTHER'
                                        ? 'selected'
                                        : ''}>

                                    Other

                                </option>

                            </select>

                        </div>


                        <!-- ================================================= -->
                        <!-- DATE OF BIRTH -->
                        <!-- ================================================= -->

                        <div class="col-md-6">

                            <label for="dob"
                                   class="form-label">

                                Date of Birth

                            </label>

                            <input type="date"
                                   id="dob"
                                   name="dob"
                                   class="form-control"
                                   value="${student.dob}">

                        </div>


                        <!-- ================================================= -->
                        <!-- PHONE -->
                        <!-- ================================================= -->

                        <div class="col-md-6">

                            <label for="phone"
                                   class="form-label">

                                Phone Number

                            </label>

                            <input type="tel"
                                   id="phone"
                                   name="phone"
                                   class="form-control"
                                   value="${student.phone}"
                                   placeholder="Enter phone number"
                                   maxlength="15">

                        </div>


                        <!-- ================================================= -->
                        <!-- ADDRESS -->
                        <!-- ================================================= -->

                        <div class="col-12">

                            <label for="address"
                                   class="form-label">

                                Address

                            </label>

                            <textarea id="address"
                                      name="address"
                                      class="form-control"
                                      rows="3"
                                      placeholder="Enter address">${student.address}</textarea>

                        </div>


                        <!-- ================================================= -->
                        <!-- LOGIN ACCOUNT -->
                        <!-- ================================================= -->

                        <c:if test="${student.studentId == 0}">

                            <div class="col-12">

                                <hr class="my-2">

                                <h5 class="mb-1">
                                    Student Login Account
                                </h5>

                                <p class="text-muted mb-0">

                                    These credentials will be used by the
                                    student to log in to EduManage.

                                </p>

                            </div>


                            <!-- EMAIL -->

                            <div class="col-md-6">

                                <label for="email"
                                       class="form-label">

                                    Email
                                    <span class="text-danger">*</span>

                                </label>

                                <input type="email"
                                       id="email"
                                       name="email"
                                       class="form-control"
                                       placeholder="student@example.com"
                                       required>

                            </div>


                            <!-- PASSWORD -->

                            <div class="col-md-6">

                                <label for="password"
                                       class="form-label">

                                    Password
                                    <span class="text-danger">*</span>

                                </label>

                                <input type="password"
                                       id="password"
                                       name="password"
                                       class="form-control"
                                       placeholder="Enter password"
                                       minlength="6"
                                       required>

                            </div>

                        </c:if>


                        <!-- ================================================= -->
                        <!-- BUTTONS -->
                        <!-- ================================================= -->

                        <div class="col-12">

                            <div class="d-flex gap-2 pt-2">

                                <button type="submit"
                                        class="btn btn-primary">

                                    <i class="bi bi-person-check-fill me-2"></i>

                                    ${student.studentId > 0
                                        ? 'Update Student'
                                        : 'Save Student'}

                                </button>


                                <a href="${pageContext.request.contextPath}/admin/students"
                                   class="btn btn-outline-secondary">

                                    Cancel

                                </a>

                            </div>

                        </div>

                    </div>

                </form>

            </div>

        </main>

    </div>

</div>

<jsp:include page="../common/footer.jsp" />