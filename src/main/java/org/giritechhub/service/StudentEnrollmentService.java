package org.giritechhub.service;

import java.util.List;

import org.giritechhub.model.CourseEnrollment;
import org.giritechhub.repository.StudentEnrollmentRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StudentEnrollmentService {


    @Autowired
    private StudentEnrollmentRepository enrollmentRepository;


    // =========================================================
    // GET ALL STUDENT ENROLLMENTS
    // =========================================================

    public List<CourseEnrollment> getStudentEnrollments(
            int studentId) {

        return enrollmentRepository.findByStudentId(
                studentId
        );
    }


    // =========================================================
    // GET ONE ENROLLMENT
    // =========================================================

    public CourseEnrollment getEnrollmentById(
            int enrollmentId,
            int studentId) {

        return enrollmentRepository.findById(
                enrollmentId,
                studentId
        );
    }


    // =========================================================
    // ENROLL STUDENT
    // =========================================================

    @Transactional
    public boolean enrollStudent(
            int studentId,
            int courseId) {


        if (!enrollmentRepository.courseExists(
                courseId)) {

            throw new IllegalArgumentException(
                    "Course does not exist."
            );
        }


        if (enrollmentRepository.isAlreadyEnrolled(
                studentId,
                courseId)) {

            throw new IllegalArgumentException(
                    "You are already enrolled in this course."
            );
        }


        int availableSeats =
                enrollmentRepository.getAvailableSeats(
                        courseId
                );


        if (availableSeats <= 0) {

            throw new IllegalArgumentException(
                    "No seats are available for this course."
            );
        }


        int result =
                enrollmentRepository.save(
                        studentId,
                        courseId
                );


        return result > 0;
    }


    // =========================================================
    // DROP COURSE
    // =========================================================

    @Transactional
    public boolean dropEnrollment(
            int enrollmentId,
            int studentId) {

        int result =
                enrollmentRepository.dropEnrollment(
                        enrollmentId,
                        studentId
                );

        return result > 0;
    }

}