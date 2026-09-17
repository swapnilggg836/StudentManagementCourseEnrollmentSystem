<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../common/header.jsp" />

<div class="admin-app">

    <jsp:include page="../common/sidebar.jsp" />

    <div class="admin-main">

        <jsp:include page="../common/navbar.jsp" />

        <main class="admin-content">


            <!-- =====================================================
                 PAGE HEADER
            ====================================================== -->

            <div class="page-header">

                <div class="page-header-left">

                    <div class="breadcrumb-area">

                        <span>EduManage</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>Enrollments</span>

                    </div>


                    <h1 class="page-title">
                        Enrollment Management
                    </h1>


                    <p class="page-subtitle">
                        Manage student course enrollments and enrollment status
                    </p>

                </div>

            </div>


            <!-- =====================================================
                 SUCCESS MESSAGE
            ====================================================== -->

            <c:if test="${not empty param.success}">

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


            <!-- =====================================================
                 ERROR MESSAGE
            ====================================================== -->

            <c:if test="${not empty param.error}">

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
                 DYNAMIC STATISTICS
            ====================================================== -->

            <div class="row g-4 mb-4">


                <!-- TOTAL -->

                <div class="col-xl-3 col-md-6">

                    <div class="content-card h-100">

                        <div class="content-card-body">

                            <div class="d-flex justify-content-between">

                                <div>

                                    <p class="text-muted mb-1">
                                        Total Enrollments
                                    </p>

                                    <h2 class="mb-1">
                                        ${totalEnrollments}
                                    </h2>

                                    <small class="text-muted">
                                        All enrollment records
                                    </small>

                                </div>


                                <div class="fs-3 text-primary">

                                    <i class="bi bi-journal-check"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- ENROLLED -->

                <div class="col-xl-3 col-md-6">

                    <div class="content-card h-100">

                        <div class="content-card-body">

                            <div class="d-flex justify-content-between">

                                <div>

                                    <p class="text-muted mb-1">
                                        Enrolled
                                    </p>

                                    <h2 class="mb-1">
                                        ${enrolledCount}
                                    </h2>

                                    <small class="text-success">
                                        Currently enrolled
                                    </small>

                                </div>


                                <div class="fs-3 text-success">

                                    <i class="bi bi-person-check"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- DROPPED -->

                <div class="col-xl-3 col-md-6">

                    <div class="content-card h-100">

                        <div class="content-card-body">

                            <div class="d-flex justify-content-between">

                                <div>

                                    <p class="text-muted mb-1">
                                        Dropped
                                    </p>

                                    <h2 class="mb-1">
                                        ${droppedCount}
                                    </h2>

                                    <small class="text-danger">
                                        Dropped enrollments
                                    </small>

                                </div>


                                <div class="fs-3 text-danger">

                                    <i class="bi bi-person-dash"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- COMPLETED -->

                <div class="col-xl-3 col-md-6">

                    <div class="content-card h-100">

                        <div class="content-card-body">

                            <div class="d-flex justify-content-between">

                                <div>

                                    <p class="text-muted mb-1">
                                        Completed
                                    </p>

                                    <h2 class="mb-1">
                                        ${completedCount}
                                    </h2>

                                    <small class="text-muted">
                                        Completed courses
                                    </small>

                                </div>


                                <div class="fs-3 text-primary">

                                    <i class="bi bi-mortarboard"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>


            </div>


            <!-- =====================================================
                 FILTER CARD
            ====================================================== -->

            <div class="content-card mb-4">

                <div class="content-card-header">

                    <div>

                        <h3 class="content-card-title">
                            Enrollment Filters
                        </h3>

                        <p class="content-card-subtitle">
                            Filter enrollment records
                        </p>

                    </div>

                </div>


                <div class="content-card-body">

                    <form method="get"
                          action="${pageContext.request.contextPath}/admin/enrollments">

                        <div class="row g-3">


                            <!-- STUDENT -->

                            <div class="col-lg-3 col-md-6">

                                <label for="studentId"
                                       class="form-label">

                                    Student

                                </label>


                                <select id="studentId"
                                        name="studentId"
                                        class="form-select">

                                    <option value="">
                                        All Students
                                    </option>


                                    <c:forEach var="student"
                                               items="${students}">

                                        <option value="${student.studentId}"
                                                <c:if test="${student.studentId == selectedStudentId}">
                                                    selected
                                                </c:if>>

                                            ${student.rollNo}
                                            -
                                            ${student.firstName}
                                            ${student.lastName}

                                        </option>

                                    </c:forEach>

                                </select>

                            </div>


                            <!-- COURSE -->

                            <div class="col-lg-3 col-md-6">

                                <label for="courseId"
                                       class="form-label">

                                    Course

                                </label>


                                <select id="courseId"
                                        name="courseId"
                                        class="form-select">

                                    <option value="">
                                        All Courses
                                    </option>


                                    <c:forEach var="course"
                                               items="${courses}">

                                        <option value="${course.courseId}"
                                                <c:if test="${course.courseId == selectedCourseId}">
                                                    selected
                                                </c:if>>

                                            ${course.courseCode}
                                            -
                                            ${course.title}

                                        </option>

                                    </c:forEach>

                                </select>

                            </div>


                            <!-- DEPARTMENT -->

                            <div class="col-lg-2 col-md-6">

                                <label for="deptId"
                                       class="form-label">

                                    Department

                                </label>


                                <select id="deptId"
                                        name="deptId"
                                        class="form-select">

                                    <option value="">
                                        All Departments
                                    </option>


                                    <c:forEach var="department"
                                               items="${departments}">

                                        <option value="${department.deptId}"
                                                <c:if test="${department.deptId == selectedDeptId}">
                                                    selected
                                                </c:if>>

                                            ${department.deptCode}

                                        </option>

                                    </c:forEach>

                                </select>

                            </div>


                            <!-- SEMESTER -->

                            <div class="col-lg-2 col-md-6">

                                <label for="semester"
                                       class="form-label">

                                    Semester

                                </label>


                                <select id="semester"
                                        name="semester"
                                        class="form-select">

                                    <option value="">
                                        All Semesters
                                    </option>

                                    <c:forEach var="sem"
                                               begin="1"
                                               end="8">

                                        <option value="${sem}"
                                                <c:if test="${sem == selectedSemester}">
                                                    selected
                                                </c:if>>

                                            Semester ${sem}

                                        </option>

                                    </c:forEach>

                                </select>

                            </div>


                            <!-- STATUS -->

                            <div class="col-lg-2 col-md-6">

                                <label for="status"
                                       class="form-label">

                                    Status

                                </label>


                                <select id="status"
                                        name="status"
                                        class="form-select">

                                    <option value="">
                                        All Status
                                    </option>

                                    <option value="ENROLLED"
                                            <c:if test="${selectedStatus == 'ENROLLED'}">
                                                selected
                                            </c:if>>

                                        Enrolled

                                    </option>

                                    <option value="DROPPED"
                                            <c:if test="${selectedStatus == 'DROPPED'}">
                                                selected
                                            </c:if>>

                                        Dropped

                                    </option>

                                    <option value="COMPLETED"
                                            <c:if test="${selectedStatus == 'COMPLETED'}">
                                                selected
                                            </c:if>>

                                        Completed

                                    </option>

                                </select>

                            </div>


                            <!-- BUTTONS -->

                            <div class="col-12">

                                <div class="d-flex gap-2">

                                    <button type="submit"
                                            class="btn btn-primary">

                                        <i class="bi bi-funnel me-2"></i>

                                        Apply Filters

                                    </button>


                                    <a href="${pageContext.request.contextPath}/admin/enrollments"
                                       class="btn btn-outline-secondary">

                                        <i class="bi bi-arrow-counterclockwise me-2"></i>

                                        Reset

                                    </a>

                                </div>

                            </div>

                        </div>

                    </form>

                </div>

            </div>


            <!-- =====================================================
                 ENROLLMENT TABLE
            ====================================================== -->

            <div class="content-card">


                <div class="content-card-header">

                    <div>

                        <h3 class="content-card-title">
                            Enrollment Records
                        </h3>

                        <p class="content-card-subtitle">
                            View and manage student course enrollments
                        </p>

                    </div>


                    <span class="badge bg-primary">

                        ${enrollments.size()}
                        Record(s)

                    </span>

                </div>


                <div class="content-card-body p-0">

                    <div class="table-responsive">

                        <table class="table table-hover align-middle mb-0">


                            <thead>

                                <tr>

                                    <th>
                                        Enrollment ID
                                    </th>

                                    <th>
                                        Student
                                    </th>

                                    <th>
                                        Roll Number
                                    </th>

                                    <th>
                                        Course
                                    </th>

                                    <th>
                                        Department
                                    </th>

                                    <th>
                                        Semester
                                    </th>

                                    <th>
                                        Enrollment Date
                                    </th>

                                    <th>
                                        Status
                                    </th>

                                    <th>
                                        Grade
                                    </th>

                                    <th class="text-end">
                                        Actions
                                    </th>

                                </tr>

                            </thead>


                            <tbody>


                                <c:forEach var="enrollment"
                                           items="${enrollments}">


                                    <tr>


                                        <!-- ENROLLMENT ID -->

                                        <td>

                                            <strong>
                                                #${enrollment.enrollmentId}
                                            </strong>

                                        </td>


                                        <!-- STUDENT -->

                                        <td>

                                            <div>

                                                <strong>
                                                    ${enrollment.studentName}
                                                </strong>

                                            </div>

                                        </td>


                                        <!-- ROLL NUMBER -->

                                        <td>

                                            <span class="badge bg-light text-dark">

                                                ${enrollment.rollNo}

                                            </span>

                                        </td>


                                        <!-- COURSE -->

                                        <td>

                                            <strong>
                                                ${enrollment.courseCode}
                                            </strong>

                                            <div class="text-muted small">

                                                ${enrollment.courseTitle}

                                            </div>

                                        </td>


                                        <!-- DEPARTMENT -->

                                        <td>

                                            ${enrollment.departmentName}

                                        </td>


                                        <!-- SEMESTER -->

                                        <td>

                                            Semester
                                            ${enrollment.semester}

                                        </td>


                                        <!-- DATE -->

                                        <td>

                                            <c:choose>

                                                <c:when test="${not empty enrollment.enrollmentDate}">

                                                    ${enrollment.enrollmentDate}

                                                </c:when>

                                                <c:otherwise>

                                                    <span class="text-muted">
                                                        -
                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>


                                        <!-- STATUS -->

                                        <td>

                                            <c:choose>


                                                <c:when test="${enrollment.status == 'ENROLLED'}">

                                                    <span class="badge bg-success">

                                                        Enrolled

                                                    </span>

                                                </c:when>


                                                <c:when test="${enrollment.status == 'DROPPED'}">

                                                    <span class="badge bg-danger">

                                                        Dropped

                                                    </span>

                                                </c:when>


                                                <c:when test="${enrollment.status == 'COMPLETED'}">

                                                    <span class="badge bg-primary">

                                                        Completed

                                                    </span>

                                                </c:when>


                                                <c:otherwise>

                                                    <span class="badge bg-secondary">

                                                        ${enrollment.status}

                                                    </span>

                                                </c:otherwise>


                                            </c:choose>

                                        </td>


                                        <!-- GRADE -->

                                        <td>

                                            <c:choose>

                                                <c:when test="${not empty enrollment.grade}">

                                                    <strong>
                                                        ${enrollment.grade}
                                                    </strong>

                                                </c:when>

                                                <c:otherwise>

                                                    <span class="text-muted">
                                                        -
                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>


                                        <!-- ACTIONS -->

                                        <td class="text-end">

                                            <div class="btn-group">


                                                <!-- VIEW -->

                                                <a href="${pageContext.request.contextPath}/admin/enrollments/view?id=${enrollment.enrollmentId}"
                                                   class="btn btn-sm btn-outline-primary"
                                                   title="View">

                                                    <i class="bi bi-eye"></i>

                                                </a>


                                                <!-- DROP -->

                                                <c:if test="${enrollment.status == 'ENROLLED'}">

                                                    <form method="post"
                                                          action="${pageContext.request.contextPath}/admin/enrollments/drop"
                                                          style="display:inline;"
                                                          onsubmit="return confirm('Are you sure you want to drop this enrollment?');">

                                                        <input type="hidden"
                                                               name="id"
                                                               value="${enrollment.enrollmentId}">

                                                        <button type="submit"
                                                                class="btn btn-sm btn-outline-danger"
                                                                title="Drop">

                                                            <i class="bi bi-person-dash"></i>

                                                        </button>

                                                    </form>

                                                </c:if>


                                                <!-- COMPLETE -->

                                                <c:if test="${enrollment.status == 'ENROLLED'}">

                                                    <form method="post"
                                                          action="${pageContext.request.contextPath}/admin/enrollments/complete"
                                                          style="display:inline;"
                                                          onsubmit="return confirm('Mark this enrollment as completed?');">

                                                        <input type="hidden"
                                                               name="id"
                                                               value="${enrollment.enrollmentId}">

                                                        <button type="submit"
                                                                class="btn btn-sm btn-outline-success"
                                                                title="Mark Completed">

                                                            <i class="bi bi-check-circle"></i>

                                                        </button>

                                                    </form>

                                                </c:if>


                                            </div>

                                        </td>


                                    </tr>


                                </c:forEach>


                                <!-- NO RECORDS -->

                                <c:if test="${empty enrollments}">

                                    <tr>

                                        <td colspan="10"
                                            class="text-center py-5">


                                            <div class="mb-3">

                                                <i class="bi bi-journal-x display-5 text-muted"></i>

                                            </div>


                                            <h5>
                                                No Enrollment Records Found
                                            </h5>


                                            <p class="text-muted mb-0">

                                                No enrollment records match
                                                the selected filters.

                                            </p>


                                        </td>

                                    </tr>

                                </c:if>


                            </tbody>

                        </table>

                    </div>

                </div>


                <!-- FOOTER -->

                <div class="content-card-footer">

                    <span class="text-muted">

                        Showing

                        <strong>
                            ${enrollments.size()}
                        </strong>

                        enrollment record(s)

                    </span>

                </div>


            </div>


        </main>

    </div>

</div>


<jsp:include page="../common/footer.jsp" />