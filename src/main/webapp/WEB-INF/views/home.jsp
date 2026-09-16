<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>
        EduManage - Student Management & Course Enrollment System
    </title>

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

    <!-- YOUR CUSTOM CSS -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/css/style.css">

</head>

<body>

<!-- ========================================================= -->
<!-- NAVBAR -->
<!-- ========================================================= -->

<nav class="navbar navbar-expand-lg bg-white border-bottom sticky-top">

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


        <!-- Mobile Toggle -->

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#mainNavbar"
                aria-controls="mainNavbar"
                aria-expanded="false"
                aria-label="Toggle navigation">

            <span class="navbar-toggler-icon"></span>

        </button>


        <!-- Navigation -->

        <div class="collapse navbar-collapse" id="mainNavbar">

            <ul class="navbar-nav mx-auto gap-lg-3">

                <li class="nav-item">
                    <a class="nav-link active" href="#home">
                        Home
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#about">
                        About
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#courses">
                        Courses
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#features">
                        Features
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#workflow">
                        How It Works
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#contact">
                        Contact
                    </a>
                </li>

            </ul>


            <!-- Right Buttons -->

            <div class="d-flex gap-2">

                <a href="${pageContext.request.contextPath}/login"
                   class="btn btn-outline-primary px-4">

                    <i class="bi bi-box-arrow-in-right me-2"></i>
                    Sign In

                </a>

                <a href="${pageContext.request.contextPath}/login"
                   class="btn btn-primary px-4">

                    <i class="bi bi-person-fill me-2"></i>
                    Student Portal

                </a>

            </div>

        </div>

    </div>

</nav>


<!-- ========================================================= -->
<!-- HERO -->
<!-- ========================================================= -->

<section id="home" class="hero-section">

    <div class="container">

        <div class="row align-items-center g-5">

            <!-- LEFT -->

            <div class="col-lg-7">

                <span class="hero-badge">

                    <i class="bi bi-stars me-2"></i>

                    Next-Gen Higher Education Management

                </span>


                <h1 class="hero-title mt-4">

                    Student Management &

                    <br>

                    Course Enrollment System

                </h1>


                <p class="hero-description mt-4">

                    A centralized SaaS platform to seamlessly manage
                    student lifecycles, curriculum courses, faculty
                    assignments, real-time seat capacities, and
                    simulated academic tuition payments.

                </p>


                <!-- HERO BUTTONS -->

                <div class="d-flex flex-wrap gap-3 mt-4">

                    <a href="${pageContext.request.contextPath}/login"
                       class="btn btn-primary btn-lg hero-btn">

                        <i class="bi bi-person-badge me-2"></i>

                        Sign In

                    </a>


                    <a href="${pageContext.request.contextPath}/login"
                       class="btn btn-outline-dark btn-lg hero-btn">

                        <i class="bi bi-shield-lock me-2"></i>

                        Admin / Registrar

                    </a>


                    <a href="${pageContext.request.contextPath}/login"
                       class="btn btn-outline-secondary btn-lg hero-btn">

                        <i class="bi bi-person-workspace me-2"></i>

                        Faculty

                    </a>

                </div>


                <!-- TRUST ITEMS -->

                <div class="hero-points mt-4">

                    <span>
                        <i class="bi bi-check-circle-fill"></i>
                        Secure Role-Based Access
                    </span>

                    <span>
                        <i class="bi bi-check-circle-fill"></i>
                        MySQL Powered
                    </span>

                    <span>
                        <i class="bi bi-check-circle-fill"></i>
                        Responsive SaaS UI
                    </span>

                </div>

            </div>


            <!-- RIGHT DEMO -->

            <div class="col-lg-5">

                <div class="demo-card">

                    <div class="demo-header">

                        <div class="window-dots">

                            <span class="dot red"></span>
                            <span class="dot yellow"></span>
                            <span class="dot green"></span>

                        </div>

                        <strong>
                            EduManage — Quick Demo Preview
                        </strong>

                        <span class="online-badge">
                            Online
                        </span>

                    </div>


                    <div class="demo-body">

                        <div class="d-flex justify-content-between align-items-center mb-3">

                            <div>

                                <small class="text-uppercase text-muted fw-bold">
                                    Active Semester
                                </small>

                                <h5 class="fw-bold mb-0 mt-1">
                                    Autumn 2026 Registration
                                </h5>

                            </div>

                            <span class="status-open">
                                Open
                            </span>

                        </div>


                        <!-- COURSE 1 -->

                        <div class="demo-course">

                            <div class="d-flex justify-content-between">

                                <strong>
                                    CS101 — Data Structures
                                </strong>

                                <span class="seat-badge">
                                    48/60 Seats
                                </span>

                            </div>


                            <div class="progress mt-2">

                                <div class="progress-bar"
                                     style="width:80%">
                                </div>

                            </div>


                            <div class="d-flex justify-content-between mt-2">

                                <small class="text-muted">
                                    Faculty: Dr. Rajesh Joshi
                                </small>

                                <strong class="course-fee">
                                    ₹15,000
                                </strong>

                            </div>

                        </div>


                        <!-- COURSE 2 -->

                        <div class="demo-course">

                            <div class="d-flex justify-content-between">

                                <strong>
                                    IT201 — Modern Web Apps
                                </strong>

                                <span class="seat-badge warning">
                                    49/50 Seats
                                </span>

                            </div>


                            <div class="progress mt-2">

                                <div class="progress-bar warning-bar"
                                     style="width:98%">
                                </div>

                            </div>


                            <div class="d-flex justify-content-between mt-2">

                                <small class="text-muted">
                                    Faculty: Prof. Sunita Deshmukh
                                </small>

                                <strong class="course-fee">
                                    ₹12,500
                                </strong>

                            </div>

                        </div>


                        <a href="${pageContext.request.contextPath}/login"
                           class="btn btn-primary w-100 mt-2">

                            Launch Portal Now

                            <i class="bi bi-arrow-right ms-2"></i>

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ========================================================= -->
<!-- STATISTICS -->
<!-- ========================================================= -->

