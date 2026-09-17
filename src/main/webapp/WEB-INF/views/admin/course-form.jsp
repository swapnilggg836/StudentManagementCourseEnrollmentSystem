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

                        <span>Courses</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>Add Course</span>

                    </div>


                    <h1 class="page-title">
                        Add Course
                    </h1>


                    <p class="page-subtitle">
                        Add a new course to the institution
                    </p>

                </div>


                <div class="page-header-actions">

                    <a href="${pageContext.request.contextPath}/admin/courses"
                       class="btn btn-outline-secondary">

                        <i class="bi bi-arrow-left me-2"></i>

                        Back to Courses

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
                            New Course
                        </h3>

                        <p class="content-card-subtitle">
                            Enter the course information below
                        </p>

                    </div>

                </div>


                <div class="content-card-body">

                    <form method="post"
                          action="${pageContext.request.contextPath}/admin/courses/save">

                        <div class="row g-4">


                            <div class="col-md-6">

                                <label for="courseCode"
                                       class="form-label">

                                    Course Code
                                    <span class="text-danger">*</span>

                                </label>

                                <input type="text"
                                       id="courseCode"
                                       name="courseCode"
                                       class="form-control"
                                       placeholder="Example: CS101"
                                       maxlength="30"
                                       required>

                            </div>


                            <div class="col-md-6">

                                <label for="title"
                                       class="form-label">

                                    Course Title
                                    <span class="text-danger">*</span>

                                </label>

                                <input type="text"
                                       id="title"
                                       name="title"
                                       class="form-control"
                                       placeholder="Example: Data Structures"
                                       maxlength="150"
                                       required>

                            </div>


                            <div class="col-12">

                                <label for="description"
                                       class="form-label">

                                    Description

                                </label>

                                <textarea id="description"
                                          name="description"
                                          class="form-control"
                                          rows="4"
                                          placeholder="Enter course description..."></textarea>

                            </div>


                            <div class="col-md-4">

                                <label for="credits"
                                       class="form-label">

                                    Credits
                                    <span class="text-danger">*</span>

                                </label>

                                <input type="number"
                                       id="credits"
                                       name="credits"
                                       class="form-control"
                                       min="1"
                                       required>

                            </div>


                            <div class="col-md-4">

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


                            <div class="col-md-4">

                                <label for="facultyId"
                                       class="form-label">

                                    Faculty

                                </label>

                                <select id="facultyId"
                                        name="facultyId"
                                        class="form-select">

                                    <option value="">
                                        No Faculty Assigned
                                    </option>

                                    <c:forEach var="f"
                                               items="${faculty}">

                                        <option value="${f.facultyId}">

                                            ${f.employeeCode}
                                            -
                                            ${f.firstName}
                                            ${f.lastName}

                                        </option>

                                    </c:forEach>

                                </select>

                            </div>


                            <div class="col-md-4">

                                <label for="capacity"
                                       class="form-label">

                                    Student Capacity
                                    <span class="text-danger">*</span>

                                </label>

                                <input type="number"
                                       id="capacity"
                                       name="capacity"
                                       class="form-control"
                                       value="30"
                                       min="1"
                                       required>

                            </div>


                            <div class="col-md-4">

                                <label for="scheduleDay"
                                       class="form-label">

                                    Schedule Day

                                </label>

                                <select id="scheduleDay"
                                        name="scheduleDay"
                                        class="form-select">

                                    <option value="">
                                        Select Day
                                    </option>

                                    <option value="Monday">
                                        Monday
                                    </option>

                                    <option value="Tuesday">
                                        Tuesday
                                    </option>

                                    <option value="Wednesday">
                                        Wednesday
                                    </option>

                                    <option value="Thursday">
                                        Thursday
                                    </option>

                                    <option value="Friday">
                                        Friday
                                    </option>

                                    <option value="Saturday">
                                        Saturday
                                    </option>

                                    <option value="Sunday">
                                        Sunday
                                    </option>

                                </select>

                            </div>


                            <div class="col-md-4">

                                <label for="scheduleTime"
                                       class="form-label">

                                    Schedule Time

                                </label>

                                <input type="text"
                                       id="scheduleTime"
                                       name="scheduleTime"
                                       class="form-control"
                                       placeholder="Example: 10:00 AM - 11:00 AM"
                                       maxlength="50">

                            </div>


                            <div class="col-md-4">

                                <label for="feeAmount"
                                       class="form-label">

                                    Course Fee
                                    <span class="text-danger">*</span>

                                </label>

                                <div class="input-group">

                                    <span class="input-group-text">
                                        ₹
                                    </span>

                                    <input type="number"
                                           id="feeAmount"
                                           name="feeAmount"
                                           class="form-control"
                                           value="0"
                                           min="0"
                                           step="0.01"
                                           required>

                                </div>

                            </div>

                        </div>


                        <div class="d-flex justify-content-end
                                    gap-2 mt-4 pt-4 border-top">

                            <a href="${pageContext.request.contextPath}/admin/courses"
                               class="btn btn-outline-secondary">

                                <i class="bi bi-x-circle me-2"></i>

                                Cancel

                            </a>


                            <button type="submit"
                                    class="btn btn-primary">

                                <i class="bi bi-plus-circle me-2"></i>

                                Add Course

                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </main>

    </div>

</div>

<jsp:include page="../common/footer.jsp" />