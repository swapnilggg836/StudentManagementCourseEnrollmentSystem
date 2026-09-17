package org.giritechhub.service;

import java.util.List;

import org.giritechhub.model.Faculty;
import org.giritechhub.repository.FacultyRepository;
import org.giritechhub.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FacultyService {

    @Autowired
    private FacultyRepository facultyRepository;

    @Autowired
    private UserRepository userRepository;

    private final BCryptPasswordEncoder passwordEncoder =
            new BCryptPasswordEncoder();


    // =========================================================
    // GET ALL
    // =========================================================

    public List<Faculty> getAllFaculty() {

        return facultyRepository.findAll();
    }


    // =========================================================
    // GET BY ID
    // =========================================================

    public Faculty getFacultyById(int facultyId) {

        if (facultyId <= 0) {
            return null;
        }

        return facultyRepository.findById(facultyId);
    }


    // =========================================================
    // SEARCH
    // =========================================================

    public List<Faculty> searchFaculty(String keyword) {

        if (keyword == null ||
            keyword.trim().isEmpty()) {

            return getAllFaculty();
        }

        return facultyRepository.search(
                keyword.trim()
        );
    }


    // =========================================================
    // ADD FACULTY
    // =========================================================

    @Transactional
    public int addFaculty(
            Faculty faculty,
            String email,
            String password) {

        validateFaculty(faculty);

        if (email == null ||
            email.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Email is required."
            );
        }

        if (password == null ||
            password.isEmpty()) {

            throw new IllegalArgumentException(
                    "Password is required."
            );
        }

        email = email.trim();

        if (userRepository.emailExists(email)) {

            throw new IllegalArgumentException(
                    "Email already exists."
            );
        }

        String passwordHash =
                passwordEncoder.encode(password);

        int userId =
                userRepository.createUser(
                        email,
                        passwordHash,
                        "FACULTY"
                );

        faculty.setUserId(userId);

        try {

            return facultyRepository.save(
                    faculty
            );

        } catch (DataIntegrityViolationException e) {

            throw new IllegalArgumentException(
                    "Employee code already exists or the selected department is invalid."
            );
        }
    }


    // =========================================================
    // UPDATE FACULTY
    // =========================================================

    public boolean updateFaculty(Faculty faculty) {

        if (faculty == null ||
            faculty.getFacultyId() <= 0) {

            throw new IllegalArgumentException(
                    "Invalid faculty."
            );
        }

        validateFaculty(faculty);

        Faculty existing =
                facultyRepository.findById(
                        faculty.getFacultyId()
                );

        if (existing == null) {

            throw new IllegalArgumentException(
                    "Faculty not found."
            );
        }

        try {

            int result =
                    facultyRepository.update(
                            faculty
                    );

            return result > 0;

        } catch (DataIntegrityViolationException e) {

            throw new IllegalArgumentException(
                    "Employee code already exists or the selected department is invalid."
            );
        }
    }


    // =========================================================
    // DELETE FACULTY
    // =========================================================

    @Transactional
    public boolean deleteFaculty(int facultyId) {

        Faculty faculty =
                facultyRepository.findById(
                        facultyId
                );

        if (faculty == null) {
            return false;
        }

        if (faculty.getAssignedCourses() > 0) {

            throw new IllegalStateException(
                    "This faculty cannot be deleted because "
                    + faculty.getAssignedCourses()
                    + " course(s) are assigned."
            );
        }

        try {

            int result =
                    facultyRepository.delete(
                            facultyId
                    );

            if (result > 0) {

                userRepository.deleteById(
                        faculty.getUserId()
                );

                return true;
            }

            return false;

        } catch (DataIntegrityViolationException e) {

            throw new IllegalStateException(
                    "Faculty cannot be deleted because the record is being used by other records."
            );
        }
    }


    // =========================================================
    // VALIDATION
    // =========================================================

    private void validateFaculty(Faculty faculty) {

        if (faculty == null) {

            throw new IllegalArgumentException(
                    "Faculty cannot be null."
            );
        }

        if (faculty.getEmployeeCode() == null ||
            faculty.getEmployeeCode().trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Employee code is required."
            );
        }

        if (faculty.getFirstName() == null ||
            faculty.getFirstName().trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "First name is required."
            );
        }

        if (faculty.getLastName() == null ||
            faculty.getLastName().trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Last name is required."
            );
        }

        if (faculty.getDeptId() <= 0) {

            throw new IllegalArgumentException(
                    "Please select a department."
            );
        }


        faculty.setEmployeeCode(
                faculty.getEmployeeCode().trim()
        );

        faculty.setFirstName(
                faculty.getFirstName().trim()
        );

        faculty.setLastName(
                faculty.getLastName().trim()
        );

        if (faculty.getDesignation() != null) {

            faculty.setDesignation(
                    faculty.getDesignation().trim()
            );
        }

        if (faculty.getPhone() != null) {

            faculty.setPhone(
                    faculty.getPhone().trim()
            );
        }

        if (faculty.getQualification() != null) {

            faculty.setQualification(
                    faculty.getQualification().trim()
            );
        }
    }
}