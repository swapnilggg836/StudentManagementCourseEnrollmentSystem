package org.giritechhub.service;

import java.util.List;

import org.giritechhub.model.CourseEnrollment;
import org.giritechhub.repository.EnrollmentRepository;
import org.springframework.stereotype.Service;

@Service
public class EnrollmentService {

    private final EnrollmentRepository enrollmentRepository;

    public EnrollmentService(EnrollmentRepository enrollmentRepository) {
        this.enrollmentRepository = enrollmentRepository;
    }

    // =========================================================
    // GET ALL ENROLLMENTS
    // =========================================================

    public List<CourseEnrollment> getAllEnrollments() {
        return enrollmentRepository.findAll();
    }


    // =========================================================
    // GET ENROLLMENT BY ID
    // =========================================================

    public CourseEnrollment getEnrollmentById(int enrollmentId) {

        if (enrollmentId <= 0) {
            return null;
        }

        return enrollmentRepository.findById(enrollmentId);
    }


    // =========================================================
    // SEARCH / FILTER
    // =========================================================

    public List<CourseEnrollment> searchEnrollments(
            Integer studentId,
            Integer courseId,
            Integer deptId,
            Integer semester,
            String status) {

        return enrollmentRepository.search(
                studentId,
                courseId,
                deptId,
                semester,
                status
        );
    }


    // =========================================================
    // ADD ENROLLMENT
    // =========================================================

    public boolean addEnrollment(CourseEnrollment enrollment) {

        if (enrollment == null) {
            return false;
        }

        if (enrollment.getStudentId() <= 0) {
            throw new IllegalArgumentException(
                    "Please select a student."
            );
        }

        if (enrollment.getCourseId() <= 0) {
            throw new IllegalArgumentException(
                    "Please select a course."
            );
        }

        if (enrollment.getStatus() == null ||
                enrollment.getStatus().isBlank()) {

            enrollment.setStatus("ENROLLED");
        }

        /*
         * Prevent the same student from being actively
         * enrolled in the same course more than once.
         */
        if (enrollmentRepository.exists(
                enrollment.getStudentId(),
                enrollment.getCourseId())) {

            throw new IllegalArgumentException(
                    "Student is already enrolled in this course."
            );
        }

        int result =
                enrollmentRepository.save(enrollment);

        return result > 0;
    }


    // =========================================================
    // UPDATE ENROLLMENT
    // =========================================================

    public boolean updateEnrollment(
            CourseEnrollment enrollment) {

        if (enrollment == null) {
            return false;
        }

        if (enrollment.getEnrollmentId() <= 0) {
            throw new IllegalArgumentException(
                    "Invalid enrollment ID."
            );
        }

        if (enrollment.getStudentId() <= 0) {
            throw new IllegalArgumentException(
                    "Please select a student."
            );
        }

        if (enrollment.getCourseId() <= 0) {
            throw new IllegalArgumentException(
                    "Please select a course."
            );
        }

        if (enrollment.getStatus() == null ||
                enrollment.getStatus().isBlank()) {

            enrollment.setStatus("ENROLLED");
        }

        int result =
                enrollmentRepository.update(enrollment);

        return result > 0;
    }


    // =========================================================
    // DROP ENROLLMENT
    // =========================================================

    public boolean dropEnrollment(int enrollmentId) {

        if (enrollmentId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid enrollment ID."
            );
        }

        CourseEnrollment enrollment =
                enrollmentRepository.findById(enrollmentId);

        if (enrollment == null) {
            throw new IllegalArgumentException(
                    "Enrollment not found."
            );
        }

        if ("DROPPED".equals(enrollment.getStatus())) {
            throw new IllegalArgumentException(
                    "Enrollment is already dropped."
            );
        }

        if ("COMPLETED".equals(enrollment.getStatus())) {
            throw new IllegalArgumentException(
                    "Completed enrollment cannot be dropped."
            );
        }

        int result =
                enrollmentRepository.drop(enrollmentId);

        return result > 0;
    }


    // =========================================================
    // MARK COMPLETED
    // =========================================================

    public boolean completeEnrollment(
            int enrollmentId,
            String grade) {

        if (enrollmentId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid enrollment ID."
            );
        }

        CourseEnrollment enrollment =
                enrollmentRepository.findById(enrollmentId);

        if (enrollment == null) {
            throw new IllegalArgumentException(
                    "Enrollment not found."
            );
        }

        if ("DROPPED".equals(enrollment.getStatus())) {
            throw new IllegalArgumentException(
                    "Dropped enrollment cannot be completed."
            );
        }

        if ("COMPLETED".equals(enrollment.getStatus())) {
            throw new IllegalArgumentException(
                    "Enrollment is already completed."
            );
        }

        if (grade != null) {
            grade = grade.trim();
        }

        int result =
                enrollmentRepository.complete(
                        enrollmentId,
                        grade
                );

        return result > 0;
    }


    // =========================================================
    // DELETE ENROLLMENT
    // =========================================================

    public boolean deleteEnrollment(int enrollmentId) {

        if (enrollmentId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid enrollment ID."
            );
        }

        CourseEnrollment enrollment =
                enrollmentRepository.findById(enrollmentId);

        if (enrollment == null) {
            throw new IllegalArgumentException(
                    "Enrollment not found."
            );
        }

        int result =
                enrollmentRepository.delete(enrollmentId);

        return result > 0;
    }


    // =========================================================
    // DASHBOARD STATISTICS
    // =========================================================

    public int getTotalEnrollments() {
        return enrollmentRepository.countAll();
    }

    public int getEnrolledCount() {
        return enrollmentRepository.countByStatus(
                "ENROLLED"
        );
    }

    public int getDroppedCount() {
        return enrollmentRepository.countByStatus(
                "DROPPED"
        );
    }

    public int getCompletedCount() {
        return enrollmentRepository.countByStatus(
                "COMPLETED"
        );
    }
}