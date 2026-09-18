package org.giritechhub.service;

import java.util.List;

import org.giritechhub.model.EnrollmentPayment;
import org.giritechhub.repository.StudentFeesRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentFeesService {

    @Autowired
    private StudentFeesRepository studentFeesRepository;

    public List<EnrollmentPayment> getStudentPayments(int studentId) {
        if (studentId <= 0) {
            throw new IllegalArgumentException("Invalid student.");
        }

        return studentFeesRepository.findByStudentId(studentId);
    }

    public double getTotalPaidAmount(int studentId) {
        if (studentId <= 0) {
            throw new IllegalArgumentException("Invalid student.");
        }

        return studentFeesRepository.getTotalPaidAmount(studentId);
    }

    public int getTotalTransactions(int studentId) {
        if (studentId <= 0) {
            throw new IllegalArgumentException("Invalid student.");
        }

        return studentFeesRepository.getTotalTransactions(studentId);
    }

    public int getSuccessfulTransactions(int studentId) {
        if (studentId <= 0) {
            throw new IllegalArgumentException("Invalid student.");
        }

        return studentFeesRepository.getSuccessfulTransactions(studentId);
    }

    public int getPendingTransactions(int studentId) {
        if (studentId <= 0) {
            throw new IllegalArgumentException("Invalid student.");
        }

        return studentFeesRepository.getPendingTransactions(studentId);
    }

    public EnrollmentPayment getPaymentById(
            int paymentId,
            int studentId) {

        if (paymentId <= 0) {
            throw new IllegalArgumentException("Invalid payment.");
        }

        if (studentId <= 0) {
            throw new IllegalArgumentException("Invalid student.");
        }

        return studentFeesRepository.findById(
                paymentId,
                studentId
        );
    }
}