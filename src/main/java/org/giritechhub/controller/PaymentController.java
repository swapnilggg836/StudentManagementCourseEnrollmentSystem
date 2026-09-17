package org.giritechhub.controller;

import java.math.BigDecimal;
import java.util.List;

import org.giritechhub.model.EnrollmentPayment;
import org.giritechhub.service.PaymentService;
import org.giritechhub.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/payments")
public class PaymentController {

    private final PaymentService paymentService;
    private final StudentService studentService;

    public PaymentController(
            PaymentService paymentService,
            StudentService studentService) {

        this.paymentService = paymentService;
        this.studentService = studentService;
    }


    // =========================================================
    // PAYMENT LIST
    // GET /admin/payments
    // =========================================================

    @GetMapping
    public String payments(

            @RequestParam(
                    value = "studentId",
                    required = false
            )
            Integer studentId,

            @RequestParam(
                    value = "semester",
                    required = false
            )
            Integer semester,

            @RequestParam(
                    value = "status",
                    required = false
            )
            String status,

            Model model) {

        List<EnrollmentPayment> payments;

        boolean hasFilter =
                studentId != null
                || semester != null
                || (status != null && !status.isBlank());


        // =====================================================
        // GET PAYMENTS
        // =====================================================

        if (hasFilter) {

            payments =
                    paymentService.searchPayments(
                            studentId,
                            semester,
                            status
                    );

        } else {

            payments =
                    paymentService.getAllPayments();
        }


        // =====================================================
        // PAYMENT TABLE
        // =====================================================

        model.addAttribute(
                "payments",
                payments
        );


        // =====================================================
        // STUDENT DROPDOWN
        // =====================================================

        model.addAttribute(
                "students",
                studentService.getAllStudents()
        );


        // =====================================================
        // PAYMENT STATISTICS
        // =====================================================

        model.addAttribute(
                "totalPayments",
                paymentService.getTotalPayments()
        );

        model.addAttribute(
                "paidCount",
                paymentService.getPaidCount()
        );

        model.addAttribute(
                "failedCount",
                paymentService.getFailedCount()
        );

        model.addAttribute(
                "pendingCount",
                paymentService.getPendingCount()
        );

        model.addAttribute(
                "totalRevenue",
                paymentService.getTotalRevenue()
        );


        // =====================================================
        // PRESERVE FILTERS
        // =====================================================

        model.addAttribute(
                "selectedStudentId",
                studentId
        );

        model.addAttribute(
                "selectedSemester",
                semester
        );

        model.addAttribute(
                "selectedStatus",
                status
        );


        return "admin/payments";
    }


    // =========================================================
    // VIEW PAYMENT
    // GET /admin/payments/view?id=1
    // =========================================================

    @GetMapping("/view")
    public String viewPayment(

            @RequestParam(
                    value = "id"
            )
            int id,

            Model model,

            RedirectAttributes redirectAttributes) {

        try {

            EnrollmentPayment payment =
                    paymentService.getPaymentById(id);


            if (payment == null) {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Payment not found."
                );

                return "redirect:/admin/payments";
            }


            model.addAttribute(
                    "payment",
                    payment
            );


            return "admin/payment-view";


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Unable to load payment."
            );

