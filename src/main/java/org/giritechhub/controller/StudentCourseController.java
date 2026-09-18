package org.giritechhub.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.giritechhub.model.Department;
import org.giritechhub.model.Student;
import org.giritechhub.model.StudentCourse;
import org.giritechhub.service.DepartmentService;
import org.giritechhub.service.StudentCourseService;
import org.giritechhub.service.StudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentCourseController {

    @Autowired
    private StudentCourseService studentCourseService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private DepartmentService departmentService;


    // =========================================================
    // AVAILABLE COURSES
    // URL: /student/courses
    // =========================================================

    @GetMapping("/student/courses")
    public String courses(

            @RequestParam(
                    value = "keyword",
                    required = false
            )
            String keyword,

            @RequestParam(
                    value = "deptId",
                    required = false,
                    defaultValue = "0"
            )
            int deptId,

            HttpServletRequest request,

            Model model) {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            return "redirect:/login";
        }


        int userId =
                (Integer) session.getAttribute("userId");


        Student student =
                studentService.getStudentByUserId(userId);

        if (student == null) {

            return "redirect:/student/dashboard";
        }


        List<StudentCourse> courses;


        if (keyword != null &&
            !keyword.trim().isEmpty()) {

            courses =
                    studentCourseService.searchCourses(
                            keyword.trim(),
                            student.getStudentId()
                    );

        } else if (deptId > 0) {

            courses =
                    studentCourseService
                            .getCoursesByDepartment(
                                    deptId,
                                    student.getStudentId()
                            );

        } else {

            courses =
                    studentCourseService.getAllCourses(
                            student.getStudentId()
                    );
        }


        List<Department> departments =
                departmentService.getAllDepartments();


        model.addAttribute(
                "student",
                student
        );

        model.addAttribute(
                "courses",
                courses
        );

        model.addAttribute(
                "departments",
                departments
        );

        model.addAttribute(
                "keyword",
                keyword
        );

        model.addAttribute(
                "selectedDeptId",
                deptId
        );

        model.addAttribute(
                "totalCourses",
                courses == null
                        ? 0
                        : courses.size()
        );


        return "student/courses";
    }


    // =========================================================
    // COURSE DETAILS
    // URL: /student/course?id=4
    // =========================================================

    @GetMapping("/student/course")
    public String courseDetails(

            @RequestParam(
                    value = "id"
            )
            int courseId,

            HttpServletRequest request,

            Model model) {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            return "redirect:/login";
        }


        int userId =
                (Integer) session.getAttribute("userId");


        Student student =
                studentService.getStudentByUserId(userId);

        if (student == null) {

            return "redirect:/student/dashboard";
        }


        StudentCourse course =
                studentCourseService.getCourseById(
                        courseId,
                        student.getStudentId()
                );


        if (course == null) {

            return "redirect:/student/courses";
        }


        model.addAttribute(
                "student",
                student
        );

        model.addAttribute(
                "course",
                course
        );


        return "student/course-details";
    }


    // =========================================================
    // ENROLL NOW
    //
    // Available Courses / Course Details
    //        ↓
    // Payment Form
    //
    // URL:
    // /student/payment?courseId=4
    // =========================================================

    @GetMapping("/student/enroll")
    public String enrollNow(

            @RequestParam(
                    value = "courseId"
            )
            int courseId,

            HttpServletRequest request) {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            return "redirect:/login";
        }


        int userId =
                (Integer) session.getAttribute("userId");


        Student student =
                studentService.getStudentByUserId(userId);

        if (student == null) {

            return "redirect:/student/dashboard";
        }


        StudentCourse course =
                studentCourseService.getCourseById(
                        courseId,
                        student.getStudentId()
                );


        if (course == null) {

            return "redirect:/student/courses";
        }


        /*
         * Do not enroll here.
         *
         * The student must first complete
         * the payment form.
         */

        return "redirect:/student/payment?courseId="
                + courseId;
    }

}