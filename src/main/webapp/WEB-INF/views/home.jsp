<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>EduManage - Student Management & Course Enrollment System</title>

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

    <!-- Main CSS -->
    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/css/style.css">

</head>

<body>


<!-- ========================================================= -->
<!-- NAVBAR -->
<!-- ========================================================= -->

<nav class="navbar navbar-expand-lg bg-white border-bottom sticky-top">

    <div class="container">

        <!-- BRAND -->

        <a class="navbar-brand d-flex align-items-center gap-2"
           href="${pageContext.request.contextPath}/">

            <span class="brand-icon">
                <i class="bi bi-mortarboard-fill"></i>
            </span>

            <span class="brand-text">
                Edu<span>Manage</span>
            </span>

        </a>


        <!-- MOBILE BUTTON -->

        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#mainNavbar"
            aria-controls="mainNavbar"
            aria-expanded="false"
            aria-label="Toggle navigation">

            <span class="navbar-toggler-icon"></span>

        </button>


        <!-- NAVIGATION -->

        <div class="collapse navbar-collapse"
             id="mainNavbar">

            <ul class="navbar-nav mx-auto gap-lg-3">

                <li class="nav-item">
                    <a class="nav-link active"
                       href="#home">
                        Home
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link"
                       href="#about">
                        About
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link"
                       href="#features">
                        Features
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link"
                       href="#workflow">
                        How It Works
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link"
                       href="#contact">
                        Contact
                    </a>
                </li>

            </ul>


            <!-- ONLY ONE MAIN BUTTON -->

            <div class="d-flex">

                <a
                    href="${pageContext.request.contextPath}/login"
                    class="btn btn-primary px-4">

                    <i class="bi bi-box-arrow-in-right me-2"></i>

                    Sign In

                </a>

            </div>

        </div>

    </div>

</nav>



<!-- ========================================================= -->
<!-- HERO -->
<!-- ========================================================= -->

<section id="home"
         class="hero-section">

    <div class="container">

        <div class="row align-items-center g-5">


            <!-- HERO LEFT -->

            <div class="col-lg-7">

                <span class="hero-badge">

                    <i class="bi bi-stars me-2"></i>

                    Academic Management System

                </span>


                <h1 class="hero-title mt-4">

                    Student Management &

                    <br>

                    Course Enrollment System

                </h1>


                <p class="hero-description mt-4">

                    EduManage is a centralized web application for
                    managing students, faculty, departments, courses,
                    enrollments, payments and attendance through
                    role-based portals.

                </p>


                <!-- MAIN ACTION -->

                <div class="d-flex flex-wrap gap-3 mt-4">

                    <a
                        href="${pageContext.request.contextPath}/login"
                        class="btn btn-primary btn-lg hero-btn">

                        <i class="bi bi-box-arrow-in-right me-2"></i>

                        Sign In to EduManage

                    </a>

                </div>


                <!-- KEY POINTS -->

                <div class="hero-points mt-4">

                    <span>

                        <i class="bi bi-check-circle-fill"></i>

                        Role-Based Access

                    </span>


                    <span>

                        <i class="bi bi-check-circle-fill"></i>

                        Course Enrollment

                    </span>


                    <span>

                        <i class="bi bi-check-circle-fill"></i>

                        Attendance Management

                    </span>

                </div>

            </div>



            <!-- HERO RIGHT -->

            <div class="col-lg-5">

                <div class="demo-card">


                    <div class="demo-header">

                        <div class="window-dots">

                            <span class="dot red"></span>

                            <span class="dot yellow"></span>

                            <span class="dot green"></span>

                        </div>

                        <strong>
                            EduManage Portal
                        </strong>

                        <span class="online-badge">
                            System
                        </span>

                    </div>


                    <div class="demo-body">


                        <div class="mb-4">

                            <small class="text-uppercase text-muted fw-bold">
                                Academic Management
                            </small>

                            <h5 class="fw-bold mb-0 mt-1">
                                Manage Everything in One Place
                            </h5>

                        </div>


                        <!-- FEATURE PREVIEW -->

                        <div class="demo-course">

                            <div class="d-flex align-items-center gap-3">

                                <div class="feature-icon blue">

                                    <i class="bi bi-people-fill"></i>

                                </div>

                                <div>

                                    <strong>
                                        Student Management
                                    </strong>

                                    <small class="d-block text-muted">
                                        Profiles and academic information
                                    </small>

                                </div>

                            </div>

                        </div>


                        <div class="demo-course">

                            <div class="d-flex align-items-center gap-3">

                                <div class="feature-icon green">

                                    <i class="bi bi-journal-check"></i>

                                </div>

                                <div>

                                    <strong>
                                        Course Enrollment
                                    </strong>

                                    <small class="d-block text-muted">
                                        Browse, cart and enroll in courses
                                    </small>

                                </div>

                            </div>

                        </div>


                        <div class="demo-course">

                            <div class="d-flex align-items-center gap-3">

                                <div class="feature-icon purple">

                                    <i class="bi bi-person-workspace"></i>

                                </div>

                                <div>

                                    <strong>
                                        Faculty Management
                                    </strong>

                                    <small class="d-block text-muted">
                                        Courses, students and attendance
                                    </small>

                                </div>

                            </div>

                        </div>


                        <a
                            href="${pageContext.request.contextPath}/login"
                            class="btn btn-primary w-100 mt-2">

                            Open EduManage

                            <i class="bi bi-arrow-right ms-2"></i>

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- ========================================================= -->
<!-- ABOUT -->
<!-- ========================================================= -->

