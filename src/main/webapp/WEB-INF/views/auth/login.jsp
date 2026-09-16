<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>EduManage - Login</title>

    <!-- Bootstrap 5 -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
        rel="stylesheet">

    <!-- Google Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">

    <!-- Main EduManage CSS -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/css/style.css">

</head>


<body class="login-page">


    <!-- ========================================================= -->
    <!-- LOGIN NAVBAR -->
    <!-- ========================================================= -->

    <nav class="navbar navbar-expand-lg bg-white border-bottom">

        <div class="container">

            <!-- Logo -->

            <a class="navbar-brand d-flex align-items-center gap-2"
                href="${pageContext.request.contextPath}/">

                <span class="brand-icon">
                    <i class="bi bi-mortarboard-fill"></i>
                </span>

                <span class="brand-text">
                    Edu<span>Manage</span>
                </span>

            </a>


            <!-- Back to Home -->

            <a href="${pageContext.request.contextPath}/"
                class="btn btn-outline-primary login-home-btn">

                <i class="bi bi-house me-2"></i>
                Back to Home

            </a>

        </div>

    </nav>



    <!-- ========================================================= -->
    <!-- LOGIN SECTION -->
    <!-- ========================================================= -->

    <main class="login-section">

        <div class="container">

            <div class="row justify-content-center">

                <div class="col-xl-5 col-lg-6 col-md-8">


                    <!-- Login Card -->

                    <div class="login-card">


                        <!-- Icon -->

                        <div class="login-icon">

                            <i class="bi bi-person-lock"></i>

                        </div>


                        <!-- Heading -->

                        <div class="text-center">

                            <h1 class="login-title">
                                Welcome Back
                            </h1>

                            <p class="login-subtitle">
                                Sign in to your EduManage account
                            </p>

                        </div>



                        <!-- Login Form -->

                        <form action="${pageContext.request.contextPath}/login"
                            method="post"
                            class="login-form">


                            <!-- Username / Email -->

                            <div class="mb-4">

                                <label for="username"
                                    class="form-label">

                                    Username or Email

                                </label>

                                <div class="login-input-group">

                                    <i class="bi bi-person"></i>

                                    <input
                                        type="text"
                                        id="username"
                                        name="username"
                                        class="form-control"
                                        placeholder="Enter username or email"
                                        autocomplete="username"
                                        required>

                                </div>

                            </div>



                            <!-- Password -->

                            <div class="mb-3">

                                <div class="d-flex justify-content-between">

                                    <label for="password"
                                        class="form-label">

                                        Password

                                    </label>

                                </div>


                                <div class="login-input-group">

                                    <i class="bi bi-lock"></i>

                                    <input
                                        type="password"
                                        id="password"
                                        name="password"
                                        class="form-control"
                                        placeholder="Enter your password"
                                        autocomplete="current-password"
                                        required>


                                    <button
                                        type="button"
                                        class="password-toggle"
                                        onclick="togglePassword()"
                                        aria-label="Show password">

                                        <i
                                            class="bi bi-eye"
                                            id="passwordIcon">
                                        </i>

                                    </button>

                                </div>

                            </div>



                            <!-- Remember Me -->

                            <div class="d-flex justify-content-between
                                align-items-center mb-4">

                                <div class="form-check">

                                    <input
                                        class="form-check-input"
                                        type="checkbox"
                                        id="rememberMe"
                                        name="rememberMe">

                                    <label
                                        class="form-check-label"
                                        for="rememberMe">

                                        Remember me

                                    </label>

                                </div>

                            </div>



                            <!-- Login Button -->

                            <button
                                type="submit"
                                class="btn btn-primary login-btn w-100">

                                <i class="bi bi-box-arrow-in-right me-2"></i>

                                Sign In

                            </button>


                        </form>



                        <!-- Divider -->

                        <div class="login-divider">

                            <span>Secure Role-Based Access</span>

                        </div>



                        <!-- Roles -->

                        <div class="login-roles">


                            <div class="login-role">

                                <div class="role-icon admin-role">

                                    <i class="bi bi-shield-lock"></i>

                                </div>

                                <div>

                                    <strong>Admin</strong>

                                    <small>
                                        Manage system
                                    </small>

                                </div>

                            </div>



                            <div class="login-role">

                                <div class="role-icon student-role">

                                    <i class="bi bi-person"></i>

                                </div>

                                <div>

                                    <strong>Student</strong>

                                    <small>
                                        Access courses
                                    </small>

                                </div>

                            </div>



                            <div class="login-role">

                                <div class="role-icon faculty-role">

                                    <i class="bi bi-person-workspace"></i>

                                </div>

                                <div>

                                    <strong>Faculty</strong>

                                    <small>
                                        Manage academics
                                    </small>

                                </div>

                            </div>


                        </div>



                        <!-- Bottom Text -->

                        <div class="login-footer-text">

                            <i class="bi bi-shield-check me-1"></i>

                            Your account is protected with
                            role-based access control.

                        </div>


                    </div>

                </div>

            </div>

        </div>

    </main>



    <!-- ========================================================= -->
    <!-- FOOTER -->
    <!-- ========================================================= -->

    <footer class="login-footer">

        <div class="container">

            <div class="d-flex flex-column flex-md-row
                justify-content-between align-items-center gap-2">

                <span>
                    © 2026 EduManage. All rights reserved.
                </span>

                <span>
                    Student Management & Course Enrollment System
                </span>

            </div>

        </div>

    </footer>



    <!-- Bootstrap JS -->

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
    </script>



    <!-- Password Toggle -->

    <script>

        function togglePassword() {

            const password =
                document.getElementById("password");

            const icon =
                document.getElementById("passwordIcon");


            if (password.type === "password") {

                password.type = "text";

                icon.classList.remove("bi-eye");

                icon.classList.add("bi-eye-slash");

            } else {

                password.type = "password";

                icon.classList.remove("bi-eye-slash");

                icon.classList.add("bi-eye");

            }

        }

    </script>


</body>

</html>