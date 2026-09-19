package org.giritechhub.service;

import java.util.List;

import org.giritechhub.model.FacultyCourse;
import org.giritechhub.repository.FacultyCourseRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FacultyCourseService {

    @Autowired
    private FacultyCourseRepository facultyCourseRepository;


    // =========================================================
    // GET MY COURSES
    // =========================================================

    public List<FacultyCourse> getMyCourses(int facultyId) {

        if (facultyId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid faculty."
            );
        }

        return facultyCourseRepository.findByFacultyId(
                facultyId
        );
    }


    // =========================================================
    // GET COURSE DETAILS
    // =========================================================

    public FacultyCourse getMyCourseById(
            int courseId,
            int facultyId) {

        if (courseId <= 0 || facultyId <= 0) {
            return null;
        }

        return facultyCourseRepository.findByIdAndFacultyId(
                courseId,
                facultyId
        );
    }
}