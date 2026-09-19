package org.giritechhub.controller;

import org.giritechhub.model.Faculty;
import org.giritechhub.service.FacultyService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FacultyProfileController {

    @Autowired
    private FacultyService facultyService;


    // =========================================================
    // FACULTY PROFILE
    // =========================================================

    @GetMapping("/faculty/profile")
    public String facultyProfile(
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
        // GET FACULTY
        // -----------------------------------------------------

        Faculty faculty =
                facultyService.getFacultyByUserId(userId);

        if (faculty == null) {

            session.invalidate();

            return "redirect:/login";
        }


        // -----------------------------------------------------
        // CHECK ACCOUNT STATUS
        // -----------------------------------------------------

        if (faculty.getStatus() != null
                && !"ACTIVE".equalsIgnoreCase(
                        faculty.getStatus().trim())) {

            session.invalidate();

            return "redirect:/login";
        }


        // -----------------------------------------------------
        // SEND FACULTY DATA TO JSP
        // -----------------------------------------------------

        model.addAttribute(
                "faculty",
                faculty
        );


        // -----------------------------------------------------
        // OPEN PROFILE PAGE
        // -----------------------------------------------------

        return "faculty/profile";
    }
}