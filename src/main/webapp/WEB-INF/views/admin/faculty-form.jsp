<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../common/header.jsp" />

<div class="admin-app">

    <jsp:include page="../common/sidebar.jsp" />

    <div class="admin-main">

        <jsp:include page="../common/navbar.jsp" />

        <main class="admin-content">

            <div class="page-header">

                <div class="page-header-left">

                    <div class="breadcrumb-area">

                        <span>EduManage</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>Faculty</span>

                        <i class="bi bi-chevron-right"></i>

                        <c:choose>

                            <c:when test="${faculty.facultyId > 0}">
                                <span>Edit Faculty</span>
                            </c:when>

                            <c:otherwise>
                                <span>Add Faculty</span>
                            </c:otherwise>

                        </c:choose>

                    </div>


                    <h1 class="page-title">

                        <c:choose>

                            <c:when test="${faculty.facultyId > 0}">
                                Edit Faculty
                            </c:when>

                            <c:otherwise>
                                Add Faculty
                            </c:otherwise>

                        </c:choose>

                    </h1>


                    <p class="page-subtitle">
                        Manage faculty information
                    </p>

                </div>


                <div class="page-header-actions">

                    <a href="${pageContext.request.contextPath}/admin/faculty"
                       class="btn btn-outline-secondary">

                        <i class="bi bi-arrow-left me-2"></i>

                        Back to Faculty

                    </a>

                </div>

            </div>


            <c:if test="${not empty error}">

                <div class="alert alert-danger alert-dismissible fade show"
                     role="alert">

                    <i class="bi bi-exclamation-circle me-2"></i>

                    ${error}

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

            </c:if>


            <div class="content-card">

                <div class="content-card-header">

                    <div>

                        <h3 class="content-card-title">

                            <c:choose>

                                <c:when test="${faculty.facultyId > 0}">
                                    Faculty Details
                                </c:when>

                                <c:otherwise>
                                    New Faculty
                                </c:otherwise>

                            </c:choose>

                        </h3>

                        <p class="content-card-subtitle">
                            Enter faculty information below
                        </p>

                    </div>

                </div>


                <div class="content-card-body">

                    <c:choose>

                        <c:when test="${faculty.facultyId > 0}">

                            <form method="post"
                                  action="${pageContext.request.contextPath}/admin/faculty/update">

                                <input type="hidden"
                                       name="facultyId"
                                       value="${faculty.facultyId}">

                                <div class="row g-4">

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Employee Code
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="employeeCode"
                                               class="form-control"
                                               value="${faculty.employeeCode}"
                                               maxlength="30"
                                               required>

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Email
                                        </label>

                                        <input type="email"
                                               class="form-control"
                                               value="${faculty.email}"
                                               readonly>

                                        <div class="form-text">
                                            Email cannot be changed here.
                                        </div>

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            First Name
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="firstName"
                                               class="form-control"
                                               value="${faculty.firstName}"
                                               maxlength="100"
                                               required>

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Last Name
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="lastName"
                                               class="form-control"
                                               value="${faculty.lastName}"
                                               maxlength="100"
                                               required>

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Department
                                            <span class="text-danger">*</span>
                                        </label>

                                        <select name="deptId"
                                                class="form-select"
                                                required>

                                            <option value="">
                                                Select Department
                                            </option>

                                            <c:forEach var="department"
                                                       items="${departments}">

                                                <option value="${department.deptId}"
                                                        <c:if test="${department.deptId == faculty.deptId}">
                                                            selected
                                                        </c:if>>

                                                    ${department.deptCode}
                                                    -
                                                    ${department.deptName}

                                                </option>

                                            </c:forEach>

                                        </select>

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Designation
                                        </label>

                                        <input type="text"
                                               name="designation"
                                               class="form-control"
                                               value="${faculty.designation}"
                                               placeholder="Example: Assistant Professor"
                                               maxlength="100">

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Phone
                                        </label>

                                        <input type="text"
                                               name="phone"
                                               class="form-control"
                                               value="${faculty.phone}"
                                               maxlength="15">

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Qualification
                                        </label>

                                        <input type="text"
                                               name="qualification"
                                               class="form-control"
                                               value="${faculty.qualification}"
                                               placeholder="Example: M.Tech, Ph.D."
                                               maxlength="150">

                                    </div>

                                </div>


                                <div class="d-flex justify-content-end gap-2 mt-4 pt-4 border-top">

                                    <a href="${pageContext.request.contextPath}/admin/faculty"
                                       class="btn btn-outline-secondary">

                                        Cancel

                                    </a>


                                    <button type="submit"
                                            class="btn btn-primary">

                                        <i class="bi bi-check-circle me-2"></i>

                                        Update Faculty

                                    </button>

                                </div>

                            </form>

                        </c:when>


                        <c:otherwise>

                            <form method="post"
                                  action="${pageContext.request.contextPath}/admin/faculty/save">

                                <div class="row g-4">

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Employee Code
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="employeeCode"
                                               class="form-control"
                                               value="${faculty.employeeCode}"
                                               placeholder="Example: FAC001"
                                               maxlength="30"
                                               required>

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Email
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="email"
                                               name="email"
                                               class="form-control"
                                               value="${email}"
                                               placeholder="faculty@gmail.com"
                                               required>

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            First Name
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="firstName"
                                               class="form-control"
                                               value="${faculty.firstName}"
                                               maxlength="100"
                                               required>

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Last Name
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="text"
                                               name="lastName"
                                               class="form-control"
                                               value="${faculty.lastName}"
                                               maxlength="100"
                                               required>

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Department
                                            <span class="text-danger">*</span>
                                        </label>

                                        <select name="deptId"
                                                class="form-select"
                                                required>

                                            <option value="">
                                                Select Department
                                            </option>

                                            <c:forEach var="department"
                                                       items="${departments}">

                                                <option value="${department.deptId}">

                                                    ${department.deptCode}
                                                    -
                                                    ${department.deptName}

                                                </option>

                                            </c:forEach>

                                        </select>

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Designation
                                        </label>

                                        <input type="text"
                                               name="designation"
                                               class="form-control"
                                               placeholder="Example: Assistant Professor"
                                               maxlength="100">

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Phone
                                        </label>

                                        <input type="text"
                                               name="phone"
                                               class="form-control"
                                               maxlength="15">

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Qualification
                                        </label>

                                        <input type="text"
                                               name="qualification"
                                               class="form-control"
                                               placeholder="Example: M.Tech, Ph.D."
                                               maxlength="150">

                                    </div>


                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Login Password
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input type="password"
                                               name="password"
                                               class="form-control"
                                               minlength="6"
                                               required>

                                        <div class="form-text">
                                            This password will be used for faculty login.
                                        </div>

                                    </div>

                                </div>


                                <div class="d-flex justify-content-end gap-2 mt-4 pt-4 border-top">

                                    <a href="${pageContext.request.contextPath}/admin/faculty"
                                       class="btn btn-outline-secondary">

                                        Cancel

                                    </a>


                                    <button type="submit"
                                            class="btn btn-primary">

                                        <i class="bi bi-person-plus me-2"></i>

                                        Add Faculty

                                    </button>

                                </div>

                            </form>

                        </c:otherwise>

                    </c:choose>

                </div>

            </div>

        </main>

    </div>

</div>

<jsp:include page="../common/footer.jsp" />