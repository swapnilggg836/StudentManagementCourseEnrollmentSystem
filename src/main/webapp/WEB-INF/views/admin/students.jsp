<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

                        <span>Admin</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>Students</span>

                    </div>

                    <h1 class="page-title">
                        Student Management
                    </h1>

                </div>


                <div class="page-header-actions">

                    <a href="${pageContext.request.contextPath}/admin/students/add"
                       class="btn btn-primary">

                        <i class="bi bi-person-plus-fill me-2"></i>

                        Add Student

                    </a>

                </div>

            </div>


            <!-- SEARCH -->

            <div class="content-card mb-4">

                <form method="get"
                      action="${pageContext.request.contextPath}/admin/students"
                      class="row g-3 align-items-end">

                    <div class="col-md-8">

                        <label class="form-label">
                            Search Students
                        </label>

                        <div class="input-group">

                            <span class="input-group-text">

                                <i class="bi bi-search"></i>

                            </span>

                            <input type="text"
                                   name="keyword"
                                   value="${keyword}"
                                   class="form-control"
                                   placeholder="Search by roll number, name or department">

                        </div>

                    </div>


                    <div class="col-md-4 d-flex gap-2">

                        <button type="submit"
                                class="btn btn-primary">

                            <i class="bi bi-search me-1"></i>

                            Search

                        </button>

                        <a href="${pageContext.request.contextPath}/admin/students"
                           class="btn btn-outline-secondary">

                            Reset

                        </a>

                    </div>

                </form>

            </div>


            <!-- STUDENT TABLE -->

            <div class="content-card">

                <div class="d-flex justify-content-between align-items-center mb-4">

                    <div>

                        <h3 class="mb-1">
                            Students
                        </h3>

                        <p class="text-muted mb-0">
                            Manage registered students
                        </p>

                    </div>

                    <span class="badge bg-light text-dark">

                        Total:

                        <c:out value="${students.size()}" />

                    </span>

                </div>


                <div class="table-responsive">

                    <table class="table align-middle">

                        <thead>

                            <tr>

                                <th>#</th>

                                <th>Roll No</th>

                                <th>Student Name</th>

                                <th>Department</th>

                                <th>Semester</th>

                                <th>Phone</th>

                                <th>Gender</th>

                                <th>Actions</th>

                            </tr>

                        </thead>


                        <tbody>

                            <c:choose>

                                <c:when test="${not empty students}">

                                    <c:forEach
                                            var="student"
                                            items="${students}"
                                            varStatus="status">

                                        <tr>

                                            <!-- NUMBER -->

                                            <td>

                                                ${status.count}

                                            </td>


                                            <!-- ROLL NUMBER -->

                                            <td>

                                                <span class="fw-semibold">

                                                    <c:out
                                                        value="${student.rollNo}" />

                                                </span>

                                            </td>


                                            <!-- STUDENT NAME -->

                                            <td>

                                                <div class="fw-semibold">

                                                    <c:out
                                                        value="${student.firstName}" />

                                                    <c:out
                                                        value="${student.lastName}" />

                                                </div>

                                            </td>


                                            <!-- DEPARTMENT -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${not empty student.departmentName}">

                                                        <c:out
                                                            value="${student.departmentName}" />

                                                    </c:when>

                                                    <c:otherwise>

                                                        <span class="text-muted">
                                                            Not Assigned
                                                        </span>

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- SEMESTER -->

                                            <td>

                                                <span class="badge bg-light text-dark">

                                                    Semester ${student.semester}

                                                </span>

                                            </td>


                                            <!-- PHONE -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${not empty student.phone}">

                                                        <c:out
                                                            value="${student.phone}" />

                                                    </c:when>

                                                    <c:otherwise>

                                                        <span class="text-muted">
                                                            -
                                                        </span>

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- GENDER -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${student.gender == 'MALE'}">

                                                        <span class="badge bg-primary">
                                                            Male
                                                        </span>

                                                    </c:when>


                                                    <c:when test="${student.gender == 'FEMALE'}">

                                                        <span class="badge bg-success">
                                                            Female
                                                        </span>

                                                    </c:when>


                                                    <c:when test="${student.gender == 'OTHER'}">

                                                        <span class="badge bg-secondary">
                                                            Other
                                                        </span>

                                                    </c:when>


                                                    <c:otherwise>

                                                        <span class="text-muted">
                                                            -
                                                        </span>

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- ACTIONS -->

                                            <td>

                                                <div class="d-flex gap-1">

                                                    <!-- VIEW -->

                                                    <a href="${pageContext.request.contextPath}/admin/students/view?id=${student.studentId}"
                                                       class="btn btn-sm btn-outline-primary"
                                                       title="View">

                                                        <i class="bi bi-eye"></i>

                                                    </a>


                                                    <!-- EDIT -->

                                                    <a href="${pageContext.request.contextPath}/admin/students/edit?id=${student.studentId}"
                                                       class="btn btn-sm btn-outline-warning"
                                                       title="Edit">

                                                        <i class="bi bi-pencil"></i>

                                                    </a>


                                                    <!-- DELETE -->

                                                    <form method="post"
                                                          action="${pageContext.request.contextPath}/admin/students/delete"
                                                          style="display:inline;"
                                                          onsubmit="return confirm('Are you sure you want to delete this student?');">

                                                        <input type="hidden"
                                                               name="id"
                                                               value="${student.studentId}">

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

                                </c:when>


                                <c:otherwise>

                                    <tr>

                                        <td colspan="8"
                                            class="text-center py-5">

                                            <div class="text-muted">

                                                <i class="bi bi-people fs-1"></i>

                                                <h5 class="mt-3">
                                                    No Students Found
                                                </h5>

                                                <p>
                                                    There are currently no
                                                    students matching your search.
                                                </p>

                                                <a href="${pageContext.request.contextPath}/admin/students/add"
                                                   class="btn btn-primary">

                                                    <i class="bi bi-person-plus me-1"></i>

                                                    Add Student

                                                </a>

                                            </div>

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