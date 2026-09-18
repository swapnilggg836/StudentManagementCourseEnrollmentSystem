package org.giritechhub.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import org.giritechhub.model.Course;
import org.giritechhub.model.EnrollmentPayment;
import org.giritechhub.repository.PaymentRepository;
import org.giritechhub.repository.StudentEnrollmentRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StudentPaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private StudentEnrollmentRepository enrollmentRepository;


    // =========================================================
    // PROCESS CART / COURSE PAYMENT
    //
    // FLOW:
    //
    // 1. Validate student
    // 2. Validate courses
    // 3. Validate amount
    // 4. Validate payment method
    // 5. Check course exists
    // 6. Check duplicate enrollment
    // 7. Check available seats
    // 8. Create PAID payment
    // 9. Create enrollment(s)
    // 10. Return success
    //
    // IMPORTANT:
    // Payment + Enrollment are ONE TRANSACTION.
    //
    // If enrollment fails, payment is also rolled back.
    // =========================================================

    @Transactional
    public boolean processCartPayment(
            int studentId,
            List<Course> courses,
            BigDecimal amount,
            String paymentMethod) {


        // =====================================================
        // VALIDATE STUDENT
        // =====================================================

        if (studentId <= 0) {

            throw new IllegalArgumentException(
                    "Invalid student."
            );
        }


        // =====================================================
        // VALIDATE COURSES
        // =====================================================

        if (courses == null || courses.isEmpty()) {

            throw new IllegalArgumentException(
                    "No courses selected for payment."
            );
        }


        // =====================================================
        // VALIDATE AMOUNT
        // =====================================================

        if (amount == null) {

            throw new IllegalArgumentException(
                    "Payment amount is required."
            );
        }

        if (amount.compareTo(BigDecimal.ZERO) <= 0) {

            throw new IllegalArgumentException(
                    "Payment amount must be greater than zero."
            );
        }


        // =====================================================
        // VALIDATE PAYMENT METHOD
        // =====================================================

        if (paymentMethod == null
                || paymentMethod.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Please select a payment method."
            );
        }


        paymentMethod =
                paymentMethod.trim().toUpperCase();


        if (!paymentMethod.equals("UPI")
                && !paymentMethod.equals("CARD")
                && !paymentMethod.equals("NETBANKING")) {

            throw new IllegalArgumentException(
                    "Invalid payment method."
            );
        }


        // =====================================================
        // CHECK ALL COURSES BEFORE CREATING PAYMENT
        // =====================================================
        //
        // We validate EVERYTHING first.
        //
        // This prevents:
        //
        // Course 1 -> okay
        // Course 2 -> okay
        // Course 3 -> no seats
        //
        // from creating a payment before discovering
        // the problem.
        //
        // =====================================================

        for (Course course : courses) {

            if (course == null) {

                throw new IllegalArgumentException(
                        "Invalid course in cart."
                );
            }


            int courseId =
                    course.getCourseId();


            // -------------------------------------------------
            // COURSE EXISTS
            // -------------------------------------------------

            if (!enrollmentRepository.courseExists(courseId)) {

                throw new IllegalArgumentException(
                        "Course no longer exists: "
                        + course.getTitle()
                );
            }


            // -------------------------------------------------
            // CHECK ALREADY ENROLLED
            // -------------------------------------------------

            if (enrollmentRepository.isAlreadyEnrolled(
                    studentId,
                    courseId)) {

                throw new IllegalArgumentException(
                        "You are already enrolled in: "
                        + course.getTitle()
                );
            }


            // -------------------------------------------------
            // CHECK AVAILABLE SEATS
            // -------------------------------------------------

            int availableSeats =
                    enrollmentRepository.getAvailableSeats(
                            courseId
                    );


            if (availableSeats <= 0) {

                throw new IllegalArgumentException(
                        "No seats available for: "
                        + course.getTitle()
                );
            }
        }


        // =====================================================
        // GENERATE TRANSACTION REFERENCE
        // =====================================================

        String transactionRef =
                generateTransactionReference();


        // =====================================================
        // CREATE PAYMENT OBJECT
        // =====================================================

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


        // =====================================================
        // SIMULATED PAYMENT SUCCESS
        // =====================================================
        //
        // This is a college-project payment simulation.
        //
        // No real UPI/Card/Bank gateway is connected.
        //
        // Clicking Proceed to Payment means payment succeeds.
        //
        // =====================================================

        payment.setPaymentStatus(
                "PAID"
        );


        // =====================================================
        // SAVE PAYMENT
        // =====================================================

        int paymentResult =
                paymentRepository.save(payment);


        if (paymentResult <= 0) {

            throw new IllegalArgumentException(
                    "Payment could not be created."
            );
        }


        // =====================================================
        // CREATE ENROLLMENT FOR EVERY COURSE
        // =====================================================

        for (Course course : courses) {

            int courseId =
                    course.getCourseId();


            int enrollmentResult =
                    enrollmentRepository.save(
                            studentId,
                            courseId
                    );


            if (enrollmentResult <= 0) {

                throw new IllegalArgumentException(
                        "Enrollment could not be created for: "
                        + course.getTitle()
                );
            }
        }


        // =====================================================
        // SUCCESS
        // =====================================================

        return true;
    }


    // =========================================================
    // GENERATE UNIQUE TRANSACTION REFERENCE
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