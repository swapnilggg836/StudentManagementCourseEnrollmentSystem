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

                        <span>Faculty Details</span>

                    </div>

                    <h1 class="page-title">
                        Faculty Details
                    </h1>

                    <p class="page-subtitle">
                        View complete faculty information
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


            <div class="content-card mb-4">

                <div class="content-card-body">

                    <div class="d-flex justify-content-between
                                align-items-start flex-wrap gap-3">

                        <div class="d-flex align-items-center gap-3">

                            <div class="rounded-circle
                                        bg-primary
                                        text-white
                                        d-flex
                                        align-items-center
                                        justify-content-center"
                                 style="width:64px;
                                        height:64px;">

                                <i class="bi bi-person-fill fs-3"></i>

                            </div>


                            <div>

                                <div class="d-flex align-items-center gap-2">

                                    <h2 class="mb-0">
                                        ${faculty.fullName}
                                    </h2>

                                    <span class="badge bg-light text-dark">
                                        ${faculty.employeeCode}
                                    </span>

                                </div>

                                <p class="text-muted mb-0 mt-1">
                                    ${faculty.designation}
                                </p>

                            </div>

                        </div>


                        <div class="d-flex gap-2">

                            <a href="${pageContext.request.contextPath}/admin/faculty/edit?id=${faculty.facultyId}"
                               class="btn btn-outline-primary">

                                <i class="bi bi-pencil me-2"></i>

                                Edit Faculty

                            </a>


                            <form method="post"
                                  action="${pageContext.request.contextPath}/admin/faculty/delete"
                                  onsubmit="return confirm('Are you sure you want to delete this faculty member?');">

                                <input type="hidden"
                                       name="id"
                                       value="${faculty.facultyId}">

                                <button type="submit"
                                        class="btn btn-outline-danger">

                                    <i class="bi bi-trash me-2"></i>

                                    Delete

                                </button>

                            </form>

                        </div>

                    </div>

                </div>

            </div>


            <div class="row g-4">


                <div class="col-lg-8">

                    <div class="content-card h-100">

                        <div class="content-card-header">

                            <div>

                                <h3 class="content-card-title">
                                    Faculty Information
                                </h3>

                                <p class="content-card-subtitle">
                                    Personal and professional information
                                </p>

                            </div>

                        </div>


                        <div class="content-card-body">

                            <div class="row g-4">

                                <div class="col-md-6">

                                    <small class="text-muted d-block mb-1">
                                        Employee Code
                                    </small>

                                    <strong>
                                        ${faculty.employeeCode}
                                    </strong>

                                </div>


                                <div class="col-md-6">

                                    <small class="text-muted d-block mb-1">
                                        Email
                                    </small>

                                    <strong>
                                        ${faculty.email}
                                    </strong>

                                </div>


                                <div class="col-md-6">

                                    <small class="text-muted d-block mb-1">
                                        Full Name
                                    </small>

                                    <strong>
                                        ${faculty.fullName}
                                    </strong>

                                </div>


                                <div class="col-md-6">

                                    <small class="text-muted d-block mb-1">
                                        Department
                                    </small>

                                    <strong>
                                        ${faculty.departmentName}
                                    </strong>

                                    <div class="text-muted small">
                                        ${faculty.departmentCode}
                                    </div>

                                </div>


                                <div class="col-md-6">

                                    <small class="text-muted d-block mb-1">
                                        Designation
                                    </small>

                                    <c:choose>

                                        <c:when test="${not empty faculty.designation}">
                                            ${faculty.designation}
                                        </c:when>

                                        <c:otherwise>
                                            <span class="text-muted">
                                                Not Specified
                                            </span>
                                        </c:otherwise>

                                    </c:choose>

                                </div>


                                <div class="col-md-6">

                                    <small class="text-muted d-block mb-1">
                                        Qualification
                                    </small>

                                    <c:choose>

                                        <c:when test="${not empty faculty.qualification}">
                                            ${faculty.qualification}
                                        </c:when>

                                        <c:otherwise>
                                            <span class="text-muted">
                                                Not Specified
                                            </span>
                                        </c:otherwise>

                                    </c:choose>

                                </div>


                                <div class="col-md-6">

                                    <small class="text-muted d-block mb-1">
                                        Phone
                                    </small>

                                    <c:choose>

                                        <c:when test="${not empty faculty.phone}">
                                            ${faculty.phone}
                                        </c:when>

                                        <c:otherwise>
                                            <span class="text-muted">
                                                Not Provided
                                            </span>
                                        </c:otherwise>

                                    </c:choose>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>


                <div class="col-lg-4">

                    <div class="content-card mb-4">

                        <div class="content-card-header">

                            <h3 class="content-card-title">
                                Faculty Status
                            </h3>

                        </div>


                        <div class="content-card-body">

                            <c:choose>

                                <c:when test="${faculty.status == 'ACTIVE'}">

                                    <div class="d-flex align-items-center gap-3">

                                        <div class="rounded-circle
                                                    bg-success-subtle
                                                    text-success
                                                    d-flex
                                                    align-items-center
                                                    justify-content-center"
                                             style="width:48px;
                                                    height:48px;">

                                            <i class="bi bi-check-circle-fill"></i>

                                        </div>

                                        <div>

                                            <strong>
                                                Active
                                            </strong>

                                            <div class="text-muted small">
                                                Faculty account is active
                                            </div>

                                        </div>

                                    </div>

                                </c:when>


                                <c:otherwise>

                                    <div class="d-flex align-items-center gap-3">

                                        <div class="rounded-circle
                                                    bg-secondary-subtle
                                                    text-secondary
                                                    d-flex
                                                    align-items-center
                                                    justify-content-center"
                                             style="width:48px;
                                                    height:48px;">

                                            <i class="bi bi-person-x"></i>

                                        </div>

                                        <div>

                                            <strong>
                                                ${faculty.status}
                                            </strong>

                                            <div class="text-muted small">
                                                Faculty account status
                                            </div>

                                        </div>

                                    </div>

                                </c:otherwise>

                            </c:choose>

                        </div>

                    </div>


                    <div class="content-card">

                        <div class="content-card-header">

                            <div>

                                <h3 class="content-card-title">
                                    Course Assignment
                                </h3>

                                <p class="content-card-subtitle">
                                    Courses assigned to this faculty
                                </p>

                            </div>

                        </div>


                        <div class="content-card-body">

                            <div class="text-center py-3">

                                <div class="display-5 fw-bold">

                                    ${faculty.assignedCourses}

                                </div>

                                <div class="text-muted">
                                    Assigned Course(s)
                                </div>

                            </div>


                            <a href="${pageContext.request.contextPath}/admin/courses"
                               class="btn btn-outline-primary w-100">

                                <i class="bi bi-book me-2"></i>

                                View Courses

                            </a>

                        </div>

                    </div>

                </div>

            </div>

        </main>

    </div>

</div>

<jsp:include page="../common/footer.jsp" />