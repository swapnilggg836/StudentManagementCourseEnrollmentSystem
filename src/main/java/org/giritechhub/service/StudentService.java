package org.giritechhub.service;

import java.util.List;

import org.giritechhub.model.Student;
import org.giritechhub.repository.StudentRepository;
import org.giritechhub.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private UserRepository userRepository;

    private final BCryptPasswordEncoder passwordEncoder =
            new BCryptPasswordEncoder();


    // =========================================================
    // GET ALL STUDENTS
    // =========================================================

    public List<Student> getAllStudents() {

        return studentRepository.findAll();
    }


    // =========================================================
    // GET STUDENT BY ID
    // =========================================================

    public Student getStudentById(int studentId) {

        return studentRepository.findById(studentId);
    }


    // =========================================================
    // SEARCH STUDENTS
    // =========================================================

    public List<Student> searchStudents(String keyword) {

        if (keyword == null ||
            keyword.trim().isEmpty()) {

            return getAllStudents();
        }

        return studentRepository.search(
                keyword.trim()
        );
    }


    // =========================================================
    // CHECK EMAIL
    // =========================================================

    public boolean emailExists(String email) {

        return userRepository.emailExists(email);
    }


    // =========================================================
    // ADD STUDENT
    // =========================================================

    @Transactional
    public int addStudent(
            Student student,
            String email,
            String password) {

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


        // Check duplicate email

        if (userRepository.emailExists(email)) {

            throw new IllegalArgumentException(
                    "Email already exists."
            );
        }


        // Hash password

        String passwordHash =
                passwordEncoder.encode(password);


        // Create STUDENT user account

        int userId =
                userRepository.createUser(
                        email,
                        passwordHash,
                        "STUDENT"
                );


        // Connect student with user

        student.setUserId(userId);


        // Save student

        return studentRepository.save(student);
    }


    // =========================================================
    // UPDATE STUDENT
    // =========================================================

    public boolean updateStudent(
            Student student) {

        int result =
                studentRepository.update(
                        student
                );

        return result > 0;
    }


    // =========================================================
    // DELETE STUDENT
    // =========================================================

    @Transactional
    public boolean deleteStudent(
            int studentId) {

        Student student =
                studentRepository.findById(
                        studentId
                );

        if (student == null) {
            return false;
        }


        // Delete student record first

        int result =
                studentRepository.delete(
                        studentId
                );


        // Delete associated user account

        if (result > 0) {

            deleteUser(
                    student.getUserId()
            );

            return true;
        }

        return false;
    }


    // =========================================================
    // DELETE USER ACCOUNT
    // =========================================================

    private void deleteUser(int userId) {

        userRepository.deleteById(
                userId
        );
    }

}