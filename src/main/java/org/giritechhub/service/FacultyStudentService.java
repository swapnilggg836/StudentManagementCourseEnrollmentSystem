package org.giritechhub.service;

import java.util.List;

import org.giritechhub.model.FacultyStudent;
import org.giritechhub.repository.FacultyStudentRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FacultyStudentService {

    @Autowired
    private FacultyStudentRepository facultyStudentRepository;


    // =========================================================
    // GET ALL MY STUDENTS
    // =========================================================

    public List<FacultyStudent> getMyStudents(
            int facultyId) {

        if (facultyId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid faculty."
            );
        }

        return facultyStudentRepository.findByFacultyId(
                facultyId
        );
    }


    // =========================================================
    // SEARCH MY STUDENTS
    // =========================================================

    public List<FacultyStudent> searchMyStudents(
            int facultyId,
            String keyword) {

        if (facultyId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid faculty."
            );
        }

        if (keyword == null ||
                keyword.trim().isEmpty()) {

            return getMyStudents(facultyId);
        }

        return facultyStudentRepository
                .searchByFacultyId(
                        facultyId,
                        keyword.trim()
                );
    }


    // =========================================================
    // GET STUDENT DETAILS
    // =========================================================

    public FacultyStudent getMyStudentById(
            int studentId,
            int facultyId) {

        if (studentId <= 0 ||
                facultyId <= 0) {

            return null;
        }

        return facultyStudentRepository
                .findByStudentIdAndFacultyId(
                        studentId,
                        facultyId
                );
    }
}