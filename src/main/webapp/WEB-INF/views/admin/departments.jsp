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

                        <span>Departments</span>

                    </div>

                    <h1 class="page-title">
                        Department Management
                    </h1>

                    <p class="text-muted mb-0">
                        Manage academic departments and HOD information.
                    </p>

                </div>


                <div class="page-header-actions">

                    <a href="${pageContext.request.contextPath}/admin/departments/add"
                       class="btn btn-primary">

                        <i class="bi bi-plus-circle me-2"></i>

                        Add Department

                    </a>

                </div>

            </div>


            <!-- ================================================= -->
            <!-- SEARCH + SUMMARY -->
            <!-- ================================================= -->

            <div class="content-card mb-4">

                <div class="row align-items-center g-3">

                    <div class="col-md-8">

                        <form method="get"
                              action="${pageContext.request.contextPath}/admin/departments">

                            <div class="input-group">

                                <span class="input-group-text">

                                    <i class="bi bi-search"></i>

                                </span>

                                <input type="text"
                                       name="keyword"
                                       class="form-control"
                                       value="${keyword}"
                                       placeholder="Search by department code, name or HOD">

                                <button type="submit"
                                        class="btn btn-primary">

                                    Search

                                </button>

                                <c:if test="${not empty keyword}">

                                    <a href="${pageContext.request.contextPath}/admin/departments"
                                       class="btn btn-outline-secondary">

                                        Clear

                                    </a>

                                </c:if>

                            </div>

                        </form>

                    </div>


                    <div class="col-md-4 text-md-end">

                        <span class="text-muted">
                            Total Departments:
                        </span>

                        <strong>
                            ${departments.size()}
                        </strong>

                    </div>

                </div>

            </div>


            <!-- ================================================= -->
            <!-- DEPARTMENT TABLE -->
            <!-- ================================================= -->

            <div class="content-card">

                <div class="table-responsive">

                    <table class="table align-middle mb-0">

                        <thead>

                            <tr>

                                <th>
                                    ID
                                </th>

                                <th>
                                    Code
                                </th>

                                <th>
                                    Department Name
                                </th>

                                <th>
                                    HOD
                                </th>

                                <th class="text-end">
                                    Actions
                                </th>

                            </tr>

                        </thead>


                        <tbody>

                            <c:choose>

                                <c:when test="${not empty departments}">

                                    <c:forEach
                                            var="department"
                                            items="${departments}">

                                        <tr>

                                            <!-- ID -->

                                            <td>

                                                ${department.deptId}

                                            </td>


                                            <!-- CODE -->

                                            <td>

                                                <span class="badge bg-light text-dark">

                                                    ${department.deptCode}

                                                </span>

                                            </td>


                                            <!-- NAME -->

                                            <td>

                                                <strong>

                                                    ${department.deptName}

                                                </strong>

                                            </td>


                                            <!-- HOD -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${not empty department.hodName}">

                                                        ${department.hodName}

                                                    </c:when>

                                                    <c:otherwise>

                                                        <span class="text-muted">
                                                            Not Assigned
                                                        </span>

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- ACTIONS -->

                                            <td class="text-end">

                                                <div class="d-inline-flex gap-2">


                                                    <!-- EDIT -->

                                                    <a href="${pageContext.request.contextPath}/admin/departments/edit?id=${department.deptId}"
                                                       class="btn btn-sm btn-outline-primary"
                                                       title="Edit Department">

                                                        <i class="bi bi-pencil-square"></i>

                                                    </a>


                                                    <!-- DELETE -->

                                                    <form method="post"
                                                          action="${pageContext.request.contextPath}/admin/departments/delete"
                                                          onsubmit="return confirm('Are you sure you want to delete this department?');">

                                                        <input type="hidden"
                                                               name="id"
                                                               value="${department.deptId}">

                                                        <button type="submit"
                                                                class="btn btn-sm btn-outline-danger"
                                                                title="Delete Department">

                                                            <i class="bi bi-trash"></i>

                                                        </button>

                                                    </form>

                                                </div>

                                            </td>

                                        </tr>

                                    </c:forEach>

                                </c:when>


                                <c:otherwise>

                                    <tr>

                                        <td colspan="5"
                                            class="text-center py-5">

                                            <div class="mb-3">

                                                <i class="bi bi-building fs-1 text-muted"></i>

                                            </div>

                                            <h5>
                                                No Departments Found
                                            </h5>

                                            <p class="text-muted mb-3">

                                                <c:choose>

                                                    <c:when test="${not empty keyword}">

                                                        No department matches
                                                        "<strong>${keyword}</strong>".

                                                    </c:when>

                                                    <c:otherwise>

                                                        No departments have been added yet.

                                                    </c:otherwise>

                                                </c:choose>

                                            </p>


                                            <a href="${pageContext.request.contextPath}/admin/departments/add"
                                               class="btn btn-primary">

                                                <i class="bi bi-plus-circle me-2"></i>

                                                Add Department

                                            </a>

                                        </td>

                                    </tr>

                                </c:otherwise>

                            </c:choose>

                        </tbody>

                    </table>

                </div>

            </div>

        </main>

    </div>

</div>

<jsp:include page="../common/footer.jsp" />