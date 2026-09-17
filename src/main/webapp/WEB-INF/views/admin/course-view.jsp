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

                        <i class="bi bi-chevron-right"></i>

                        <span>Course Details</span>

                    </div>

                    <h1 class="page-title">
                        Course Details
                    </h1>

                    <p class="page-subtitle">
                        View complete course information and enrollment details
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


            <!-- =====================================================
                 COURSE HEADER CARD
                 ===================================================== -->

            <div class="content-card mb-4">

                <div class="content-card-body">

                    <div class="d-flex justify-content-between
                                align-items-start flex-wrap gap-3">

                        <div>

                            <div class="d-flex align-items-center gap-2 mb-2">

                                <span class="badge bg-primary">

                                    ${course.courseCode}

                                </span>

                                <span class="badge bg-light text-dark">

                                    ${course.credits} Credits

                                </span>

                            </div>

                            <h2 class="mb-2">
                                ${course.title}
                            </h2>

                            <p class="text-muted mb-0">

                                ${course.departmentCode}
                                -
                                ${course.departmentName}

                            </p>

                        </div>


                        <!-- ACTIONS -->

                        <div class="d-flex gap-2">

                            <a href="${pageContext.request.contextPath}/admin/courses/edit?id=${course.courseId}"
                               class="btn btn-outline-primary">

                                <i class="bi bi-pencil me-2"></i>

                                Edit Course

                            </a>


                            <form method="post"
                                  action="${pageContext.request.contextPath}/admin/courses/delete"
                                  onsubmit="return confirm('Are you sure you want to delete this course?');">

                                <input type="hidden"
                                       name="id"
                                       value="${course.courseId}">

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


            <!-- =====================================================
                 COURSE INFORMATION
                 ===================================================== -->

            <div class="row g-4">


                <!-- =================================================
                     BASIC INFORMATION
                     ================================================= -->

                <div class="col-lg-8">

                    <div class="content-card h-100">

                        <div class="content-card-header">

                            <div>

                                <h3 class="content-card-title">
                                    Course Information
                                </h3>

                                <p class="content-card-subtitle">
                                    Basic course details
                                </p>

                            </div>

                        </div>


                        <div class="content-card-body">

                            <div class="row g-4">


                                <!-- COURSE CODE -->

                                <div class="col-md-6">

                                    <small class="text-muted d-block mb-1">
                                        Course Code
                                    </small>

                                    <strong>
                                        ${course.courseCode}
                                    </strong>

                                </div>


                                <!-- TITLE -->

                                <div class="col-md-6">

                                    <small class="text-muted d-block mb-1">
                                        Course Title
                                    </small>

                                    <strong>
                                        ${course.title}
                                    </strong>

                                </div>


                                <!-- DEPARTMENT -->

                                <div class="col-md-6">

                                    <small class="text-muted d-block mb-1">
                                        Department
                                    </small>

                                    <strong>
                                        ${course.departmentName}
                                    </strong>

                                    <div class="text-muted small">
                                        ${course.departmentCode}
                                    </div>

                                </div>


                                <!-- CREDITS -->

                                <div class="col-md-6">

                                    <small class="text-muted d-block mb-1">
                                        Credits
                                    </small>

                                    <strong>
                                        ${course.credits}
                                    </strong>

                                </div>


                                <!-- SCHEDULE -->

                                <div class="col-md-6">

                                    <small class="text-muted d-block mb-1">
                                        Schedule
                                    </small>

                                    <c:choose>

                                        <c:when test="${not empty course.scheduleDay
                                                       and not empty course.scheduleTime}">

                                            <strong>
                                                ${course.scheduleDay}
                                            </strong>

                                            <div class="text-muted small">
                                                ${course.scheduleTime}
                                            </div>

                                        </c:when>

                                        <c:when test="${not empty course.scheduleDay}">

                                            <strong>
                                                ${course.scheduleDay}
                                            </strong>

                                        </c:when>

                                        <c:when test="${not empty course.scheduleTime}">

                                            <strong>
                                                ${course.scheduleTime}
                                            </strong>

                                        </c:when>

                                        <c:otherwise>

                                            <span class="text-muted">
                                                Not Scheduled
                                            </span>

                                        </c:otherwise>

                                    </c:choose>

                                </div>


                                <!-- COURSE FEE -->

                                <div class="col-md-6">

                                    <small class="text-muted d-block mb-1">
                                        Course Fee
                                    </small>

                                    <strong class="fs-5">
                                        ₹${course.feeAmount}
                                    </strong>

                                </div>


                                <!-- DESCRIPTION -->

                                <div class="col-12">

                                    <small class="text-muted d-block mb-2">
                                        Description
                                    </small>

                                    <c:choose>

                                        <c:when test="${not empty course.description}">

                                            <p class="mb-0">
                                                ${course.description}
                                            </p>

                                        </c:when>

                                        <c:otherwise>

                                            <p class="text-muted mb-0">
                                                No description available.
                                            </p>

                                        </c:otherwise>

                                    </c:choose>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- =================================================
                     ENROLLMENT SUMMARY
                     ================================================= -->

                <div class="col-lg-4">

                    <div class="content-card h-100">

                        <div class="content-card-header">

                            <div>

                                <h3 class="content-card-title">
                                    Enrollment
                                </h3>

                                <p class="content-card-subtitle">
                                    Current seat utilization
                                </p>

                            </div>

                        </div>


                        <div class="content-card-body">


                            <!-- ENROLLED -->

                            <div class="d-flex justify-content-between mb-2">

                                <span class="text-muted">
                                    Enrolled Students
                                </span>

                                <strong>
                                    ${course.enrolledStudents}
                                </strong>

                            </div>


                            <!-- PROGRESS -->

                            <c:set var="enrollmentPercentage"
                                   value="${course.capacity > 0
                                           ? (course.enrolledStudents * 100.0 / course.capacity)
                                           : 0}" />

                            <c:if test="${enrollmentPercentage > 100}">

                                <c:set var="enrollmentPercentage"
                                       value="100" />

                            </c:if>


                            <div class="progress mb-3"
                                 style="height: 10px;">

                                <div class="progress-bar"
                                     role="progressbar"
                                     style="width: ${enrollmentPercentage}%;">
                                </div>

                            </div>


                            <!-- CAPACITY -->

                            <div class="d-flex justify-content-between mb-3">

                                <span class="text-muted">
                                    Total Capacity
                                </span>

                                <strong>
                                    ${course.capacity}
                                </strong>

                            </div>


                            <!-- AVAILABLE -->

                            <div class="d-flex justify-content-between">

                                <span class="text-muted">
                                    Available Seats
                                </span>

                                <strong class="text-success">
                                    ${course.availableSeats}
                                </strong>

                            </div>


                        </div>

                    </div>

                </div>


                <!-- =================================================
                     FACULTY
                     ================================================= -->

                <div class="col-lg-6">

                    <div class="content-card h-100">

                        <div class="content-card-header">

                            <div>

                                <h3 class="content-card-title">
                                    Assigned Faculty
                                </h3>

                                <p class="content-card-subtitle">
                                    Faculty responsible for this course
                                </p>

                            </div>

                        </div>


                        <div class="content-card-body">

                            <c:choose>

                                <c:when test="${not empty course.facultyName}">

                                    <div class="d-flex align-items-center gap-3">

                                        <div class="rounded-circle bg-primary
                                                    text-white d-flex
                                                    align-items-center
                                                    justify-content-center"
                                             style="width: 48px;
                                                    height: 48px;">

                                            <i class="bi bi-person-fill"></i>

                                        </div>


                                        <div>

                                            <strong>
                                                ${course.facultyName}
                                            </strong>

                                            <div class="text-muted small">
                                                Assigned Faculty
                                            </div>

                                        </div>

                                    </div>

                                </c:when>


                                <c:otherwise>

                                    <div class="text-center py-3">

                                        <i class="bi bi-person-x
                                                  display-6 text-muted">
                                        </i>

                                        <p class="text-muted mt-2 mb-0">
                                            No faculty assigned
                                        </p>

                                    </div>

                                </c:otherwise>

                            </c:choose>

                        </div>

                    </div>

                </div>


                <!-- =================================================
                     COURSE STATUS
                     ================================================= -->

                <div class="col-lg-6">

                    <div class="content-card h-100">

                        <div class="content-card-header">

                            <div>

                                <h3 class="content-card-title">
                                    Course Status
                                </h3>

                                <p class="content-card-subtitle">
                                    Current course availability
                                </p>

                            </div>

                        </div>


                        <div class="content-card-body">

                            <c:choose>

                                <c:when test="${course.availableSeats > 0}">

                                    <div class="d-flex align-items-center gap-3">

                                        <div class="rounded-circle
                                                    bg-success-subtle
                                                    text-success
                                                    d-flex
                                                    align-items-center
                                                    justify-content-center"
                                             style="width: 48px;
                                                    height: 48px;">

                                            <i class="bi bi-check-circle-fill"></i>

                                        </div>

                                        <div>

                                            <strong>
                                                Seats Available
                                            </strong>

                                            <div class="text-muted small">

                                                ${course.availableSeats}
                                                seat(s) remaining

                                            </div>

                                        </div>

                                    </div>

                                </c:when>


                                <c:otherwise>

                                    <div class="d-flex align-items-center gap-3">

                                        <div class="rounded-circle
                                                    bg-danger-subtle
                                                    text-danger
                                                    d-flex
                                                    align-items-center
                                                    justify-content-center"
                                             style="width: 48px;
                                                    height: 48px;">

                                            <i class="bi bi-x-circle-fill"></i>

                                        </div>

                                        <div>

                                            <strong>
                                                Course Full
                                            </strong>

                                            <div class="text-muted small">
                                                No seats currently available
                                            </div>

                                        </div>

                                    </div>

                                </c:otherwise>

                            </c:choose>

                        </div>

                    </div>

                </div>

            </div>

        </main>

    </div>

</div>


<jsp:include page="../common/footer.jsp" />