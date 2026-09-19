package org.giritechhub.controller;

import java.util.List;

import org.giritechhub.model.Faculty;
import org.giritechhub.model.FacultyStudent;

import org.giritechhub.service.FacultyService;
import org.giritechhub.service.FacultyStudentService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FacultyStudentController {

    @Autowired
    private FacultyService facultyService;

    @Autowired
    private FacultyStudentService facultyStudentService;


    // =========================================================
    // MY STUDENTS
    // =========================================================

    @GetMapping("/faculty/students")
    public String myStudents(
            @RequestParam(
                    value = "keyword",
                    required = false
            )
            String keyword,

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
        // GET LOGGED-IN FACULTY
        // -----------------------------------------------------

        Faculty faculty =
                facultyService.getFacultyByUserId(
                        userId
                );

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
        // GET STUDENTS
        // -----------------------------------------------------

        List<FacultyStudent> students =
                facultyStudentService.searchMyStudents(
                        facultyId,
                        keyword
                );


        // -----------------------------------------------------
        // SEND DATA TO JSP
        // -----------------------------------------------------

        model.addAttribute(
                "faculty",
                faculty
        );

        model.addAttribute(
                "students",
                students
        );

        model.addAttribute(
                "keyword",
                keyword
        );


        // -----------------------------------------------------
        // OPEN STUDENTS PAGE
        // -----------------------------------------------------

        return "faculty/students";
    }


    // =========================================================
    // STUDENT DETAILS
    // =========================================================

    @GetMapping("/faculty/student")
    public String studentDetails(
            @RequestParam("id") int studentId,

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
                facultyService.getFacultyByUserId(
                        userId
                );

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


        FacultyStudent student =
                facultyStudentService
                        .getMyStudentById(
                                studentId,
                                faculty.getFacultyId()
                        );


        if (student == null) {

            return "redirect:/faculty/students";
        }


        model.addAttribute(
                "faculty",
                faculty
        );

        model.addAttribute(
                "student",
                student
        );


        return "faculty/student-details";
    }
}