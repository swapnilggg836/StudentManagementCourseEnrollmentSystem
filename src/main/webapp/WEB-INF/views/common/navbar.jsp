<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ==============================
     ADMIN TOP NAVBAR
================================ -->

<header class="admin-navbar">

    <!-- Left Side -->
    <div class="navbar-left">

        <!-- Mobile Sidebar Button -->
        <button type="button"
                class="sidebar-toggle"
                id="sidebarToggle"
                aria-label="Toggle sidebar">

            <i class="bi bi-list"></i>

        </button>


        <!-- Page Title -->
        <div class="navbar-page-info">

            <h5 class="navbar-page-title">
                Admin Dashboard
            </h5>

            <span class="navbar-page-subtitle">
                Manage your institution
            </span>

        </div>

    </div>


    <!-- Right Side -->
    <div class="navbar-right">


        <!-- Search -->
        <div class="navbar-search">

            <i class="bi bi-search"></i>

            <input
                type="text"
                id="globalSearch"
                placeholder="Search..."
                autocomplete="off">

        </div>


        <!-- Notification -->
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


        <!-- Admin Profile -->
        <div class="navbar-profile"
             id="adminProfile">

            <div class="navbar-avatar">

                <i class="bi bi-person-fill"></i>

            </div>


            <div class="navbar-profile-info">

                <strong>
                    Administrator
                </strong>

                <span>
                    Admin
                </span>

            </div>


            <button type="button"
                    class="profile-dropdown-btn"
                    id="profileDropdownBtn"
                    aria-label="Open profile menu">

                <i class="bi bi-chevron-down"></i>

            </button>


            <!-- Profile Dropdown -->
            <div class="profile-dropdown"
                 id="profileDropdown">

                <a href="#"
                   class="profile-dropdown-item">

                    <i class="bi bi-person"></i>

                    <span>
                        My Profile
                    </span>

                </a>


                <a href="#"
                   class="profile-dropdown-item">

                    <i class="bi bi-gear"></i>

                    <span>
                        Settings
                    </span>

                </a>


                <div class="profile-dropdown-divider"></div>


                <a href="${pageContext.request.contextPath}/logout"
                   class="profile-dropdown-item logout-item">

                    <i class="bi bi-box-arrow-right"></i>

                    <span>
                        Logout
                    </span>

                </a>

            </div>

        </div>

    </div>

</header>