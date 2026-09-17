package org.giritechhub.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.giritechhub.repository.ReportRepository;
import org.springframework.stereotype.Service;

@Service
public class ReportService {

    private final ReportRepository reportRepository;

    public ReportService(ReportRepository reportRepository) {
        this.reportRepository = reportRepository;
    }


    // =========================================================
    // STUDENTS
    // =========================================================

    public List<Map<String, Object>> getStudentReport(
            Integer deptId,
            Integer semester,
            LocalDate dateFrom,
            LocalDate dateTo) {

        return reportRepository.getStudentReport(
                deptId,
                semester,
                dateFrom,
                dateTo
        );
    }


    public int getTotalStudents(
            Integer deptId,
            Integer semester) {

        return reportRepository.getTotalStudents(
                deptId,
                semester
        );
    }


    // =========================================================
    // COURSES
    // =========================================================

    public List<Map<String, Object>> getCourseReport(
            Integer deptId,
            Integer semester) {

        return reportRepository.getCourseReport(
                deptId,
                semester
        );
    }


    public int getTotalCourses(Integer deptId) {

        return reportRepository.getTotalCourses(deptId);
    }


    public int getFullCourses(Integer deptId) {

        return reportRepository.getFullCourses(deptId);
    }


    // =========================================================
    // ENROLLMENTS
    // =========================================================

    public List<Map<String, Object>> getEnrollmentReport(
            Integer deptId,
            Integer semester,
            String status,
            LocalDate dateFrom,
            LocalDate dateTo) {

        return reportRepository.getEnrollmentReport(
                deptId,
                semester,
                status,
                dateFrom,
                dateTo
        );
    }


    public int getTotalEnrollments(
            Integer deptId,
            Integer semester,
            String status,
            LocalDate dateFrom,
            LocalDate dateTo) {

        return reportRepository.getTotalEnrollments(
                deptId,
                semester,
                status,
                dateFrom,
                dateTo
        );
    }


    public int getEnrolledCount(
            Integer deptId,
            Integer semester,
            LocalDate dateFrom,
            LocalDate dateTo) {

        return reportRepository.getEnrollmentStatusCount(
                "ENROLLED",
                deptId,
                semester,
                dateFrom,
                dateTo
        );
    }


    public int getDroppedCount(
            Integer deptId,
            Integer semester,
            LocalDate dateFrom,
            LocalDate dateTo) {

        return reportRepository.getEnrollmentStatusCount(
                "DROPPED",
                deptId,
                semester,
                dateFrom,
                dateTo
        );
    }


    public int getCompletedCount(
            Integer deptId,
            Integer semester,
            LocalDate dateFrom,
            LocalDate dateTo) {

        return reportRepository.getEnrollmentStatusCount(
                "COMPLETED",
                deptId,
                semester,
                dateFrom,
                dateTo
        );
    }


    // =========================================================
    // PAYMENTS
    // =========================================================

    public List<Map<String, Object>> getPaymentReport(
            Integer semester,
            String paymentStatus,
            LocalDate dateFrom,
            LocalDate dateTo) {

        return reportRepository.getPaymentReport(
                semester,
                paymentStatus,
                dateFrom,
                dateTo
        );
    }


    public BigDecimal getPaymentRevenue(
            Integer semester,
            String paymentStatus,
            LocalDate dateFrom,
            LocalDate dateTo) {

        return reportRepository.getPaymentRevenue(
                semester,
                paymentStatus,
                dateFrom,
                dateTo
        );
    }


    public int getPaidCount(
            Integer semester,
            LocalDate dateFrom,
            LocalDate dateTo) {

        return reportRepository.getPaymentStatusCount(
                "PAID",
                semester,
                dateFrom,
                dateTo
        );
    }


    public int getPendingCount(
            Integer semester,
            LocalDate dateFrom,
            LocalDate dateTo) {

        return reportRepository.getPaymentStatusCount(
                "PENDING",
                semester,
                dateFrom,
                dateTo
        );
    }


    public int getFailedCount(
            Integer semester,
            LocalDate dateFrom,
            LocalDate dateTo) {

        return reportRepository.getPaymentStatusCount(
                "FAILED",
                semester,
                dateFrom,
                dateTo
        );
    }
}