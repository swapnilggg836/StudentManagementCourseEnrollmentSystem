package org.giritechhub.controller;

import java.util.List;

import org.giritechhub.model.Faculty;
import org.giritechhub.model.FacultyCourse;
import org.giritechhub.service.FacultyCourseService;
import org.giritechhub.service.FacultyService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FacultyCourseController {

    @Autowired
    private FacultyService facultyService;

    @Autowired
    private FacultyCourseService facultyCourseService;


    // =========================================================
    // MY COURSES
    // =========================================================

    @GetMapping("/faculty/courses")
    public String myCourses(
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
        // GET USER ID
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
        // CHECK FACULTY STATUS
        // -----------------------------------------------------

        if (faculty.getStatus() != null
                && !"ACTIVE".equalsIgnoreCase(
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
        // GET ASSIGNED COURSES
        // -----------------------------------------------------

        List<FacultyCourse> courses =
                facultyCourseService.getMyCourses(
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
                "courses",
                courses
        );


        // -----------------------------------------------------
        // OPEN MY COURSES PAGE
        // -----------------------------------------------------

        return "faculty/courses";
    }


    // =========================================================
    // COURSE DETAILS
    // =========================================================

    @GetMapping("/faculty/course")
    public String courseDetails(
            @RequestParam("id") int courseId,
            HttpSession session,
            Model model) {

        Object userIdObject =
                session.getAttribute("userId");

        if (userIdObject == null) {
            return "redirect:/login";
        }


        int userId;

        try {

            userId = (Integer) userIdObject;

        } catch (ClassCastException e) {

            session.invalidate();

            return "redirect:/login";
        }


        Faculty faculty =
                facultyService.getFacultyByUserId(userId);

        if (faculty == null) {

            session.invalidate();

            return "redirect:/login";
        }


        if (faculty.getStatus() != null
                && !"ACTIVE".equalsIgnoreCase(
                        faculty.getStatus().trim())) {

            session.invalidate();

            return "redirect:/login";
        }


        FacultyCourse course =
                facultyCourseService.getMyCourseById(
                        courseId,
                        faculty.getFacultyId()
                );

        if (course == null) {

            return "redirect:/faculty/courses";
        }


        model.addAttribute(
                "faculty",
                faculty
        );

        model.addAttribute(
                "course",
                course
        );


        return "faculty/course-details";
    }
}