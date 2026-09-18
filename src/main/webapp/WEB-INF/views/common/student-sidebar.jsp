<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<aside class="student-sidebar" id="studentSidebar">

    <!-- Logo -->

    <div class="student-sidebar-logo">

        <a href="${pageContext.request.contextPath}/student/dashboard"
           class="student-brand">

            <span class="student-brand-icon">
                <i class="bi bi-mortarboard-fill"></i>
            </span>

            <span class="student-brand-text">
                Edu<span>Manage</span>
            </span>

        </a>

    </div>


    <!-- Main -->

    <div class="student-sidebar-section">

        <div class="student-sidebar-title">
            MAIN
        </div>


        <a href="${pageContext.request.contextPath}/student/dashboard"
           class="student-sidebar-link active">

            <i class="bi bi-grid-1x2-fill"></i>

            <span>Dashboard</span>

        </a>


        <a href="${pageContext.request.contextPath}/student/profile"
           class="student-sidebar-link">

            <i class="bi bi-person-fill"></i>

            <span>My Profile</span>

        </a>


        <a href="${pageContext.request.contextPath}/student/courses"
           class="student-sidebar-link">

            <i class="bi bi-book-fill"></i>

            <span>Available Courses</span>

        </a>

    </div>


    <!-- Academics -->

    <div class="student-sidebar-section">

        <div class="student-sidebar-title">
            ACADEMICS
        </div>


        <a href="${pageContext.request.contextPath}/student/cart"
           class="student-sidebar-link">

            <i class="bi bi-cart-fill"></i>

            <span>My Cart</span>

        </a>


        <a href="${pageContext.request.contextPath}/student/enrollments"
           class="student-sidebar-link">

            <i class="bi bi-journal-check"></i>

            <span>My Enrollments</span>

        </a>


        <a href="${pageContext.request.contextPath}/student/schedule"
           class="student-sidebar-link">

            <i class="bi bi-calendar3"></i>

            <span>Schedule</span>

        </a>

    </div>


    <!-- Finance -->

    <div class="student-sidebar-section">

        <div class="student-sidebar-title">
            FINANCE
        </div>


        <a href="${pageContext.request.contextPath}/student/fees"
           class="student-sidebar-link">

            <i class="bi bi-credit-card-fill"></i>

            <span>Fees & Payment</span>

        </a>


        

    </div>


    <!-- System -->

    <div class="student-sidebar-section">

        <div class="student-sidebar-title">
            SYSTEM
        </div>


        <a href="${pageContext.request.contextPath}/logout"
           class="student-sidebar-link student-sidebar-logout"
           onclick="return confirm('Are you sure you want to logout?');">

            <i class="bi bi-box-arrow-right"></i>

            <span>Logout</span>

        </a>

    </div>


    <!-- Student Profile Bottom -->

    <div class="student-sidebar-user">

        <div class="student-sidebar-avatar">

            <i class="bi bi-person-fill"></i>

        </div>

        <div class="student-sidebar-user-info">

            <strong>
                ${student.fullName}
            </strong>

            <span>
                Student
            </span>

        </div>

    </div>

</aside>