<section class="stats-section">

    <div class="container">

        <div class="row g-4">

            <div class="col-6 col-lg-3">

                <div class="stat-card">

                    <div class="stat-number">
                        10
                    </div>

                    <div class="stat-label">
                        TOTAL STUDENTS
                    </div>

                </div>

            </div>


            <div class="col-6 col-lg-3">

                <div class="stat-card">

                    <div class="stat-number green">
                        8
                    </div>

                    <div class="stat-label">
                        ACTIVE COURSES
                    </div>

                </div>

            </div>


            <div class="col-6 col-lg-3">

                <div class="stat-card">

                    <div class="stat-number purple">
                        5
                    </div>

                    <div class="stat-label">
                        FACULTY MEMBERS
                    </div>

                </div>

            </div>


            <div class="col-6 col-lg-3">

                <div class="stat-card">

                    <div class="stat-number dark">
                        10
                    </div>

                    <div class="stat-label">
                        ENROLLMENTS
                    </div>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ========================================================= -->
<!-- FEATURES -->
<!-- ========================================================= -->

<section id="features" class="features-section">

    <div class="container">

        <div class="section-heading">

            <span class="section-badge">
                Capabilities
            </span>

            <h2>
                Comprehensive Academic SaaS Features
            </h2>

            <p>
                Engineered for modern university operations,
                admissions, and interactive course selection.
            </p>

        </div>


        <div class="row g-4">


            <!-- FEATURE 1 -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon blue">
                        <i class="bi bi-people-fill"></i>
                    </div>

                    <h4>
                        Student Management
                    </h4>

                    <p>
                        Complete student repository with
                        multi-attribute filtering, demographic data,
                        academic records, and CSV batch exports.
                    </p>

                </div>

            </div>


            <!-- FEATURE 2 -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon green">
                        <i class="bi bi-journal-check"></i>
                    </div>

                    <h4>
                        Course Management
                    </h4>

                    <p>
                        Course catalog with real-time seat tracking,
                        syllabus details, credit assignment,
                        instructor allocation, and availability status.
                    </p>

                </div>

            </div>


            <!-- FEATURE 3 -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon yellow">
                        <i class="bi bi-cart-check"></i>
                    </div>

                    <h4>
                        Online Enrollment & Cart
                    </h4>

                    <p>
                        Interactive student registration with an
                        e-commerce-style cart, credit validation,
                        and instant seat updates.
                    </p>

                </div>

            </div>


            <!-- FEATURE 4 -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon red">
                        <i class="bi bi-person-vcard"></i>
                    </div>

                    <h4>
                        Faculty Management
                    </h4>

                    <p>
                        Instructor profiles, department hierarchy,
                        teaching assignments, and real-time class
                        rosters for registered students.
                    </p>

                </div>

            </div>


            <!-- FEATURE 5 -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon cyan">
                        <i class="bi bi-wallet2"></i>
                    </div>

                    <h4>
                        Fee Management & Receipts
                    </h4>

                    <p>
                        Simulated checkout with UPI, Card,
                        and NetBanking modes, generating printable
                        computerized receipts.
                    </p>

                </div>

            </div>


            <!-- FEATURE 6 -->

            <div class="col-md-6 col-lg-4">

                <div class="feature-card">

                    <div class="feature-icon purple">
                        <i class="bi bi-graph-up-arrow"></i>
                    </div>

                    <h4>
                        Reports & Analytics
                    </h4>

                    <p>
                        Interactive Chart.js visualizations for
                        departmental distribution, enrollment trends,
                        and financial reporting.
                    </p>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ========================================================= -->
