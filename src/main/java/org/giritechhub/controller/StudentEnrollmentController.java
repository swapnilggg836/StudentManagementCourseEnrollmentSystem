package org.giritechhub.controller;

import java.util.List;

import org.giritechhub.model.CourseEnrollment;
import org.giritechhub.model.Student;
import org.giritechhub.service.StudentEnrollmentService;
import org.giritechhub.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentEnrollmentController {


    @Autowired
    private StudentEnrollmentService enrollmentService;


    @Autowired
    private StudentService studentService;


    // =========================================================
    // MY ENROLLMENTS
    // =========================================================

    @GetMapping("/student/enrollments")
    public String myEnrollments(
            HttpServletRequest request,
            Model model) {


        HttpSession session =
                request.getSession(false);


        if (session == null ||
            session.getAttribute("userId") == null) {

            return "redirect:/login";
        }


        int userId =
                (Integer) session.getAttribute(
                        "userId"
                );


        Student student =
                studentService.getStudentByUserId(
                        userId
                );


        if (student == null) {

            return "redirect:/student/dashboard";
        }


        List<CourseEnrollment> enrollments =
                enrollmentService.getStudentEnrollments(
                        student.getStudentId()
                );


        model.addAttribute(
                "student",
                student
        );


        model.addAttribute(
                "enrollments",
                enrollments
        );


        model.addAttribute(
                "totalEnrollments",
                enrollments.size()
        );


        // =====================================================
        // FLASH MESSAGES
        // =====================================================

        Object successMessage =
                session.getAttribute(
                        "successMessage"
                );

        Object errorMessage =
                session.getAttribute(
                        "errorMessage"
                );


        if (successMessage != null) {

            model.addAttribute(
                    "successMessage",
                    successMessage
            );

            session.removeAttribute(
                    "successMessage"
            );
        }


        if (errorMessage != null) {

            model.addAttribute(
                    "errorMessage",
                    errorMessage
            );

            session.removeAttribute(
                    "errorMessage"
            );
        }


        return "student/enrollments";
    }


    // =========================================================
    // VIEW ENROLLMENT DETAILS
    // =========================================================

    @GetMapping("/student/enrollment/view")
    public String viewEnrollment(
            @RequestParam(value = "id")
            int enrollmentId,

            HttpServletRequest request,

            Model model) {


        HttpSession session =
                request.getSession(false);


        if (session == null ||
            session.getAttribute("userId") == null) {

            return "redirect:/login";
        }


        int userId =
                (Integer) session.getAttribute(
                        "userId"
                );


        Student student =
                studentService.getStudentByUserId(
                        userId
                );


        if (student == null) {

            return "redirect:/student/dashboard";
        }


        CourseEnrollment enrollment =
                enrollmentService.getEnrollmentById(
                        enrollmentId,
                        student.getStudentId()
                );


        if (enrollment == null) {

            session.setAttribute(
                    "errorMessage",
                    "Enrollment not found."
            );

            return "redirect:/student/enrollments";
        }


        model.addAttribute(
                "student",
                student
        );


        model.addAttribute(
                "enrollment",
                enrollment
        );


        return "student/enrollment-view";
    }


    // =========================================================
    // ENROLL COURSE
    // =========================================================

    @PostMapping("/student/enrollment/enroll")
    public String enrollCourse(
            @RequestParam(value = "courseId")
            int courseId,

            HttpServletRequest request) {


        HttpSession session =
                request.getSession(false);


        if (session == null ||
            session.getAttribute("userId") == null) {

            return "redirect:/login";
        }


        int userId =
                (Integer) session.getAttribute(
                        "userId"
                );


        Student student =
                studentService.getStudentByUserId(
                        userId
                );


        if (student == null) {

            return "redirect:/login";
        }


        try {

            boolean enrolled =
                    enrollmentService.enrollStudent(
                            student.getStudentId(),
                            courseId
                    );


            if (enrolled) {

                session.setAttribute(
                        "successMessage",
                        "Course enrolled successfully."
                );

            } else {

                session.setAttribute(
                        "errorMessage",
                        "Course enrollment failed."
                );
            }


        } catch (IllegalArgumentException e) {

            session.setAttribute(
                    "errorMessage",
                    e.getMessage()
            );
        }


        return "redirect:/student/enrollments";
    }


    // =========================================================
    // DROP COURSE
    // =========================================================

    @PostMapping("/student/enrollment/drop")
    public String dropCourse(
            @RequestParam(value = "id")
            int enrollmentId,

            HttpServletRequest request) {


        HttpSession session =
                request.getSession(false);


        if (session == null ||
            session.getAttribute("userId") == null) {

            return "redirect:/login";
        }


        int userId =
                (Integer) session.getAttribute(
                        "userId"
                );


        Student student =
                studentService.getStudentByUserId(
                        userId
                );


        if (student == null) {

            return "redirect:/login";
        }


        boolean dropped =
                enrollmentService.dropEnrollment(
                        enrollmentId,
                        student.getStudentId()
                );


        if (dropped) {

            session.setAttribute(
                    "successMessage",
                    "Course dropped successfully."
            );

        } else {

            session.setAttribute(
                    "errorMessage",
                    "Course could not be dropped."
            );
        }


        return "redirect:/student/enrollments";
    }

}