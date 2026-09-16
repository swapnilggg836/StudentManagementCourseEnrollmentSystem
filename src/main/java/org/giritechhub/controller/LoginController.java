package org.giritechhub.controller;

import org.giritechhub.model.User;
import org.giritechhub.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;


    // =====================================================
    // OPEN LOGIN PAGE
    // URL: /login
    // =====================================================

    @GetMapping("/login")
    public String loginPage() {

        return "auth/login";
    }


    // =====================================================
    // PROCESS LOGIN
    // URL: /login
    // METHOD: POST
    // =====================================================

    @PostMapping("/login")
    public String login(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            Model model) {


        // Print entered email for testing
        System.out.println("Login email: " + username);


        // Send email and password to UserService
        User user = userService.authenticate(username, password);


        // =================================================
        // LOGIN FAILED
        // =================================================

        if (user == null) {

            model.addAttribute(
                    "error",
                    "Invalid email or password"
            );

            return "auth/login";
        }


        // =================================================
        // LOGIN SUCCESSFUL
        // =================================================

        System.out.println("Login successful");
        System.out.println("User ID: " + user.getUserId());
        System.out.println("Email: " + user.getEmail());
        System.out.println("Role: " + user.getRole());
        System.out.println("Status: " + user.getStatus());


        // =================================================
        // ADMIN
        // =================================================

        if ("ADMIN".equals(user.getRole())) {

            return "redirect:/admin/dashboard";
        }


        // =================================================
        // STUDENT
        // =================================================

        if ("STUDENT".equals(user.getRole())) {

            return "redirect:/student/dashboard";
        }


        // =================================================
        // FACULTY
        // =================================================

        if ("FACULTY".equals(user.getRole())) {

            return "redirect:/faculty/dashboard";
        }


        // =================================================
        // INVALID ROLE
        // =================================================

        model.addAttribute(
                "error",
                "Invalid user role"
        );

        return "auth/login";
    }
}