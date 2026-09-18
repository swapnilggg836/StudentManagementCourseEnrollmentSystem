package org.giritechhub.controller;

import java.math.BigDecimal;
import java.util.List;

import org.giritechhub.model.Course;
import org.giritechhub.model.Student;
import org.giritechhub.repository.CourseRepository;
import org.giritechhub.service.StudentCartService;
import org.giritechhub.service.StudentPaymentService;
import org.giritechhub.service.StudentService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class StudentPaymentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private StudentCartService cartService;

    @Autowired
    private StudentPaymentService studentPaymentService;

    @Autowired
    private CourseRepository courseRepository;


    // =========================================================
    // PAYMENT PAGE
    // =========================================================
    //
    // CART PAYMENT:
    // /student/payment?cart=true
    //
    // DIRECT COURSE PAYMENT:
    // /student/payment?courseId=4
    //
    // =========================================================

    @GetMapping("/student/payment")
    public String paymentPage(
            @RequestParam(value = "cart", required = false, defaultValue = "false")
            boolean cart,

            @RequestParam(value = "courseId", required = false)
            Integer courseId,

            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes) {


        // =====================================================
        // CHECK LOGIN
        // =====================================================

        Object userIdObject =
                session.getAttribute("userId");

        if (userIdObject == null) {

            return "redirect:/login";
        }


        int userId =
                (Integer) userIdObject;


        // =====================================================
        // GET STUDENT
        // =====================================================

        Student student =
                studentService.getStudentByUserId(userId);


        if (student == null) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Student profile not found."
            );

            return "redirect:/student/dashboard";
        }


        model.addAttribute(
                "student",
                student
        );


        // =====================================================
        // CART PAYMENT
        // =====================================================

        if (cart) {

            List<Course> courses =
                    cartService.getCartCourses(session);


            if (courses == null || courses.isEmpty()) {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Your cart is empty."
                );

                return "redirect:/student/cart";
            }


            BigDecimal total =
                    BigDecimal.ZERO;


            for (Course course : courses) {

                if (course.getFeeAmount() != null) {

                    total =
                            total.add(
                                    course.getFeeAmount()
                            );
                }
            }


            model.addAttribute(
                    "paymentCourses",
                    courses
            );

            model.addAttribute(
                    "paymentAmount",
                    total
            );

            model.addAttribute(
                    "paymentType",
                    "CART"
            );

            model.addAttribute(
                    "courseId",
                    null
            );


            return "student/payment";
        }


        // =====================================================
        // DIRECT COURSE PAYMENT
        // =====================================================

        if (courseId != null && courseId > 0) {

            Course course =
                    courseRepository.findById(courseId);


            if (course == null) {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Course not found."
                );

                return "redirect:/student/courses";
            }


            // -------------------------------------------------
            // CHECK AVAILABLE SEATS
            // -------------------------------------------------

            if (course.getAvailableSeats() <= 0) {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "No seats are available for this course."
                );

                return "redirect:/student/course?id=" + courseId;
            }


            // -------------------------------------------------
            // CREATE SINGLE COURSE LIST
            // -------------------------------------------------

            List<Course> courses =
                    List.of(course);


            BigDecimal amount =
                    course.getFeeAmount();


            if (amount == null) {

                amount =
                        BigDecimal.ZERO;
            }


            model.addAttribute(
                    "paymentCourses",
                    courses
            );

            model.addAttribute(
                    "paymentAmount",
                    amount
            );

            model.addAttribute(
                    "paymentType",
                    "COURSE"
            );

            model.addAttribute(
                    "courseId",
                    courseId
            );


            return "student/payment";
        }


        // =====================================================
        // NO PAYMENT TYPE
        // =====================================================

        redirectAttributes.addFlashAttribute(
                "error",
                "No course or cart selected for payment."
        );

        return "redirect:/student/courses";
    }


    // =========================================================
    // PROCESS PAYMENT
    // =========================================================

    @PostMapping("/student/payment/process")
    public String processPayment(

            @RequestParam("paymentMethod")
            String paymentMethod,

            @RequestParam("paymentType")
            String paymentType,

            @RequestParam(value = "courseId", required = false)
            Integer courseId,

            HttpSession session,
            RedirectAttributes redirectAttributes) {


        // =====================================================
        // CHECK LOGIN
        // =====================================================

        Object userIdObject =
                session.getAttribute("userId");

        if (userIdObject == null) {

            return "redirect:/login";
        }


        int userId =
                (Integer) userIdObject;


        // =====================================================
        // GET STUDENT
        // =====================================================

        Student student =
                studentService.getStudentByUserId(userId);


        if (student == null) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Student profile not found."
            );

            return "redirect:/student/dashboard";
        }


        int studentId =
                student.getStudentId();


        try {

            // =================================================
            // CART PAYMENT
            // =================================================

            if ("CART".equalsIgnoreCase(paymentType)) {

                List<Course> courses =
                        cartService.getCartCourses(session);


                if (courses == null || courses.isEmpty()) {

                    throw new IllegalArgumentException(
                            "Your cart is empty."
                    );
                }


                // ---------------------------------------------
                // CALCULATE ACTUAL TOTAL FROM DATABASE COURSES
                // ---------------------------------------------

                BigDecimal amount =
                        BigDecimal.ZERO;


                for (Course course : courses) {

                    Course latestCourse =
                            courseRepository.findById(
                                    course.getCourseId()
                            );


                    if (latestCourse == null) {

                        throw new IllegalArgumentException(
                                "Course no longer exists."
                        );
                    }


                    if (latestCourse.getFeeAmount() != null) {

                        amount =
                                amount.add(
                                        latestCourse.getFeeAmount()
                                );
                    }
                }


                // ---------------------------------------------
                // PROCESS PAYMENT
                // ---------------------------------------------

                boolean success =
                        studentPaymentService.processCartPayment(
                                studentId,
                                courses,
                                amount,
                                paymentMethod
                        );


                if (!success) {

                    throw new IllegalArgumentException(
                            "Payment failed."
                    );
                }


                // ---------------------------------------------
                // REMOVE COURSES FROM CART
                // ---------------------------------------------

                cartService.clearCart(session);


                redirectAttributes.addFlashAttribute(
                        "success",
                        "Payment successful! You are now enrolled in the selected courses."
                );


                return "redirect:/student/enrollments";
            }


            // =================================================
            // DIRECT COURSE PAYMENT
            // =================================================

            if ("COURSE".equalsIgnoreCase(paymentType)) {

                if (courseId == null || courseId <= 0) {

                    throw new IllegalArgumentException(
                            "Invalid course."
                    );
                }


                Course course =
                        courseRepository.findById(courseId);


                if (course == null) {

                    throw new IllegalArgumentException(
                            "Course not found."
                    );
                }


                // ---------------------------------------------
                // PROCESS SINGLE COURSE PAYMENT
                // ---------------------------------------------
                //
                // StudentPaymentService accepts List<Course>,
                // so create a list containing this one course.
                //
                // ---------------------------------------------

                List<Course> courses =
                        List.of(course);


                BigDecimal amount =
                        course.getFeeAmount();


                if (amount == null) {

                    throw new IllegalArgumentException(
                            "Course fee is not available."
                    );
                }


                boolean success =
                        studentPaymentService.processCartPayment(
                                studentId,
                                courses,
                                amount,
                                paymentMethod
                        );


                if (!success) {

                    throw new IllegalArgumentException(
                            "Payment failed."
                    );
                }


                // ---------------------------------------------
                // REMOVE FROM CART IF IT WAS ALSO THERE
                // ---------------------------------------------

                cartService.removeCourseAfterEnrollment(
                        session,
                        courseId
                );


                redirectAttributes.addFlashAttribute(
                        "success",
                        "Payment successful! You are now enrolled in "
                                + course.getTitle() + "."
                );


                return "redirect:/student/enrollments";
            }


            // =================================================
            // INVALID PAYMENT TYPE
            // =================================================

            throw new IllegalArgumentException(
                    "Invalid payment request."
            );


        } catch (IllegalArgumentException e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );


            // Return user to the correct page

            if ("COURSE".equalsIgnoreCase(paymentType)
                    && courseId != null) {

                return "redirect:/student/payment?courseId="
                        + courseId;
            }


            return "redirect:/student/payment?cart=true";
        }
    }
}