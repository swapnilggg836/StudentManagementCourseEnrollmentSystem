<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="student-navbar">

    <div class="student-navbar-left">

        <button type="button"
                class="student-sidebar-toggle"
                id="studentSidebarToggle"
                aria-label="Toggle student sidebar">

            <i class="bi bi-list"></i>

        </button>


        <div class="student-navbar-page-info">

            <h5>
                Student Dashboard
            </h5>

            <span>
                Your academic overview
            </span>

        </div>

    </div>


    <div class="student-navbar-right">


        <!-- Search -->

        <div class="student-navbar-search">

            <i class="bi bi-search"></i>

            <input
                type="text"
                id="studentGlobalSearch"
                placeholder="Search..."
                autocomplete="off">

        </div>


        <!-- Notification -->

        <button type="button"
                class="student-navbar-icon-btn"
                title="Notifications">

            <i class="bi bi-bell"></i>

        </button>


        <div class="student-navbar-divider"></div>


        <!-- Profile -->

        <div class="student-navbar-profile">

            <div class="student-navbar-avatar">

                <i class="bi bi-person-fill"></i>

            </div>


            <div class="student-navbar-profile-info">

                <strong>
                    ${student.fullName}
                </strong>

                <span>
                    Student
                </span>

            </div>


            <button type="button"
                    class="student-profile-dropdown-btn"
                    id="studentProfileDropdownBtn"
                    aria-label="Open profile menu">

                <i class="bi bi-chevron-down"></i>

            </button>


            <div class="student-profile-dropdown"
                 id="studentProfileDropdown">

                <a href="${pageContext.request.contextPath}/student/profile"
                   class="student-profile-dropdown-item">

                    <i class="bi bi-person"></i>

                    <span>
                        My Profile
                    </span>

                </a>


                <a href="#"
                   class="student-profile-dropdown-item">

                    <i class="bi bi-gear"></i>

                    <span>
                        Settings
                    </span>

                </a>


                <div class="student-profile-dropdown-divider"></div>


                <a href="${pageContext.request.contextPath}/logout"
                   class="student-profile-dropdown-item logout-item"
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