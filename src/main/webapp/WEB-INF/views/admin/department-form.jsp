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

                        <i class="bi bi-chevron-right"></i>

                        <span>
                            ${department.deptId > 0
                                ? 'Edit Department'
                                : 'Add Department'}
                        </span>

                    </div>

                    <h1 class="page-title">

                        ${department.deptId > 0
                            ? 'Edit Department'
                            : 'Add Department'}

                    </h1>

                </div>

            </div>


            <!-- ================================================= -->
            <!-- DEPARTMENT FORM -->
            <!-- ================================================= -->

            <div class="content-card">

                <div class="mb-4">

                    <h3 class="mb-1">

                        ${department.deptId > 0
                            ? 'Edit Department Information'
                            : 'Department Information'}

                    </h3>

                    <p class="text-muted mb-0">

                        ${department.deptId > 0
                            ? 'Update the department information below.'
                            : 'Enter the details to create a new department.'}

                    </p>

                </div>


                <!-- ================================================= -->
                <!-- FORM -->
                <!-- ================================================= -->

                <form method="post"
                      action="${pageContext.request.contextPath}${department.deptId > 0 ? '/admin/departments/update' : '/admin/departments/save'}">


                    <!-- ================================================= -->
                    <!-- DEPARTMENT ID - EDIT ONLY -->
                    <!-- ================================================= -->

                    <c:if test="${department.deptId > 0}">

                        <input type="hidden"
                               name="deptId"
                               value="${department.deptId}">

                    </c:if>


                    <div class="row g-4">


                        <!-- ================================================= -->
                        <!-- DEPARTMENT CODE -->
                        <!-- ================================================= -->

                        <div class="col-md-6">

                            <label for="deptCode"
                                   class="form-label">

                                Department Code
                                <span class="text-danger">*</span>

                            </label>

                            <input type="text"
                                   id="deptCode"
                                   name="deptCode"
                                   class="form-control"
                                   value="${department.deptCode}"
                                   placeholder="Example: CSE"
                                   maxlength="20"
                                   required>

                            <div class="form-text">
                                Enter a unique department code.
                            </div>

                        </div>


                        <!-- ================================================= -->
                        <!-- DEPARTMENT NAME -->
                        <!-- ================================================= -->

                        <div class="col-md-6">

                            <label for="deptName"
                                   class="form-label">

                                Department Name
                                <span class="text-danger">*</span>

                            </label>

                            <input type="text"
                                   id="deptName"
                                   name="deptName"
                                   class="form-control"
                                   value="${department.deptName}"
                                   placeholder="Example: Computer Science and Engineering"
                                   maxlength="100"
                                   required>

                        </div>


                        <!-- ================================================= -->
                        <!-- HOD NAME -->
                        <!-- ================================================= -->

                        <div class="col-md-6">

                            <label for="hodName"
                                   class="form-label">

                                Head of Department

                            </label>

                            <input type="text"
                                   id="hodName"
                                   name="hodName"
                                   class="form-control"
                                   value="${department.hodName}"
                                   placeholder="Enter HOD name"
                                   maxlength="150">

                        </div>


                        <!-- ================================================= -->
                        <!-- DEPARTMENT ID - INFORMATION -->
                        <!-- ================================================= -->

                        <c:if test="${department.deptId > 0}">

                            <div class="col-md-6">

                                <label class="form-label">
                                    Department ID
                                </label>

                                <input type="text"
                                       class="form-control"
                                       value="${department.deptId}"
                                       readonly>

                            </div>

                        </c:if>


                        <!-- ================================================= -->
                        <!-- BUTTONS -->
                        <!-- ================================================= -->

                        <div class="col-12">

                            <hr class="my-2">

                            <div class="d-flex gap-2 pt-2">

                                <button type="submit"
                                        class="btn btn-primary">

                                    <i class="bi bi-check-circle me-2"></i>

                                    ${department.deptId > 0
                                        ? 'Update Department'
                                        : 'Save Department'}

                                </button>


                                <a href="${pageContext.request.contextPath}/admin/departments"
                                   class="btn btn-outline-secondary">

                                    <i class="bi bi-x-circle me-2"></i>

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