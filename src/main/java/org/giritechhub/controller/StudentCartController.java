package org.giritechhub.controller;

import java.util.List;

import org.giritechhub.model.Course;
import org.giritechhub.model.Student;
import org.giritechhub.service.StudentCartService;
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
public class StudentCartController {


    @Autowired
    private StudentCartService cartService;


    @Autowired
    private StudentService studentService;


    // =========================================================
    // MY CART
    // URL: /student/cart
    // =========================================================

    @GetMapping("/student/cart")
    public String cart(
            HttpServletRequest request,
            Model model) {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            return "redirect:/login";
        }


        // Remove deleted courses from session cart

        cartService.cleanCart(session);


        List<Course> courses =
                cartService.getCartCourses(session);


        double total =
                cartService.getCartTotal(session);


        model.addAttribute(
                "cartCourses",
                courses
        );


        model.addAttribute(
                "cartTotal",
                total
        );


        model.addAttribute(
                "cartCount",
                courses.size()
        );


        // -----------------------------------------------------
        // FLASH MESSAGES
        // -----------------------------------------------------

        Object successMessage =
                session.getAttribute("successMessage");

        Object errorMessage =
                session.getAttribute("errorMessage");


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


        return "student/cart";
    }


    // =========================================================
    // ADD TO CART
    //
    // URL:
    // /student/cart/add?courseId=4
    // =========================================================

    @GetMapping("/student/cart/add")
    public String addToCart(

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


        boolean added =
                cartService.addToCart(
                        session,
                        courseId
                );


        if (added) {

            session.setAttribute(
                    "successMessage",
                    "Course added to cart successfully."
            );

        } else {

            session.setAttribute(
                    "errorMessage",
                    "Course could not be added to cart. " +
                    "It may already be enrolled, full, or unavailable."
            );
        }


        return "redirect:/student/courses";
    }


    // =========================================================
    // REMOVE FROM CART
    //
    // URL:
    // /student/cart/remove?courseId=4
    // =========================================================

    @PostMapping("/student/cart/remove")
    public String removeFromCart(

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


        boolean removed =
                cartService.removeFromCart(
                        session,
                        courseId
                );


        if (removed) {

            session.setAttribute(
                    "successMessage",
                    "Course removed from cart."
            );

        } else {

            session.setAttribute(
                    "errorMessage",
                    "Course was not found in your cart."
            );
        }


        return "redirect:/student/cart";
    }


    // =========================================================
    // CLEAR CART
    // =========================================================

    @PostMapping("/student/cart/clear")
    public String clearCart(
            HttpServletRequest request) {


        HttpSession session =
                request.getSession(false);


        if (session == null ||
            session.getAttribute("userId") == null) {

            return "redirect:/login";
        }


        cartService.clearCart(session);


        session.setAttribute(
                "successMessage",
                "Cart cleared successfully."
        );


        return "redirect:/student/cart";
    }


    // =========================================================
    // PROCEED TO PAYMENT
    //
    // Cart
    //   ↓
    // Payment Form
    //   ↓
    // Successful Payment
    //   ↓
    // Enrollment
    //
    // URL:
    // /student/cart/payment
    // =========================================================

    @GetMapping("/student/cart/payment")
    public String cartPayment(
            HttpServletRequest request) {


        HttpSession session =
                request.getSession(false);


        if (session == null ||
            session.getAttribute("userId") == null) {

            return "redirect:/login";
        }


        List<Course> courses =
                cartService.getCartCourses(session);


        if (courses.isEmpty()) {

            session.setAttribute(
                    "errorMessage",
                    "Your cart is empty."
            );

            return "redirect:/student/cart";
        }


        return "redirect:/student/payment?cart=true";
    }


    // =========================================================
    // OLD CART ENROLL URL
    //
    // We keep this URL so an old JSP/button does not break.
    //
    // IMPORTANT:
    // It NO LONGER directly enrolls courses.
    //
    // It now redirects to PAYMENT.
    // =========================================================

    @PostMapping("/student/cart/enroll")
    public String enrollCart(
            HttpServletRequest request) {


        HttpSession session =
                request.getSession(false);


        if (session == null ||
            session.getAttribute("userId") == null) {

            return "redirect:/login";
        }


        List<Course> courses =
                cartService.getCartCourses(session);


        if (courses.isEmpty()) {

            session.setAttribute(
                    "errorMessage",
                    "Your cart is empty."
            );

            return "redirect:/student/cart";
        }


        return "redirect:/student/payment?cart=true";
    }

}