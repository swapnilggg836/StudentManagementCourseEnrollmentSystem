<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../common/header.jsp" />

<div class="admin-app">

    <jsp:include page="../common/sidebar.jsp" />

    <div class="admin-main">

        <jsp:include page="../common/navbar.jsp" />

        <main class="admin-content">

            <!-- PAGE HEADER -->

            <div class="page-header">

                <div class="page-header-left">

                    <div class="breadcrumb-area">

                        <span>EduManage</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>Faculty</span>

                    </div>

                    <h1 class="page-title">
                        Faculty Management
                    </h1>

                    <p class="page-subtitle">
                        Manage faculty members, departments and teaching assignments.
                    </p>

                </div>


                <div class="page-header-actions">

                    <a href="${pageContext.request.contextPath}/admin/faculty/add"
                       class="btn btn-primary">

                        <i class="bi bi-person-plus me-2"></i>

                        Add Faculty

                    </a>

                </div>

            </div>


            <!-- SUCCESS -->

            <c:if test="${not empty param.success}">

                <div class="alert alert-success alert-dismissible fade show">

                    <i class="bi bi-check-circle me-2"></i>

                    ${param.success}

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

            </c:if>


            <!-- ERROR -->

            <c:if test="${not empty param.error}">

                <div class="alert alert-danger alert-dismissible fade show">

                    <i class="bi bi-exclamation-circle me-2"></i>

                    ${param.error}

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

            </c:if>


            <!-- STATISTICS -->

            <div class="row g-4 mb-4">


                <!-- TOTAL FACULTY -->

                <div class="col-xl-3 col-md-6">

                    <div class="content-card h-100">

                        <div class="content-card-body">

                            <p class="text-muted mb-1">
                                Total Faculty
                            </p>

                            <h2 class="mb-1">
                                ${totalFaculty}
                            </h2>

                            <small class="text-muted">
                                Teaching staff
                            </small>

                        </div>

                    </div>

                </div>


                <!-- ACTIVE FACULTY -->

                <div class="col-xl-3 col-md-6">

                    <div class="content-card h-100">

                        <div class="content-card-body">

                            <p class="text-muted mb-1">
                                Active Faculty
                            </p>

                            <h2 class="mb-1">
                                ${activeFaculty}
                            </h2>

                            <small class="text-success">
                                Currently active
                            </small>

                        </div>

                    </div>

                </div>


                <!-- DEPARTMENTS -->

                <div class="col-xl-3 col-md-6">

                    <div class="content-card h-100">

                        <div class="content-card-body">

                            <p class="text-muted mb-1">
                                Departments
                            </p>

                            <h2 class="mb-1">
                                ${departmentCount}
                            </h2>

                            <small class="text-muted">
                                Faculty departments
                            </small>

                        </div>

                    </div>

                </div>


                <!-- ASSIGNED COURSES -->

                <div class="col-xl-3 col-md-6">

                    <div class="content-card h-100">

                        <div class="content-card-body">

                            <p class="text-muted mb-1">
                                Assigned Courses
                            </p>

                            <h2 class="mb-1">
                                ${totalAssignedCourses}
                            </h2>

                            <small class="text-muted">
                                Teaching assignments
                            </small>

                        </div>

                    </div>

                </div>

            </div>


            <!-- FACULTY TABLE -->

            <div class="content-card">


                <div class="content-card-header">

                    <div>

                        <h3 class="content-card-title">
                            Faculty Directory
                        </h3>

                        <p class="content-card-subtitle">
                            View and manage all faculty members
                        </p>

                    </div>


                    <!-- SEARCH -->

                    <form method="get"
                          action="${pageContext.request.contextPath}/admin/faculty"
                          class="d-flex gap-2">

                        <div class="input-group">

                            <span class="input-group-text">

                                <i class="bi bi-search"></i>

                            </span>

                            <input type="text"
                                   name="keyword"
                                   value="${keyword}"
                                   class="form-control"
                                   placeholder="Search faculty...">

                        </div>


                        <button type="submit"
                                class="btn btn-outline-primary">

                            Search

                        </button>


                        <c:if test="${not empty keyword}">

                            <a href="${pageContext.request.contextPath}/admin/faculty"
                               class="btn btn-outline-secondary">

                                <i class="bi bi-x-lg"></i>

                            </a>

                        </c:if>

                    </form>

                </div>


                <div class="content-card-body p-0">

                    <div class="table-responsive">

                        <table class="table table-hover align-middle mb-0">

                            <thead>

                                <tr>

                                    <th>Faculty</th>

                                    <th>Email</th>

                                    <th>Department</th>

                                    <th>Designation</th>

                                    <th>Courses</th>

                                    <th>Status</th>

                                    <th class="text-end">
                                        Actions
                                    </th>

                                </tr>

                            </thead>


                            <tbody>


                                <c:forEach var="f"
                                           items="${faculty}">


                                    <tr>


                                        <!-- FACULTY -->

                                        <td>

                                            <div class="d-flex align-items-center gap-3">

                                                <div class="rounded-circle
                                                            bg-primary
                                                            text-white
                                                            d-flex
                                                            align-items-center
                                                            justify-content-center"
                                                     style="width:42px;height:42px;">

                                                    <i class="bi bi-person"></i>

                                                </div>


                                                <div>

                                                    <strong>
                                                        ${f.fullName}
                                                    </strong>

                                                    <div class="text-muted small">
                                                        ${f.employeeCode}
                                                    </div>

                                                </div>

                                            </div>

                                        </td>


                                        <!-- EMAIL -->

                                        <td>
                                            ${f.email}
                                        </td>


                                        <!-- DEPARTMENT -->

                                        <td>

                                            <strong>
                                                ${f.departmentCode}
                                            </strong>

                                            <div class="text-muted small">
                                                ${f.departmentName}
                                            </div>

                                        </td>


                                        <!-- DESIGNATION -->

                                        <td>

                                            <c:choose>

                                                <c:when test="${not empty f.designation}">

                                                    ${f.designation}

                                                </c:when>

                                                <c:otherwise>

                                                    <span class="text-muted">
                                                        Not Specified
                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>


                                        <!-- COURSES -->

                                        <td>

                                            <span class="badge bg-light text-dark">

                                                ${f.assignedCourses}

                                            </span>

                                        </td>


                                        <!-- STATUS -->

                                        <td>

                                            <c:choose>

                                                <c:when test="${f.status == 'ACTIVE'}">

                                                    <span class="badge bg-success">
                                                        Active
                                                    </span>

                                                </c:when>

                                                <c:when test="${f.status == 'SUSPENDED'}">

                                                    <span class="badge bg-danger">
                                                        Suspended
                                                    </span>

                                                </c:when>

                                                <c:otherwise>

                                                    <span class="badge bg-secondary">
                                                        Inactive
                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>


                                        <!-- ACTIONS -->

                                        <td class="text-end">

                                            <div class="btn-group">


                                                <a href="${pageContext.request.contextPath}/admin/faculty/view?id=${f.facultyId}"
                                                   class="btn btn-sm btn-outline-primary"
                                                   title="View">

                                                    <i class="bi bi-eye"></i>

                                                </a>


                                                <a href="${pageContext.request.contextPath}/admin/faculty/edit?id=${f.facultyId}"
                                                   class="btn btn-sm btn-outline-secondary"
                                                   title="Edit">

                                                    <i class="bi bi-pencil"></i>

                                                </a>


                                                <form method="post"
                                                      action="${pageContext.request.contextPath}/admin/faculty/delete"
                                                      style="display:inline;"
                                                      onsubmit="return confirm('Are you sure you want to delete this faculty member?');">

                                                    <input type="hidden"
                                                           name="id"
                                                           value="${f.facultyId}">

                                                    <button type="submit"
                                                            class="btn btn-sm btn-outline-danger"
                                                            title="Delete">

                                                        <i class="bi bi-trash"></i>

                                                    </button>

                                                </form>


                                            </div>

                                        </td>


                                    </tr>


                                </c:forEach>


                                <!-- NO DATA -->

                                <c:if test="${empty faculty}">

                                    <tr>

                                        <td colspan="7"
                                            class="text-center py-5">

                                            <i class="bi bi-people display-5 text-muted"></i>

                                            <h5 class="mt-3">
                                                No Faculty Found
                                            </h5>

                                            <p class="text-muted">
                                                No faculty records are available.
                                            </p>

                                            <a href="${pageContext.request.contextPath}/admin/faculty/add"
                                               class="btn btn-primary">

                                                <i class="bi bi-person-plus me-2"></i>

                                                Add Faculty

                                            </a>

                                        </td>

                                    </tr>

                                </c:if>


                            </tbody>

                        </table>

                    </div>

                </div>


                <div class="content-card-footer">

                    <span class="text-muted">

                        Total Faculty:
                        <strong>${faculty.size()}</strong>

                    </span>

                </div>


            </div>

        </main>

    </div>

</div>


<jsp:include page="../common/footer.jsp" />