<section id="about"
         class="about-section">

    <div class="container">

        <div class="row align-items-center g-5">


            <div class="col-lg-6">

                <span class="section-badge">
                    About EduManage
                </span>

                <h2 class="mt-3">

                    One Platform for
                    Academic Management

                </h2>


                <p class="about-text">

                    EduManage is a Student Management and Course
                    Enrollment System designed to simplify academic
                    administration through a single web application.

                </p>


                <p class="about-text">

                    The system connects administrators, students and
                    faculty with separate role-based dashboards and
                    provides the tools required for everyday academic
                    operations.

                </p>


                <div class="about-points">

                    <div>

                        <i class="bi bi-check-circle"></i>

                        Admin, Student and Faculty portals

                    </div>


                    <div>

                        <i class="bi bi-check-circle"></i>

                        Centralized student and course information

                    </div>


                    <div>

                        <i class="bi bi-check-circle"></i>

                        Secure role-based login

                    </div>


                    <div>

                        <i class="bi bi-check-circle"></i>

                        Enrollment and payment management

                    </div>

                </div>

            </div>


            <div class="col-lg-6">

                <div class="support-card">

                    <div class="text-center">

                        <div class="feature-icon blue mx-auto mb-4">

                            <i class="bi bi-mortarboard-fill"></i>

                        </div>

                        <h3>
                            EduManage
                        </h3>

                        <p class="text-muted">

                            Student Management & Course
                            Enrollment System

                        </p>

                    </div>


                    <div class="row g-3 mt-3">


                        <div class="col-6">

                            <div class="text-center p-3 border rounded">

                                <i class="bi bi-shield-check fs-3 text-primary"></i>

                                <div class="fw-semibold mt-2">
                                    Secure
                                </div>

                                <small class="text-muted">
                                    Role-based access
                                </small>

                            </div>

                        </div>


                        <div class="col-6">

                            <div class="text-center p-3 border rounded">

                                <i class="bi bi-database-check fs-3 text-success"></i>

                                <div class="fw-semibold mt-2">
                                    Centralized
                                </div>

                                <small class="text-muted">
                                    Academic data
                                </small>

                            </div>

                        </div>


                        <div class="col-6">

                            <div class="text-center p-3 border rounded">

                                <i class="bi bi-laptop fs-3 text-primary"></i>

                                <div class="fw-semibold mt-2">
                                    Web Based
                                </div>

                                <small class="text-muted">
                                    Easy access
                                </small>

                            </div>

                        </div>


                        <div class="col-6">

                            <div class="text-center p-3 border rounded">

                                <i class="bi bi-people fs-3 text-warning"></i>

                                <div class="fw-semibold mt-2">
                                    Multi Role
                                </div>

                                <small class="text-muted">
                                    Admin, Student, Faculty
                                </small>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- ========================================================= -->
<!-- FEATURES -->
<!-- ========================================================= -->

