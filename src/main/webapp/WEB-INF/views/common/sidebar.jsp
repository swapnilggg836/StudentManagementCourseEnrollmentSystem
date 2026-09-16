<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ==============================
     ADMIN SIDEBAR
================================ -->

<aside class="admin-sidebar" id="adminSidebar">

    <!-- Logo -->
    <div class="sidebar-logo">

        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="sidebar-brand">

            <span class="brand-icon">
                <i class="bi bi-mortarboard-fill"></i>
            </span>

            <span class="brand-text">
                Edu<span>Manage</span>
            </span>

        </a>

    </div>


    <!-- ==============================
         MAIN NAVIGATION
    =============================== -->

    <div class="sidebar-section">

        <div class="sidebar-section-title">
            MAIN
        </div>


        <!-- Dashboard -->
        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="sidebar-link">

            <i class="bi bi-grid-1x2-fill"></i>

            <span>Dashboard</span>

        </a>


        <!-- Students -->
        <a href="${pageContext.request.contextPath}/admin/students"
           class="sidebar-link">

            <i class="bi bi-people-fill"></i>

            <span>Students</span>

        </a>


        <!-- Departments -->
        <a href="${pageContext.request.contextPath}/admin/departments"
           class="sidebar-link">

            <i class="bi bi-building"></i>

            <span>Departments</span>

        </a>


        <!-- Courses -->
        <a href="${pageContext.request.contextPath}/admin/courses"
           class="sidebar-link">

            <i class="bi bi-book-fill"></i>

            <span>Courses</span>

        </a>


        <!-- Faculty -->
        <a href="${pageContext.request.contextPath}/admin/faculty"
           class="sidebar-link">

            <i class="bi bi-person-badge-fill"></i>

            <span>Faculty</span>

        </a>

    </div>


    <!-- ==============================
         ACADEMICS
    =============================== -->

    <div class="sidebar-section">

        <div class="sidebar-section-title">
            ACADEMICS
        </div>


        <!-- Enrollments -->
        <a href="${pageContext.request.contextPath}/admin/enrollments"
           class="sidebar-link">

            <i class="bi bi-journal-check"></i>

            <span>Enrollments</span>

        </a>


        <!-- Payments -->
        <a href="${pageContext.request.contextPath}/admin/payments"
           class="sidebar-link">

            <i class="bi bi-credit-card-fill"></i>

            <span>Payments</span>

        </a>


        <!-- Reports -->
        <a href="${pageContext.request.contextPath}/admin/reports"
           class="sidebar-link">

            <i class="bi bi-bar-chart-fill"></i>

            <span>Reports</span>

        </a>

    </div>


    <!-- ==============================
         SYSTEM
    =============================== -->

    <div class="sidebar-section">

        <div class="sidebar-section-title">
            SYSTEM
        </div>


        <!-- Settings -->
        <a href="#"
           class="sidebar-link">

            <i class="bi bi-gear-fill"></i>

            <span>Settings</span>

        </a>


        <!-- Logout -->
        <a href="${pageContext.request.contextPath}/logout"
           class="sidebar-link sidebar-logout">

            <i class="bi bi-box-arrow-right"></i>

            <span>Logout</span>

        </a>

    </div>


    <!-- ==============================
         ADMIN PROFILE
    =============================== -->

    <div class="sidebar-user">

        <div class="sidebar-user-avatar">

            <i class="bi bi-person-fill"></i>

        </div>


        <div class="sidebar-user-info">

            <strong>Administrator</strong>

            <span>Admin</span>

        </div>


        <button type="button"
                class="sidebar-user-menu"
                title="Account options">

            <i class="bi bi-three-dots-vertical"></i>

        </button>

    </div>

</aside>