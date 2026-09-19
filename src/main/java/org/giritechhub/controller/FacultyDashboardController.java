package org.giritechhub.controller;

import org.giritechhub.model.Faculty;
import org.giritechhub.model.FacultyDashboardStats;
import org.giritechhub.service.FacultyDashboardService;
import org.giritechhub.service.FacultyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class FacultyDashboardController {

    @Autowired
    private FacultyService facultyService;

    @Autowired
    private FacultyDashboardService facultyDashboardService;


    // =========================================================
    // FACULTY DASHBOARD
    // =========================================================

    @GetMapping("/faculty/dashboard")
    public String facultyDashboard(
            HttpSession session,
            Model model) {

        // -----------------------------------------------------
        // CHECK LOGIN
        // -----------------------------------------------------

        Object userIdObject =
                session.getAttribute("userId");

        if (userIdObject == null) {
            return "redirect:/login";
        }


        // -----------------------------------------------------
        // GET LOGGED-IN USER ID
        // -----------------------------------------------------

        int userId;

        try {

            userId = (Integer) userIdObject;

        } catch (ClassCastException e) {

            session.invalidate();

            return "redirect:/login";
        }


        // -----------------------------------------------------
        // GET FACULTY USING USER ID
        // -----------------------------------------------------

        Faculty faculty =
                facultyService.getFacultyByUserId(userId);

        if (faculty == null) {

            session.invalidate();

            return "redirect:/login";
        }


        // -----------------------------------------------------
        // CHECK FACULTY ACCOUNT STATUS
        // -----------------------------------------------------

        if (faculty.getStatus() != null &&
            !"ACTIVE".equalsIgnoreCase(
                    faculty.getStatus().trim())) {

            session.invalidate();

            return "redirect:/login";
        }


        // -----------------------------------------------------
        // GET FACULTY ID
        // -----------------------------------------------------

        int facultyId =
                faculty.getFacultyId();


        // -----------------------------------------------------
        // GET DASHBOARD STATISTICS
        // -----------------------------------------------------

        FacultyDashboardStats dashboardStats =
                facultyDashboardService.getDashboardStats(
                        facultyId
                );


        // -----------------------------------------------------
        // SEND DATA TO JSP
        // -----------------------------------------------------

        model.addAttribute(
                "faculty",
                faculty
        );

        model.addAttribute(
                "dashboardStats",
                dashboardStats
        );


        // -----------------------------------------------------
        // OPEN DASHBOARD JSP
        // -----------------------------------------------------

        return "faculty/dashboard";
    }
}