<section id="features"
         class="features-section">

    <div class="container">


        <div class="section-heading">

            <span class="section-badge">
                Core Features
            </span>

            <h2>
                Everything Your Academic System Needs
            </h2>

            <p>

                EduManage provides separate tools for
                administration, students and faculty.

            </p>

        </div>


        <div class="row g-4">


            <!-- ADMIN -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon blue">

                        <i class="bi bi-speedometer2"></i>

                    </div>

                    <h4>
                        Admin Dashboard
                    </h4>

                    <p>

                        Manage students, departments, courses,
                        faculty, enrollments, payments and reports
                        from one centralized dashboard.

                    </p>

                </div>

            </div>


            <!-- STUDENTS -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon green">

                        <i class="bi bi-person-fill"></i>

                    </div>

                    <h4>
                        Student Portal
                    </h4>

                    <p>

                        Students can manage their profile, browse
                        available courses, add courses to cart,
                        enroll, make payments and view their academic
                        information.

                    </p>

                </div>

            </div>


            <!-- FACULTY -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon purple">

                        <i class="bi bi-person-workspace"></i>

                    </div>

                    <h4>
                        Faculty Portal
                    </h4>

                    <p>

                        Faculty can view their courses, see enrolled
                        students and manage attendance through their
                        dedicated portal.

                    </p>

                </div>

            </div>


            <!-- COURSE -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon yellow">

                        <i class="bi bi-journal-bookmark-fill"></i>

                    </div>

                    <h4>
                        Course Management
                    </h4>

                    <p>

                        Manage course details, credits, faculty
                        assignments, capacity, schedules and course
                        fees.

                    </p>

                </div>

            </div>


            <!-- ENROLLMENT -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon red">

                        <i class="bi bi-cart-check-fill"></i>

                    </div>

                    <h4>
                        Course Enrollment
                    </h4>

                    <p>

                        Students can browse courses, add them to a
                        cart, enroll and track their enrollment
                        history.

                    </p>

                </div>

            </div>


            <!-- PAYMENT -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon cyan">

                        <i class="bi bi-credit-card-fill"></i>

                    </div>

                    <h4>
                        Payments & Fees
                    </h4>

                    <p>

                        Manage course payments and provide students
                        with payment history, transaction details and
                        fee information.

                    </p>

                </div>

            </div>


            <!-- ATTENDANCE -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon orange">

                        <i class="bi bi-calendar-check-fill"></i>

                    </div>

                    <h4>
                        Attendance
                    </h4>

                    <p>

                        Faculty can manage attendance for students
                        enrolled in their assigned courses.

                    </p>

                </div>

            </div>


            <!-- REPORTS -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon dark">

                        <i class="bi bi-bar-chart-fill"></i>

                    </div>

                    <h4>
                        Reports & Analytics
                    </h4>

                    <p>

                        Admin can view enrollment, department and
                        payment information through reports and
                        dashboard analytics.

                    </p>

                </div>

            </div>


            <!-- DATABASE -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon blue">

                        <i class="bi bi-database-fill"></i>

                    </div>

                    <h4>
                        Centralized Data
                    </h4>

                    <p>

                        Student, faculty, course, enrollment,
                        attendance and payment information is stored
                        in the MySQL database.

                    </p>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- ========================================================= -->
<!-- HOW IT WORKS -->
<!-- ========================================================= -->

<section id="workflow"
         class="workflow-section">

    <div class="container">


        <div class="section-heading">

            <span class="section-badge green-badge">
                How It Works
            </span>

            <h2>
                Simple Role-Based Workflow
            </h2>

            <p>

                Each user gets access to the features relevant
                to their role.

            </p>

        </div>


        <div class="row g-4 workflow-row">


            <!-- STEP 1 -->

            <div class="col-6 col-lg-3">

                <div class="workflow-step">

                    <div class="step-number">
                        1
                    </div>

                    <h5>
                        Sign In
                    </h5>

                    <p>
                        Login using your registered credentials.
                    </p>

                </div>

            </div>


            <!-- STEP 2 -->

            <div class="col-6 col-lg-3">

                <div class="workflow-step">

                    <div class="step-number">
                        2
                    </div>

                    <h5>
                        Role Verification
                    </h5>

                    <p>
                        EduManage identifies Admin, Student or Faculty.
                    </p>

                </div>

            </div>


            <!-- STEP 3 -->

            <div class="col-6 col-lg-3">

                <div class="workflow-step">

                    <div class="step-number">
                        3
                    </div>

                    <h5>
                        Open Dashboard
                    </h5>

                    <p>
                        Access the dashboard according to your role.
                    </p>

                </div>

            </div>


            <!-- STEP 4 -->

            <div class="col-6 col-lg-3">

                <div class="workflow-step">

                    <div class="step-number">
                        4
                    </div>

                    <h5>
                        Manage Activities
                    </h5>

                    <p>
                        Perform the academic operations available
                        to your role.
                    </p>

                </div>

            </div>

        </div>


        <!-- ROLE FLOW -->

        <div class="row g-4 mt-4">


            <div class="col-md-4">

                <div class="feature-card text-center">

                    <div class="feature-icon blue mx-auto">

                        <i class="bi bi-shield-lock-fill"></i>

                    </div>

                    <h4>
                        Admin
                    </h4>

                    <p>
                        Students, departments, courses, faculty,
                        enrollments, payments and reports.
                    </p>

                </div>

            </div>


            <div class="col-md-4">

                <div class="feature-card text-center">

                    <div class="feature-icon green mx-auto">

                        <i class="bi bi-person-fill"></i>

                    </div>

                    <h4>
                        Student
                    </h4>

                    <p>
                        Profile, courses, cart, enrollment,
                        payments, schedule and fees.
                    </p>

                </div>

            </div>


            <div class="col-md-4">

                <div class="feature-card text-center">

                    <div class="feature-icon purple mx-auto">

                        <i class="bi bi-person-workspace"></i>

                    </div>

                    <h4>
                        Faculty
                    </h4>

                    <p>
                        Profile, assigned courses, students and
                        attendance.
                    </p>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- ========================================================= -->
