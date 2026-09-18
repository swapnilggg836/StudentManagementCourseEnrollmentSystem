<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../common/header.jsp" />

<div class="student-layout">

    <jsp:include page="../common/student-sidebar.jsp" />

    <div class="student-main">

        <jsp:include page="../common/student-navbar.jsp" />

        <main class="student-content">

            <div class="student-page-header">

                <div>

                    <div class="student-breadcrumb">

                        <span>Student</span>

                        <i class="bi bi-chevron-right"></i>

                        <span>Courses</span>

                    </div>

                    <h1>Available Courses</h1>

                    <p>
                        Explore courses available for enrollment.
                    </p>

                </div>

            </div>


            <!-- SEARCH -->

            <div class="student-course-filter-card">

                <form
                    action="${pageContext.request.contextPath}/student/courses"
                    method="get">

                    <div class="row g-3 align-items-end">

                        <div class="col-lg-6">

                            <label class="student-filter-label">
                                Search Course
                            </label>

                            <div class="student-course-search">

                                <i class="bi bi-search"></i>

                                <input
                                    type="text"
                                    name="keyword"
                                    class="form-control"
                                    placeholder="Search by course code, title, department or faculty..."
                                    value="${keyword}">

                            </div>

                        </div>


                        <div class="col-lg-4">

                            <label class="student-filter-label">
                                Department
                            </label>

                            <select
                                name="deptId"
                                class="form-select">

                                <option value="0">
                                    All Departments
                                </option>

                                <c:forEach
                                    var="department"
                                    items="${departments}">

                                    <option
                                        value="${department.deptId}"
                                        <c:if test="${selectedDeptId == department.deptId}">
                                            selected
                                        </c:if>>

                                        ${department.deptCode} -
                                        ${department.deptName}

                                    </option>

                                </c:forEach>

                            </select>

                        </div>


                        <div class="col-lg-2">

                            <button
                                type="submit"
                                class="btn student-course-search-btn w-100">

                                <i class="bi bi-search"></i>
                                Search

                            </button>

                        </div>

                    </div>

                </form>

            </div>


            <!-- COURSE SUMMARY -->

            <div class="student-course-summary">

                <div>

                    <span class="student-course-summary-label">
                        Available Courses
                    </span>

                    <strong>
                        ${totalCourses}
                    </strong>

                </div>

                <c:if test="${not empty keyword}">

                    <div class="student-course-search-result">

                        <i class="bi bi-search"></i>

                        Search results for:

                        <strong>
                            "${keyword}"
                        </strong>

                    </div>

                </c:if>

            </div>


            <!-- COURSE LIST -->

            <c:choose>

                <c:when test="${not empty courses}">

                    <div class="row g-4">

                        <c:forEach
                            var="course"
                            items="${courses}">

                            <div class="col-xl-4 col-lg-6">

                                <div class="student-course-card">


                                    <!-- CARD HEADER -->

                                    <div class="student-course-card-header">

                                        <div class="student-course-icon">

                                            <i class="bi bi-book"></i>

                                        </div>

                                        <div class="student-course-code">

                                            ${course.courseCode}

                                        </div>

                                    </div>


                                    <!-- CARD BODY -->

                                    <div class="student-course-card-body">

                                        <h3>
                                            ${course.title}
                                        </h3>


                                        <div class="student-course-info-row">

                                            <i class="bi bi-building"></i>

                                            <span>

                                                <c:choose>
                                                    <c:when test="${not empty course.departmentCode}">
                                                        ${course.departmentCode} -
                                                        ${course.departmentName}
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${course.departmentName}
                                                    </c:otherwise>
                                                </c:choose>

                                            </span>

                                        </div>


                                        <div class="student-course-info-row">

                                            <i class="bi bi-person-badge"></i>

                                            <span>

                                                <c:choose>
                                                    <c:when test="${not empty course.facultyName}">
                                                        ${course.facultyName}
                                                    </c:when>
                                                    <c:otherwise>
                                                        Faculty not assigned
                                                    </c:otherwise>
                                                </c:choose>

                                            </span>

                                        </div>


                                        <div class="student-course-info-row">

                                            <i class="bi bi-calendar-event"></i>

                                            <span>

                                                <c:choose>

                                                    <c:when test="${not empty course.scheduleDay}">

                                                        ${course.scheduleDay}

                                                        <c:if test="${not empty course.scheduleTime}">
                                                            · ${course.scheduleTime}
                                                        </c:if>

                                                    </c:when>

                                                    <c:otherwise>
                                                        Schedule not available
                                                    </c:otherwise>

                                                </c:choose>

                                            </span>

                                        </div>


                                        <c:if test="${not empty course.description}">

                                            <p class="student-course-description">
                                                ${course.description}
                                            </p>

                                        </c:if>


                                        <!-- COURSE METRICS -->

                                        <div class="student-course-metrics">

                                            <div class="student-course-metric">

                                                <span>
                                                    Credits
                                                </span>

                                                <strong>
                                                    ${course.credits}
                                                </strong>

                                            </div>


                                            <div class="student-course-metric">

                                                <span>
                                                    Seats
                                                </span>

                                                <strong>
                                                    ${course.availableSeats}
                                                </strong>

                                            </div>


                                            <div class="student-course-metric">

                                                <span>
                                                    Fee
                                                </span>

                                                <strong>
                                                    ₹${course.feeAmount}
                                                </strong>

                                            </div>

                                        </div>


                                        <!-- SEAT STATUS -->

                                        <c:choose>

                                            <c:when test="${course.availableSeats > 0}">

                                                <div class="student-course-seat-status available">

                                                    <i class="bi bi-check-circle-fill"></i>

                                                    ${course.availableSeats}
                                                    seats available

                                                </div>

                                            </c:when>

                                            <c:otherwise>

                                                <div class="student-course-seat-status full">

                                                    <i class="bi bi-x-circle-fill"></i>

                                                    Course Full

                                                </div>

                                            </c:otherwise>

                                        </c:choose>

                                    </div>


                                    <!-- CARD FOOTER -->

                                    <div class="student-course-card-footer">


                                        <!-- VIEW DETAILS -->

                                        <a
                                            href="${pageContext.request.contextPath}/student/course?id=${course.courseId}"
                                            class="student-course-details-btn">

                                            <i class="bi bi-eye"></i>

                                            View Details

                                        </a>


                                        <!-- COURSE ACTION -->

                                        <c:choose>

                                            <c:when test="${course.enrolled}">

                                                <button
                                                    type="button"
                                                    class="student-course-enrolled-btn"
                                                    disabled>

                                                    <i class="bi bi-check-circle-fill"></i>

                                                    Enrolled

                                                </button>

                                            </c:when>


                                            <c:when test="${course.availableSeats <= 0}">

                                                <button
                                                    type="button"
                                                    class="student-course-full-btn"
                                                    disabled>

                                                    <i class="bi bi-lock-fill"></i>

                                                    Full

                                                </button>

                                            </c:when>


                                            <c:otherwise>

                                                <a
                                                    href="${pageContext.request.contextPath}/student/cart/add?courseId=${course.courseId}"
                                                    class="student-course-enroll-btn">

                                                    <i class="bi bi-cart-plus"></i>

                                                    Add to Cart

                                                </a>

                                            </c:otherwise>

                                        </c:choose>

                                    </div>


                                    <!-- ENROLL NOW -->

                                    <c:if test="${not course.enrolled && course.availableSeats > 0}">

                                        <div class="student-course-direct-enroll">

                                            <a
                                                href="${pageContext.request.contextPath}/student/enroll?courseId=${course.courseId}"
                                                class="student-course-direct-enroll-btn">

                                                <i class="bi bi-credit-card"></i>

                                                Enroll Now & Pay

                                            </a>

                                        </div>

                                    </c:if>


                                </div>

                            </div>

                        </c:forEach>

                    </div>

                </c:when>


                <c:otherwise>

                    <div class="student-empty-course">

                        <div class="student-empty-course-icon">

                            <i class="bi bi-book"></i>

                        </div>

                        <h3>
                            No Courses Found
                        </h3>

                        <p>

                            <c:choose>

                                <c:when test="${not empty keyword}">

                                    No courses matched
                                    "${keyword}".

                                </c:when>

                                <c:otherwise>

                                    There are currently no courses
                                    available.

                                </c:otherwise>

                            </c:choose>

                        </p>


                        <c:if test="${not empty keyword or selectedDeptId > 0}">

                            <a
                                href="${pageContext.request.contextPath}/student/courses"
                                class="student-clear-filter-btn">

                                <i class="bi bi-arrow-clockwise"></i>

                                Clear Filters

                            </a>

                        </c:if>

                    </div>

                </c:otherwise>

            </c:choose>

        </main>

    </div>

</div>


<script>

document.addEventListener("DOMContentLoaded", function () {

    const menuButton =
        document.querySelector(".student-menu-toggle");

    const sidebar =
        document.querySelector(".student-sidebar");

    if (menuButton && sidebar) {

        menuButton.addEventListener("click", function () {

            sidebar.classList.toggle("show");

        });

    }

});

</script>

</body>
</html>