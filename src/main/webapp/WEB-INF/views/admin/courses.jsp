<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../common/header.jsp" />

<div class="admin-app">

    <jsp:include page="../common/sidebar.jsp" />

    <div class="admin-main">

        <jsp:include page="../common/navbar.jsp" />

        <main class="admin-content">

            <!-- =====================================================
                 PAGE HEADER
                 ===================================================== -->

            <div class="page-header">

                <div class="page-header-left">

                    <div class="breadcrumb-area">

                        <span>EduManage</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>Courses</span>

                    </div>

                    <h1 class="page-title">
                        Course Management
                    </h1>

                    <p class="page-subtitle">
                        Manage courses, faculty assignments and student capacity
                    </p>

                </div>


                <div class="page-header-actions">

                    <a href="${pageContext.request.contextPath}/admin/courses/add"
                       class="btn btn-primary">

                        <i class="bi bi-plus-circle me-2"></i>

                        Add Course

                    </a>

                </div>

            </div>


            <!-- =====================================================
                 ALERTS
                 ===================================================== -->

            <c:if test="${param.success != null}">

                <div class="alert alert-success alert-dismissible fade show"
                     role="alert">

                    <i class="bi bi-check-circle me-2"></i>

                    ${param.success}

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

            </c:if>


            <c:if test="${param.error != null}">

                <div class="alert alert-danger alert-dismissible fade show"
                     role="alert">

                    <i class="bi bi-exclamation-circle me-2"></i>

                    ${param.error}

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

            </c:if>


            <!-- =====================================================
                 COURSE CONTENT CARD
                 ===================================================== -->

            <div class="content-card">


                <!-- =================================================
                     CARD HEADER
                     ================================================= -->

                <div class="content-card-header">

                    <div>

                        <h3 class="content-card-title">
                            All Courses
                        </h3>

                        <p class="content-card-subtitle">
                            View and manage all courses in the system
                        </p>

                    </div>


                    <!-- SEARCH -->

                    <form method="get"
                          action="${pageContext.request.contextPath}/admin/courses"
                          class="d-flex gap-2">

                        <div class="input-group">

                            <span class="input-group-text">
                                <i class="bi bi-search"></i>
                            </span>

                            <input type="text"
                                   name="keyword"
                                   value="${keyword}"
                                   class="form-control"
                                   placeholder="Search courses..."
                                   autocomplete="off">

                        </div>

                        <button type="submit"
                                class="btn btn-outline-primary">

                            Search

                        </button>


                        <c:if test="${not empty keyword}">

                            <a href="${pageContext.request.contextPath}/admin/courses"
                               class="btn btn-outline-secondary">

                                <i class="bi bi-x-lg"></i>

                            </a>

                        </c:if>

                    </form>

                </div>


                <!-- =================================================
                     TABLE
                     ================================================= -->

                <div class="content-card-body p-0">

                    <div class="table-responsive">

                        <table class="table table-hover align-middle mb-0">

                            <thead>

                                <tr>

                                    <th>
                                        Course
                                    </th>

                                    <th>
                                        Department
                                    </th>

                                    <th>
                                        Credits
                                    </th>

                                    <th>
                                        Faculty
                                    </th>

                                    <th>
                                        Capacity
                                    </th>

                                    <th>
                                        Enrollment
                                    </th>

                                    <th>
                                        Fee
                                    </th>

                                    <th class="text-end">
                                        Actions
                                    </th>

                                </tr>

                            </thead>


                            <tbody>


                                <!-- =================================================
                                     COURSES EXIST
                                     ================================================= -->

                                <c:forEach var="course"
                                           items="${courses}">

                                    <tr>


                                        <!-- COURSE -->

                                        <td>

                                            <div>

                                                <strong>
                                                    ${course.courseCode}
                                                </strong>

                                                <div class="text-muted small">

                                                    ${course.title}

                                                </div>

                                            </div>

                                        </td>


                                        <!-- DEPARTMENT -->

                                        <td>

                                            <span class="fw-medium">

                                                ${course.departmentCode}

                                            </span>

                                            <div class="text-muted small">

                                                ${course.departmentName}

                                            </div>

                                        </td>


                                        <!-- CREDITS -->

                                        <td>

                                            <span class="badge bg-light text-dark">

                                                ${course.credits} Credits

                                            </span>

                                        </td>


                                        <!-- FACULTY -->

                                        <td>

                                            <c:choose>

                                                <c:when test="${not empty course.facultyName}">

                                                    <span>
                                                        ${course.facultyName}
                                                    </span>

                                                </c:when>

                                                <c:otherwise>

                                                    <span class="text-muted">
                                                        Not Assigned
                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>


                                        <!-- CAPACITY -->

                                        <td>

                                            ${course.capacity}

                                        </td>


                                        <!-- ENROLLMENT -->

                                        <td>

                                            <div class="d-flex align-items-center gap-2">

                                                <span>
                                                    ${course.enrolledStudents}/${course.capacity}
                                                </span>

                                            </div>


                                            <div class="progress mt-1"
                                                 style="height: 5px;">

                                                <c:set var="enrollmentPercentage"
                                                       value="${course.capacity > 0
                                                               ? (course.enrolledStudents * 100.0 / course.capacity)
                                                               : 0}" />

                                                <c:if test="${enrollmentPercentage > 100}">
                                                    <c:set var="enrollmentPercentage"
                                                           value="100" />
                                                </c:if>

                                                <div class="progress-bar"
                                                     role="progressbar"
                                                     style="width: ${enrollmentPercentage}%;">
                                                </div>

                                            </div>


                                            <small class="text-muted">

                                                ${course.availableSeats}
                                                seats available

                                            </small>

                                        </td>


                                        <!-- FEE -->

                                        <td>

                                            <strong>
                                                ₹${course.feeAmount}
                                            </strong>

                                        </td>


                                        <!-- ACTIONS -->

                                        <td class="text-end">

                                            <div class="btn-group">


                                                <!-- VIEW -->

                                                <a href="${pageContext.request.contextPath}/admin/courses/view?id=${course.courseId}"
                                                   class="btn btn-sm btn-outline-primary"
                                                   title="View Course">

                                                    <i class="bi bi-eye"></i>

                                                </a>


                                                <!-- EDIT -->

                                                <a href="${pageContext.request.contextPath}/admin/courses/edit?id=${course.courseId}"
                                                   class="btn btn-sm btn-outline-secondary"
                                                   title="Edit Course">

                                                    <i class="bi bi-pencil"></i>

                                                </a>


                                                <!-- DELETE -->

                                                <form method="post"
                                                      action="${pageContext.request.contextPath}/admin/courses/delete"
                                                      style="display:inline;"
                                                      onsubmit="return confirm('Are you sure you want to delete this course?');">

                                                    <input type="hidden"
                                                           name="id"
                                                           value="${course.courseId}">

                                                    <button type="submit"
                                                            class="btn btn-sm btn-outline-danger"
                                                            title="Delete Course">

                                                        <i class="bi bi-trash"></i>

                                                    </button>

                                                </form>

                                            </div>

                                        </td>

                                    </tr>

                                </c:forEach>


                                <!-- =================================================
                                     NO COURSES
                                     ================================================= -->

                                <c:if test="${empty courses}">

                                    <tr>

                                        <td colspan="8"
                                            class="text-center py-5">

                                            <div class="mb-3">

                                                <i class="bi bi-book display-5 text-muted"></i>

                                            </div>

                                            <h5>
                                                No Courses Found
                                            </h5>

                                            <p class="text-muted mb-3">

                                                <c:choose>

                                                    <c:when test="${not empty keyword}">

                                                        No course matches
                                                        "<strong>${keyword}</strong>".

                                                    </c:when>

                                                    <c:otherwise>

                                                        No courses have been added yet.

                                                    </c:otherwise>

                                                </c:choose>

                                            </p>


                                            <a href="${pageContext.request.contextPath}/admin/courses/add"
                                               class="btn btn-primary">

                                                <i class="bi bi-plus-circle me-2"></i>

                                                Add First Course

                                            </a>

                                        </td>

                                    </tr>

                                </c:if>


                            </tbody>

                        </table>

                    </div>

                </div>


                <!-- =================================================
                     CARD FOOTER
                     ================================================= -->

                <div class="content-card-footer">

                    <span class="text-muted">

                        Total Courses:
                        <strong>${courses.size()}</strong>

                    </span>

                </div>

            </div>

        </main>

    </div>

</div>


<jsp:include page="../common/footer.jsp" />