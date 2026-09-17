package org.giritechhub.service;

import java.math.BigDecimal;
import java.util.List;

import org.giritechhub.model.Course;
import org.giritechhub.repository.CourseRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

@Service
public class CourseService {

    @Autowired
    private CourseRepository courseRepository;


    // =========================================================
    // GET ALL COURSES
    // =========================================================

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }


    // =========================================================
    // GET COURSE BY ID
    // =========================================================

    public Course getCourseById(int courseId) {

        if (courseId <= 0) {
            return null;
        }

        return courseRepository.findById(courseId);
    }


    // =========================================================
    // SEARCH COURSES
    // =========================================================

    public List<Course> searchCourses(String keyword) {

        if (keyword == null || keyword.trim().isEmpty()) {
            return getAllCourses();
        }

        return courseRepository.search(keyword.trim());
    }


    // =========================================================
    // ADD COURSE
    // =========================================================

    public int addCourse(Course course) {

        validateCourse(course);

        course.setCourseCode(
                course.getCourseCode().trim()
        );

        course.setTitle(
                course.getTitle().trim()
        );

        if (course.getDescription() != null) {
            course.setDescription(
                    course.getDescription().trim()
            );
        }

        if (course.getScheduleDay() != null) {
            course.setScheduleDay(
                    course.getScheduleDay().trim()
            );
        }

        if (course.getScheduleTime() != null) {
            course.setScheduleTime(
                    course.getScheduleTime().trim()
            );
        }

        try {

            return courseRepository.save(course);

        } catch (DataIntegrityViolationException e) {

            throw new IllegalArgumentException(
                    "Course code already exists or the selected department/faculty is invalid."
            );
        }
    }


    // =========================================================
    // UPDATE COURSE
    // =========================================================

    public boolean updateCourse(Course course) {

        if (course == null || course.getCourseId() <= 0) {
            throw new IllegalArgumentException(
                    "Invalid course."
            );
        }

        validateCourse(course);

        Course existingCourse =
                courseRepository.findById(
                        course.getCourseId()
                );

        if (existingCourse == null) {
            throw new IllegalArgumentException(
                    "Course not found."
            );
        }


        // -----------------------------------------------------
        // Do not allow capacity below current enrollment
        // -----------------------------------------------------

        if (course.getCapacity()
                < existingCourse.getEnrolledStudents()) {

            throw new IllegalArgumentException(
                    "Capacity cannot be less than currently enrolled students ("
                    + existingCourse.getEnrolledStudents()
                    + ")."
            );
        }


        course.setCourseCode(
                course.getCourseCode().trim()
        );

        course.setTitle(
                course.getTitle().trim()
        );

        if (course.getDescription() != null) {
            course.setDescription(
                    course.getDescription().trim()
            );
        }

        if (course.getScheduleDay() != null) {
            course.setScheduleDay(
                    course.getScheduleDay().trim()
            );
        }

        if (course.getScheduleTime() != null) {
            course.setScheduleTime(
                    course.getScheduleTime().trim()
            );
        }


        try {

            int result =
                    courseRepository.update(course);

            return result > 0;

        } catch (DataIntegrityViolationException e) {

            throw new IllegalArgumentException(
                    "Course code already exists or the selected department/faculty is invalid."
            );
        }
    }


    // =========================================================
    // DELETE COURSE
    // =========================================================

    public boolean deleteCourse(int courseId) {

        if (courseId <= 0) {
            return false;
        }


        Course course =
                courseRepository.findById(courseId);

        if (course == null) {
            return false;
        }


        // -----------------------------------------------------
        // Don't delete a course which has enrollments
        // -----------------------------------------------------

        if (course.getEnrolledStudents() > 0) {

            throw new IllegalStateException(
                    "This course cannot be deleted because "
                    + course.getEnrolledStudents()
                    + " student(s) are currently enrolled."
            );
        }


        try {

            int result =
                    courseRepository.delete(courseId);

            return result > 0;

        } catch (DataIntegrityViolationException e) {

            throw new IllegalStateException(
                    "Course cannot be deleted because it is being used by other records."
            );
        }
    }


    // =========================================================
    // COURSE VALIDATION
    // =========================================================

    private void validateCourse(Course course) {

        if (course == null) {

            throw new IllegalArgumentException(
                    "Course cannot be null."
            );
        }


        // -----------------------------------------------------
        // Course Code
        // -----------------------------------------------------

        if (course.getCourseCode() == null
                || course.getCourseCode().trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Course code is required."
            );
        }


        // -----------------------------------------------------
        // Course Title
        // -----------------------------------------------------

        if (course.getTitle() == null
                || course.getTitle().trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Course title is required."
            );
        }


        // -----------------------------------------------------
        // Department
        // -----------------------------------------------------

        if (course.getDeptId() <= 0) {

            throw new IllegalArgumentException(
                    "Please select a department."
            );
        }


        // -----------------------------------------------------
        // Credits
        // -----------------------------------------------------

        if (course.getCredits() <= 0) {

            throw new IllegalArgumentException(
                    "Credits must be greater than 0."
            );
        }


        // -----------------------------------------------------
        // Capacity
        // -----------------------------------------------------

        if (course.getCapacity() <= 0) {

            throw new IllegalArgumentException(
                    "Capacity must be greater than 0."
            );
        }


        // -----------------------------------------------------
        // Course Fee
        // -----------------------------------------------------

        BigDecimal fee =
                course.getFeeAmount();

        if (fee == null) {

            throw new IllegalArgumentException(
                    "Course fee is required."
            );
        }

        if (fee.compareTo(BigDecimal.ZERO) < 0) {

            throw new IllegalArgumentException(
                    "Course fee cannot be negative."
            );
        }
    }
}