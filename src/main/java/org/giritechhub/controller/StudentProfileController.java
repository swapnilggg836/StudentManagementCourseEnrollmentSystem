package org.giritechhub.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.giritechhub.model.Student;
import org.giritechhub.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudentProfileController {

    @Autowired
    private StudentService studentService;

    @GetMapping("/student/profile")
    public String profile(HttpServletRequest request, Model model) {

        HttpSession session = request.getSession(false);

        // Student must be logged in
        if (session == null || session.getAttribute("userId") == null) {
            return "redirect:/login";
        }

        int userId = (Integer) session.getAttribute("userId");

        // Get logged-in student's profile
        Student student = studentService.getStudentByUserId(userId);

        if (student == null) {
            return "redirect:/student/dashboard";
        }

        model.addAttribute("student", student);

        return "student/profile";
    }
}