<!-- CONTACT -->
<!-- ========================================================= -->

<section id="contact"
         class="about-section">

    <div class="container">

        <div class="row justify-content-center">

            <div class="col-lg-9">

                <div class="support-card text-center">


                    <span class="section-badge">
                        Contact
                    </span>


                    <h2 class="mt-3">
                        Need Help With EduManage?
                    </h2>


                    <p class="about-text mx-auto">

                        For accessing EduManage, use the
                        <strong>Sign In</strong> button.
                        Your access and available features depend
                        on your assigned role.

                    </p>


                    <div class="row g-3 mt-4">


                        <div class="col-md-4">

                            <div class="p-4 border rounded h-100">

                                <i class="bi bi-person-lock fs-2 text-primary"></i>

                                <h5 class="mt-3">
                                    Login
                                </h5>

                                <p class="text-muted mb-0">
                                    Access your EduManage portal.
                                </p>

                            </div>

                        </div>


                        <div class="col-md-4">

                            <div class="p-4 border rounded h-100">

                                <i class="bi bi-shield-check fs-2 text-success"></i>

                                <h5 class="mt-3">
                                    Role Access
                                </h5>

                                <p class="text-muted mb-0">
                                    Admin, Student and Faculty access.
                                </p>

                            </div>

                        </div>


                        <div class="col-md-4">

                            <div class="p-4 border rounded h-100">

                                <i class="bi bi-headset fs-2 text-warning"></i>

                                <h5 class="mt-3">
                                    Academic Support
                                </h5>

                                <p class="text-muted mb-0">
                                    Use the appropriate portal for
                                    your academic activities.
                                </p>

                            </div>

                        </div>

                    </div>


                    <a
                        href="${pageContext.request.contextPath}/login"
                        class="btn btn-primary btn-lg mt-4">

                        <i class="bi bi-box-arrow-in-right me-2"></i>

                        Sign In to EduManage

                    </a>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- ========================================================= -->
<!-- FOOTER -->
<!-- ========================================================= -->

<footer class="footer">

    <div class="container">


        <div class="row g-5">


            <!-- BRAND -->

            <div class="col-lg-6">

                <div class="footer-brand">

                    <span class="brand-icon">

                        <i class="bi bi-mortarboard-fill"></i>

                    </span>

                    <span class="brand-text">

                        Edu<span>Manage</span>

                    </span>

                </div>


                <p>

                    Student Management & Course Enrollment System
                    for managing academic activities through
                    Admin, Student and Faculty portals.

                </p>

            </div>


            <!-- QUICK LINKS -->

            <div class="col-6 col-lg-3">

                <h6>
                    QUICK LINKS
                </h6>


                <a href="#home">
                    Home
                </a>

                <a href="#about">
                    About
                </a>

                <a href="#features">
                    Features
                </a>

                <a href="#workflow">
                    How It Works
                </a>

                <a href="#contact">
                    Contact
                </a>

            </div>


            <!-- TECHNOLOGY -->

            <div class="col-6 col-lg-3">

                <h6>
                    TECHNOLOGY
                </h6>


                <div class="tech-tags">

                    <span>
                        Java 21
                    </span>

                    <span>
                        Spring MVC
                    </span>

                    <span>
                        JSP
                    </span>

                    <span>
                        MySQL
                    </span>

                    <span>
                        JDBC
                    </span>

                    <span>
                        Bootstrap 5
                    </span>

                    <span>
                        JavaScript
                    </span>

                </div>

            </div>

        </div>


        <hr>


        <div class="footer-bottom">

            <span>
                © 2026 EduManage
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


</body>

</html>