            return "redirect:/admin/payments";
        }
    }


    // =========================================================
    // ADD PAYMENT PAGE
    // GET /admin/payments/add
    // =========================================================

    @GetMapping("/add")
    public String addPayment(Model model) {

        model.addAttribute(
                "payment",
                new EnrollmentPayment()
        );


        model.addAttribute(
                "students",
                studentService.getAllStudents()
        );


        return "admin/payment-form";
    }


    // =========================================================
    // PROCESS SIMULATED PAYMENT
    // POST /admin/payments/process
    // =========================================================

    @PostMapping("/process")
    public String processPayment(

            @RequestParam(
                    value = "studentId"
            )
            int studentId,

            @RequestParam(
                    value = "amount"
            )
            BigDecimal amount,

            @RequestParam(
                    value = "paymentMethod"
            )
            String paymentMethod,

            RedirectAttributes redirectAttributes) {

        try {

            EnrollmentPayment payment =
                    new EnrollmentPayment();


            payment.setStudentId(
                    studentId
            );


            payment.setAmount(
                    amount
            );


            payment.setPaymentMethod(
                    paymentMethod
            );


            boolean processed =
                    paymentService.processPayment(
                            payment
                    );


            if (processed) {

                redirectAttributes.addFlashAttribute(
                        "success",
                        "Payment processed successfully. "
                        + "Transaction Reference: "
                        + payment.getTransactionRef()
                );

            } else {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Payment could not be processed."
                );
            }


        } catch (IllegalArgumentException e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Error while processing payment: "
                    + e.getMessage()
            );
        }


        return "redirect:/admin/payments";
    }


    // =========================================================
    // SAVE MANUAL PAYMENT
    // POST /admin/payments/save
    // =========================================================

    @PostMapping("/save")
    public String savePayment(

            @RequestParam(
                    value = "studentId"
            )
            int studentId,

            @RequestParam(
                    value = "transactionRef",
                    required = false
            )
            String transactionRef,

            @RequestParam(
                    value = "amount"
            )
            BigDecimal amount,

            @RequestParam(
                    value = "paymentMethod"
            )
            String paymentMethod,

            @RequestParam(
                    value = "paymentStatus",
                    required = false,
                    defaultValue = "PENDING"
            )
            String paymentStatus,

            RedirectAttributes redirectAttributes) {

        try {

            EnrollmentPayment payment =
                    new EnrollmentPayment();


            payment.setStudentId(
                    studentId
            );


            payment.setTransactionRef(
                    transactionRef
            );


            payment.setAmount(
                    amount
            );


            payment.setPaymentMethod(
                    paymentMethod
            );


            payment.setPaymentStatus(
                    paymentStatus
            );


            boolean saved =
                    paymentService.addPayment(
                            payment
                    );


            if (saved) {

                redirectAttributes.addFlashAttribute(
                        "success",
                        "Payment added successfully."
                );

            } else {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Payment could not be added."
                );
            }


        } catch (IllegalArgumentException e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Error while adding payment: "
                    + e.getMessage()
            );
        }


        return "redirect:/admin/payments";
    }


    // =========================================================
    // EDIT PAYMENT PAGE
    // GET /admin/payments/edit?id=1
    // =========================================================

    @GetMapping("/edit")
    public String editPayment(

            @RequestParam(
                    value = "id"
            )
            int id,

            Model model,

            RedirectAttributes redirectAttributes) {

        try {

            EnrollmentPayment payment =
                    paymentService.getPaymentById(id);


            if (payment == null) {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Payment not found."
                );

                return "redirect:/admin/payments";
            }


            model.addAttribute(
                    "payment",
                    payment
            );


            model.addAttribute(
                    "students",
                    studentService.getAllStudents()
            );


            return "admin/payment-form";


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Unable to load payment."
            );

            return "redirect:/admin/payments";
        }
    }


    // =========================================================
    // UPDATE PAYMENT
    // POST /admin/payments/update
    // =========================================================

    @PostMapping("/update")
    public String updatePayment(

            @RequestParam(
                    value = "paymentId"
            )
            int paymentId,

            @RequestParam(
                    value = "studentId"
            )
            int studentId,

            @RequestParam(
                    value = "transactionRef"
            )
            String transactionRef,

            @RequestParam(
                    value = "amount"
            )
            BigDecimal amount,

            @RequestParam(
                    value = "paymentMethod"
            )
            String paymentMethod,

            @RequestParam(
                    value = "paymentStatus"
            )
            String paymentStatus,

            RedirectAttributes redirectAttributes) {

        try {

            EnrollmentPayment payment =
                    new EnrollmentPayment();


            payment.setPaymentId(
                    paymentId
            );


            payment.setStudentId(
                    studentId
            );


            payment.setTransactionRef(
                    transactionRef
            );


            payment.setAmount(
                    amount
            );


            payment.setPaymentMethod(
                    paymentMethod
            );


            payment.setPaymentStatus(
                    paymentStatus
            );


            boolean updated =
                    paymentService.updatePayment(
                            payment
                    );


            if (updated) {

                redirectAttributes.addFlashAttribute(
                        "success",
                        "Payment updated successfully."
                );

            } else {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Payment could not be updated."
                );
            }


        } catch (IllegalArgumentException e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Error while updating payment: "
                    + e.getMessage()
            );
        }


        return "redirect:/admin/payments";
    }


    // =========================================================
    // DELETE PAYMENT
    // POST /admin/payments/delete
    // =========================================================

    @PostMapping("/delete")
    public String deletePayment(

            @RequestParam(
                    value = "id"
            )
            int id,

            RedirectAttributes redirectAttributes) {

        try {

            boolean deleted =
                    paymentService.deletePayment(id);


            if (deleted) {

                redirectAttributes.addFlashAttribute(
                        "success",
                        "Payment deleted successfully."
                );

            } else {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Payment could not be deleted."
                );
            }


        } catch (IllegalArgumentException e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Error while deleting payment."
            );
        }


        return "redirect:/admin/payments";
    }
}