<!-- WORKFLOW -->
<!-- ========================================================= -->

<section id="workflow" class="workflow-section">

    <div class="container">

        <div class="section-heading">

            <span class="section-badge green-badge">
                Student Workflow
            </span>

            <h2>
                How Course Enrollment Works
            </h2>

            <p>
                A smooth, transparent 6-step journey from
                course selection to printable receipt.
            </p>

        </div>


        <div class="row g-4 workflow-row">


            <div class="col-6 col-lg-2">

                <div class="workflow-step">

                    <div class="step-number">
                        1
                    </div>

                    <h5>
                        Sign In
                    </h5>

                    <p>
                        Login with your assigned credentials.
                    </p>

                </div>

            </div>


            <div class="col-6 col-lg-2">

                <div class="workflow-step">

                    <div class="step-number">
                        2
                    </div>

                    <h5>
                        Select Courses
                    </h5>

                    <p>
                        Browse subjects by department,
                        credits, and timing.
                    </p>

                </div>

            </div>


            <div class="col-6 col-lg-2">

                <div class="workflow-step">

                    <div class="step-number">
                        3
                    </div>

                    <h5>
                        Add to Cart
                    </h5>

                    <p>
                        Review credits, fees,
                        and course capacity.
                    </p>

                </div>

            </div>


            <div class="col-6 col-lg-2">

                <div class="workflow-step">

                    <div class="step-number">
                        4
                    </div>

                    <h5>
                        Enroll
                    </h5>

                    <p>
                        Confirm course selection
                        and secure your seat.
                    </p>

                </div>

            </div>


            <div class="col-6 col-lg-2">

                <div class="workflow-step">

                    <div class="step-number">
                        5
                    </div>

                    <h5>
                        Pay Fees
                    </h5>

                    <p>
                        Simulate online payment
                        via UPI or Card.
                    </p>

                </div>

            </div>


            <div class="col-6 col-lg-2">

                <div class="workflow-step">

                    <div class="step-number">
                        6
                    </div>

                    <h5>
                        Get Receipt
                    </h5>

                    <p>
                        Print your official
                        computerized receipt.
                    </p>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ========================================================= -->
<!-- COURSES -->
<!-- ========================================================= -->

<section id="courses" class="featured-section">

    <div class="container">

        <div class="section-heading">

            <span class="section-badge">
                Course Catalog
            </span>

            <h2>
                Featured Courses
            </h2>

            <p>
                Explore available courses and enroll through
                your student portal.
            </p>

        </div>


        <div class="row g-4">


            <!-- COURSE 1 -->

            <div class="col-md-6 col-lg-4">

                <div class="course-card">

                    <span class="course-code">
                        CS101
                    </span>

                    <h4>
                        Data Structures
                    </h4>

                    <p>
                        Learn arrays, linked lists, stacks,
                        queues, trees and graphs.
                    </p>

                    <div class="course-info">

                        <span>
                            <i class="bi bi-award"></i>
                            4 Credits
                        </span>

                        <span>
                            <i class="bi bi-people"></i>
                            48/60 Seats
                        </span>

                    </div>


                    <div class="course-bottom">

                        <strong>
                            ₹15,000
                        </strong>

                        <a href="${pageContext.request.contextPath}/login"
                           class="btn btn-sm btn-primary">

                            View Course

                        </a>

                    </div>

                </div>

            </div>


            <!-- COURSE 2 -->

            <div class="col-md-6 col-lg-4">

                <div class="course-card">

                    <span class="course-code green-code">
                        IT201
                    </span>

                    <h4>
                        Modern Web Applications
                    </h4>

                    <p>
                        Build modern responsive web applications
                        using current technologies.
                    </p>

                    <div class="course-info">

                        <span>
                            <i class="bi bi-award"></i>
                            4 Credits
                        </span>

                        <span>
                            <i class="bi bi-people"></i>
                            49/50 Seats
                        </span>

                    </div>


                    <div class="course-bottom">

                        <strong>
                            ₹12,500
                        </strong>

                        <a href="${pageContext.request.contextPath}/login"
                           class="btn btn-sm btn-primary">

                            View Course

                        </a>

                    </div>

                </div>

            </div>


            <!-- COURSE 3 -->

            <div class="col-md-6 col-lg-4">

                <div class="course-card">

                    <span class="course-code purple-code">
                        AI301
                    </span>

                    <h4>
                        Artificial Intelligence
                    </h4>

                    <p>
                        Explore machine learning, neural networks,
                        NLP and intelligent systems.
                    </p>

                    <div class="course-info">

                        <span>
                            <i class="bi bi-award"></i>
                            5 Credits
                        </span>

                        <span>
                            <i class="bi bi-people"></i>
                            32/50 Seats
                        </span>

                    </div>


                    <div class="course-bottom">

                        <strong>
                            ₹18,000
                        </strong>

                        <a href="${pageContext.request.contextPath}/login"
                           class="btn btn-sm btn-primary">

                            View Course

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ========================================================= -->
<!-- ABOUT + CONTACT -->
<!-- ========================================================= -->

