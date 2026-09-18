package org.giritechhub.controller;

import java.util.List;

import org.giritechhub.model.StudentDashboardStats;
import org.giritechhub.model.StudentUpcomingClass;
import org.giritechhub.service.StudentDashboardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentDashboardController {

    @Autowired
    private StudentDashboardService dashboardService;


    // =========================================================
    // STUDENT DASHBOARD
    // URL:
    // /student/dashboard
    // =========================================================

    @GetMapping("/student/dashboard")
    public String dashboard(
            HttpSession session,
            Model model) {


        // -----------------------------------------------------
        // GET LOGGED-IN USER ID
        // -----------------------------------------------------

        Object userIdObject =
                session.getAttribute("userId");


        // -----------------------------------------------------
        // SESSION NOT AVAILABLE
        // -----------------------------------------------------

        if (userIdObject == null) {

            model.addAttribute(
                    "error",
                    "Please login to access the student dashboard."
            );

            return "redirect:/login";
        }


        int userId =
                ((Number) userIdObject).intValue();


        // -----------------------------------------------------
        // GET STUDENT DASHBOARD DATA
        // -----------------------------------------------------

        StudentDashboardStats stats =
                dashboardService.getDashboardStats(
                        userId
                );


        // -----------------------------------------------------
        // STUDENT RECORD NOT FOUND
        // -----------------------------------------------------

        if (stats == null) {

            model.addAttribute(
                    "error",
                    "Student profile was not found."
            );

            return "redirect:/login";
        }


        // -----------------------------------------------------
        // UPCOMING CLASSES
        // -----------------------------------------------------

        List<StudentUpcomingClass> upcomingClasses =
                dashboardService.getUpcomingClasses(
                        stats.getStudentId()
                );


        // -----------------------------------------------------
        // SEND DATA TO JSP
        // -----------------------------------------------------

        model.addAttribute(
                "student",
                stats
        );

        model.addAttribute(
                "upcomingClasses",
                upcomingClasses
        );


        return "student/dashboard";
    }
}