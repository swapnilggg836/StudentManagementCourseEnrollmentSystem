package org.giritechhub.service;

import java.util.List;

import org.giritechhub.model.StudentCourse;
import org.giritechhub.repository.StudentCourseRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentCourseService {

    @Autowired
    private StudentCourseRepository studentCourseRepository;


    // =========================================================
    // GET ALL AVAILABLE COURSES
    // =========================================================

    public List<StudentCourse> getAllCourses(int studentId) {

        return studentCourseRepository.findAll(studentId);
    }


    // =========================================================
    // SEARCH COURSES
    // =========================================================

    public List<StudentCourse> searchCourses(
            String keyword,
            int studentId) {

        if (keyword == null ||
            keyword.trim().isEmpty()) {

            return getAllCourses(studentId);
        }

        return studentCourseRepository.search(
                keyword.trim(),
                studentId
        );
    }


    // =========================================================
    // GET COURSES BY DEPARTMENT
    // =========================================================

    public List<StudentCourse> getCoursesByDepartment(
            int deptId,
            int studentId) {

        return studentCourseRepository.findByDepartment(
                deptId,
                studentId
        );
    }


    // =========================================================
    // GET COURSE BY ID
    // =========================================================

    public StudentCourse getCourseById(
            int courseId,
            int studentId) {

        return studentCourseRepository.findById(
                courseId,
                studentId
        );
    }

}