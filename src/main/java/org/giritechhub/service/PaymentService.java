package org.giritechhub.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import org.giritechhub.model.EnrollmentPayment;
import org.giritechhub.repository.PaymentRepository;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {

    private final PaymentRepository paymentRepository;

    public PaymentService(PaymentRepository paymentRepository) {
        this.paymentRepository = paymentRepository;
    }


    // =========================================================
    // GET ALL PAYMENTS
    // =========================================================

    public List<EnrollmentPayment> getAllPayments() {

        return paymentRepository.findAll();
    }


    // =========================================================
    // GET PAYMENT BY ID
    // =========================================================

    public EnrollmentPayment getPaymentById(int paymentId) {

        if (paymentId <= 0) {
            return null;
        }

        return paymentRepository.findById(paymentId);
    }


    // =========================================================
    // SEARCH / FILTER PAYMENTS
    // =========================================================

    public List<EnrollmentPayment> searchPayments(
            Integer studentId,
            Integer semester,
            String paymentStatus) {

        return paymentRepository.search(
                studentId,
                semester,
                paymentStatus
        );
    }


    // =========================================================
    // CREATE SIMULATED PAYMENT
    // =========================================================

    public boolean processPayment(
            EnrollmentPayment payment) {

        if (payment == null) {
            throw new IllegalArgumentException(
                    "Payment information is required."
            );
        }


        // -----------------------------------------------------
        // Validate student
        // -----------------------------------------------------

        if (payment.getStudentId() <= 0) {

            throw new IllegalArgumentException(
                    "Please select a student."
            );
        }


        // -----------------------------------------------------
        // Validate amount
        // -----------------------------------------------------

        if (payment.getAmount() == null) {

            throw new IllegalArgumentException(
                    "Payment amount is required."
            );
        }


        if (payment.getAmount()
                .compareTo(BigDecimal.ZERO) <= 0) {

            throw new IllegalArgumentException(
                    "Payment amount must be greater than zero."
            );
        }


        // -----------------------------------------------------
        // Validate payment method
        // -----------------------------------------------------

        if (payment.getPaymentMethod() == null
                || payment.getPaymentMethod().isBlank()) {

            throw new IllegalArgumentException(
                    "Please select a payment method."
            );
        }


        String method =
                payment.getPaymentMethod()
                        .trim()
                        .toUpperCase();


        if (!method.equals("UPI")
                && !method.equals("CARD")
                && !method.equals("NETBANKING")) {

            throw new IllegalArgumentException(
                    "Invalid payment method."
            );
        }


        payment.setPaymentMethod(method);


        // -----------------------------------------------------
        // Generate transaction reference
        // -----------------------------------------------------

        String transactionRef =
                generateTransactionReference();

        payment.setTransactionRef(transactionRef);


        // -----------------------------------------------------
        // Learning project simulation
        // -----------------------------------------------------
        //
        // We are NOT connecting to a real payment gateway.
        //
        // The payment is simulated as successful and stored
        // in the database with PAID status.
        //
        // -----------------------------------------------------

        payment.setPaymentStatus("PAID");


        // -----------------------------------------------------
        // Save payment
        // -----------------------------------------------------

        int result =
                paymentRepository.save(payment);


        return result > 0;
    }


    // =========================================================
    // ADD MANUAL PAYMENT
    // =========================================================
    //
    // Useful for Admin if you want to manually record
    // PAID / PENDING / FAILED payments.
    //
    // =========================================================

    public boolean addPayment(
            EnrollmentPayment payment) {

        if (payment == null) {
            throw new IllegalArgumentException(
                    "Payment information is required."
            );
        }


        if (payment.getStudentId() <= 0) {

            throw new IllegalArgumentException(
                    "Please select a student."
            );
        }


        if (payment.getAmount() == null
                || payment.getAmount()
                    .compareTo(BigDecimal.ZERO) <= 0) {

            throw new IllegalArgumentException(
                    "Payment amount must be greater than zero."
            );
        }


        if (payment.getPaymentMethod() == null
                || payment.getPaymentMethod().isBlank()) {

            throw new IllegalArgumentException(
                    "Please select a payment method."
            );
        }


        String method =
                payment.getPaymentMethod()
                        .trim()
                        .toUpperCase();


        if (!method.equals("UPI")
                && !method.equals("CARD")
                && !method.equals("NETBANKING")) {

            throw new IllegalArgumentException(
                    "Invalid payment method."
            );
        }


        payment.setPaymentMethod(method);


        // Generate transaction reference if
        // admin did not provide one.

        if (payment.getTransactionRef() == null
                || payment.getTransactionRef().isBlank()) {

            payment.setTransactionRef(
                    generateTransactionReference()
            );
        }


        // Default status

        if (payment.getPaymentStatus() == null
                || payment.getPaymentStatus().isBlank()) {

            payment.setPaymentStatus("PENDING");
        }


        String paymentStatus =
                payment.getPaymentStatus()
                        .trim()
                        .toUpperCase();


        if (!paymentStatus.equals("PAID")
                && !paymentStatus.equals("PENDING")
                && !paymentStatus.equals("FAILED")) {

            throw new IllegalArgumentException(
                    "Invalid payment status."
            );
        }


        payment.setPaymentStatus(paymentStatus);


        // Check transaction reference

        if (paymentRepository.transactionExists(
                payment.getTransactionRef())) {

            throw new IllegalArgumentException(
                    "Transaction reference already exists."
            );
        }


        int result =
                paymentRepository.save(payment);


        return result > 0;
    }


    // =========================================================
    // UPDATE PAYMENT
    // =========================================================

    public boolean updatePayment(
            EnrollmentPayment payment) {

        if (payment == null) {

            throw new IllegalArgumentException(
                    "Payment information is required."
            );
        }


        if (payment.getPaymentId() <= 0) {

            throw new IllegalArgumentException(
                    "Invalid payment ID."
            );
        }


        if (payment.getStudentId() <= 0) {

            throw new IllegalArgumentException(
                    "Please select a student."
            );
        }


        if (payment.getAmount() == null
                || payment.getAmount()
                    .compareTo(BigDecimal.ZERO) <= 0) {

            throw new IllegalArgumentException(
                    "Payment amount must be greater than zero."
            );
        }


        if (payment.getPaymentMethod() == null
                || payment.getPaymentMethod().isBlank()) {

            throw new IllegalArgumentException(
                    "Please select a payment method."
            );
        }


        String method =
                payment.getPaymentMethod()
                        .trim()
                        .toUpperCase();


        if (!method.equals("UPI")
                && !method.equals("CARD")
                && !method.equals("NETBANKING")) {

            throw new IllegalArgumentException(
                    "Invalid payment method."
            );
        }


        payment.setPaymentMethod(method);


        if (payment.getPaymentStatus() == null
                || payment.getPaymentStatus().isBlank()) {

            payment.setPaymentStatus("PENDING");
        }


        String status =
                payment.getPaymentStatus()
                        .trim()
                        .toUpperCase();


        if (!status.equals("PAID")
                && !status.equals("PENDING")
                && !status.equals("FAILED")) {

            throw new IllegalArgumentException(
                    "Invalid payment status."
            );
        }


        payment.setPaymentStatus(status);


        int result =
                paymentRepository.update(payment);


        return result > 0;
    }


    // =========================================================
    // DELETE PAYMENT
    // =========================================================

    public boolean deletePayment(int paymentId) {

        if (paymentId <= 0) {

            throw new IllegalArgumentException(
                    "Invalid payment ID."
            );
        }


        EnrollmentPayment payment =
                paymentRepository.findById(paymentId);


        if (payment == null) {

            throw new IllegalArgumentException(
                    "Payment not found."
            );
        }


        int result =
                paymentRepository.delete(paymentId);


        return result > 0;
    }


    // =========================================================
    // STATISTICS
    // =========================================================

    public int getTotalPayments() {

        return paymentRepository.countAll();
    }


    public int getPaidCount() {

        return paymentRepository.countPaid();
    }


    public int getFailedCount() {

        return paymentRepository.countFailed();
    }


    public int getPendingCount() {

        return paymentRepository.countPending();
    }


    public BigDecimal getTotalRevenue() {

        return paymentRepository.getTotalRevenue();
    }


    // =========================================================
    // GENERATE TRANSACTION REFERENCE
    // =========================================================

    private String generateTransactionReference() {

        String transactionRef;

        do {

            String randomPart =
                    UUID.randomUUID()
                            .toString()
                            .replace("-", "")
                            .substring(0, 10)
                            .toUpperCase();

            transactionRef =
                    "EDU-"
                    + System.currentTimeMillis()
                    + "-"
                    + randomPart;

        } while (
                paymentRepository.transactionExists(
                        transactionRef
                )
        );


        return transactionRef;
    }
}