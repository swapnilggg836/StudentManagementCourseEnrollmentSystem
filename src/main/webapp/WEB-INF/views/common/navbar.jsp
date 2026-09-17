<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ==============================
     ADMIN TOP NAVBAR
================================ -->

<header class="admin-navbar">


    <!-- ==============================
         LEFT SIDE
    =============================== -->

    <div class="navbar-left">


        <!-- Mobile Sidebar Button -->

        <button type="button"
                class="sidebar-toggle"
                id="sidebarToggle"
                aria-label="Toggle sidebar">

            <i class="bi bi-list"></i>

        </button>


        <!-- Page Information -->

        <div class="navbar-page-info">

            <h5 class="navbar-page-title">
                Admin Dashboard
            </h5>

            <span class="navbar-page-subtitle">
                Manage your institution
            </span>

        </div>

    </div>


    <!-- ==============================
         RIGHT SIDE
    =============================== -->

    <div class="navbar-right">


        <!-- ==============================
             SEARCH
        =============================== -->

        <div class="navbar-search">

            <i class="bi bi-search"></i>

            <input
                type="text"
                id="globalSearch"
                placeholder="Search..."
                autocomplete="off">

        </div>


        <!-- ==============================
             NOTIFICATION
        =============================== -->

        <button type="button"
                class="navbar-icon-btn"
                title="Notifications"
                id="notificationBtn">

            <i class="bi bi-bell"></i>

            <span class="notification-badge">
                3
            </span>

        </button>


        <!-- Divider -->

        <div class="navbar-divider"></div>


        <!-- ==============================
             ADMIN PROFILE
        =============================== -->

        <div class="navbar-profile"
             id="adminProfile">


            <!-- Avatar -->

            <div class="navbar-avatar">

                <i class="bi bi-person-fill"></i>

            </div>


            <!-- Profile Information -->

            <div class="navbar-profile-info">

                <strong>
                    Administrator
                </strong>

                <span>
                    Admin
                </span>

            </div>


            <!-- Dropdown Button -->

            <button type="button"
                    class="profile-dropdown-btn"
                    id="profileDropdownBtn"
                    aria-label="Open profile menu">

                <i class="bi bi-chevron-down"></i>

            </button>


            <!-- ==============================
                 PROFILE DROPDOWN
            =============================== -->

            <div class="profile-dropdown"
                 id="profileDropdown">


                <!-- My Profile -->

                <a href="#"
                   class="profile-dropdown-item">

                    <i class="bi bi-person"></i>

                    <span>
                        My Profile
                    </span>

                </a>


                <!-- Settings -->

                <a href="#"
                   class="profile-dropdown-item">

                    <i class="bi bi-gear"></i>

                    <span>
                        Settings
                    </span>

                </a>


                <!-- Divider -->

                <div class="profile-dropdown-divider"></div>


                <!-- Logout -->

                <a href="${pageContext.request.contextPath}/logout"
                   class="profile-dropdown-item logout-item"
                   onclick="return confirm('Are you sure you want to logout?');">

                    <i class="bi bi-box-arrow-right"></i>

                    <span>
                        Logout
                    </span>

                </a>

            </div>

        </div>

    </div>

</header>