<section id="about" class="about-section">

    <div class="container">

        <div class="row align-items-center g-5">


            <!-- ABOUT -->

            <div class="col-lg-6">

                <h2>
                    Designed for Universities,
                    Built for Performance
                </h2>

                <p class="about-text">

                    EduManage replaces legacy paper systems
                    with a cohesive, responsive digital architecture.
                    Designed with strict accessibility, instant search
                    filters, and real-time academic management.

                </p>


                <div class="about-points">

                    <div>
                        <i class="bi bi-check-circle"></i>

                        Role-segregated views for Students,
                        Faculty, and Admin

                    </div>

                    <div>
                        <i class="bi bi-check-circle"></i>

                        Comprehensive course and seat management

                    </div>

                    <div>
                        <i class="bi bi-check-circle"></i>

                        Secure MySQL-powered academic data

                    </div>

                </div>


                <a href="${pageContext.request.contextPath}/login"
                   class="btn btn-primary btn-lg mt-3">

                    Get Started Today

                </a>

            </div>


            <!-- CONTACT -->

            <div class="col-lg-6" id="contact">

                <div class="support-card">

                    <h3>
                        Academic Inquiries & Support
                    </h3>


                    <div class="support-item">

                        <div class="support-icon">
                            <i class="bi bi-geo-alt"></i>
                        </div>

                        <div>

                            <strong>
                                Office of Academic Affairs
                            </strong>

                            <p>
                                University Road, Pune,
                                Maharashtra 411007
                            </p>

                        </div>

                    </div>


                    <div class="support-item">

                        <div class="support-icon">
                            <i class="bi bi-envelope"></i>
                        </div>

                        <div>

                            <strong>
                                Email Support
                            </strong>

                            <p>
                                support@edumanage.com
                            </p>

                        </div>

                    </div>


                    <div class="support-item">

                        <div class="support-icon">
                            <i class="bi bi-telephone"></i>
                        </div>

                        <div>

                            <strong>
                                Helpline
                            </strong>

                            <p>
                                +91 (020) 2560-1234
                            </p>

                        </div>

                    </div>

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

            <div class="col-lg-5">

                <div class="footer-brand">

                    <span class="brand-icon">
                        <i class="bi bi-mortarboard-fill"></i>
                    </span>

                    <span class="brand-text">
                        Edu<span>Manage</span>
                    </span>

                </div>


                <p>

                    Modern Student Management & Course Enrollment
                    System built with Spring MVC, JSP, MySQL,
                    Bootstrap 5 and secure role-based access.

                </p>

            </div>


            <!-- PORTALS -->

            <div class="col-6 col-lg-3">

                <h6>
                    PORTALS
                </h6>

                <a href="${pageContext.request.contextPath}/login">
                    Admin Portal
                </a>

                <a href="${pageContext.request.contextPath}/login">
                    Student Portal
                </a>

                <a href="${pageContext.request.contextPath}/login">
                    Faculty Portal
                </a>

            </div>


            <!-- TECHNOLOGY -->

            <div class="col-6 col-lg-4">

                <h6>
                    TECHNOLOGY
                </h6>

                <div class="tech-tags">

                    <span>Java</span>
                    <span>Spring MVC</span>
                    <span>JSP</span>
                    <span>MySQL</span>
                    <span>Bootstrap 5</span>
                    <span>JavaScript</span>

                </div>

            </div>

        </div>


        <hr>


        <div class="footer-bottom">

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


</body>

</html>