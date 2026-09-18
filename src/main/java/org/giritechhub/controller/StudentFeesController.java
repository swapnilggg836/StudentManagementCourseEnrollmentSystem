package org.giritechhub.controller;

import java.util.List;

import org.giritechhub.model.EnrollmentPayment;
import org.giritechhub.model.Student;
import org.giritechhub.service.StudentFeesService;
import org.giritechhub.service.StudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentFeesController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private StudentFeesService studentFeesService;

    @GetMapping("/student/fees")
    public String studentFees(
            HttpSession session,
            Model model) {

        Object userIdObject = session.getAttribute("userId");

        if (userIdObject == null) {
            return "redirect:/login";
        }

        int userId = (Integer) userIdObject;

        Student student =
                studentService.getStudentByUserId(userId);

        if (student == null) {
            return "redirect:/student/dashboard";
        }

        int studentId = student.getStudentId();

        List<EnrollmentPayment> payments =
                studentFeesService.getStudentPayments(studentId);

        double totalPaid =
                studentFeesService.getTotalPaidAmount(studentId);

        int totalTransactions =
                studentFeesService.getTotalTransactions(studentId);

        int successfulTransactions =
                studentFeesService.getSuccessfulTransactions(studentId);

        int pendingTransactions =
                studentFeesService.getPendingTransactions(studentId);

        model.addAttribute("student", student);
        model.addAttribute("payments", payments);
        model.addAttribute("totalPaid", totalPaid);
        model.addAttribute("totalTransactions", totalTransactions);
        model.addAttribute(
                "successfulTransactions",
                successfulTransactions
        );
        model.addAttribute(
                "pendingTransactions",
                pendingTransactions
        );

        return "student/fees";
    }

    @GetMapping("/student/fees/view")
    public String paymentDetails(
            @RequestParam("id") int paymentId,
            HttpSession session,
            Model model) {

        Object userIdObject = session.getAttribute("userId");

        if (userIdObject == null) {
            return "redirect:/login";
        }

        int userId = (Integer) userIdObject;

        Student student =
                studentService.getStudentByUserId(userId);

        if (student == null) {
            return "redirect:/student/dashboard";
        }

        EnrollmentPayment payment =
                studentFeesService.getPaymentById(
                        paymentId,
                        student.getStudentId()
                );

        if (payment == null) {
            return "redirect:/student/fees";
        }

        model.addAttribute("student", student);
        model.addAttribute("payment", payment);

        return "student/payment-details";
    }
}