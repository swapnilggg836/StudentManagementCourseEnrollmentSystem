package org.giritechhub.service;

import org.giritechhub.model.User;
import org.giritechhub.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    private final BCryptPasswordEncoder passwordEncoder =
            new BCryptPasswordEncoder();


    // =========================================================
    // AUTHENTICATE USER
    // =========================================================

    public User authenticate(
            String email,
            String password) {

        // -----------------------------------------------------
        // Find user by email
        // -----------------------------------------------------

        User user =
                userRepository.findByEmail(email);


        // -----------------------------------------------------
        // User not found
        // -----------------------------------------------------

        if (user == null) {

            return null;
        }


        // -----------------------------------------------------
        // Check account status
        // -----------------------------------------------------

        if (!"ACTIVE".equalsIgnoreCase(
                user.getStatus())) {

            return null;
        }


        // -----------------------------------------------------
        // Verify BCrypt password
        // -----------------------------------------------------

        if (!passwordEncoder.matches(
                password,
                user.getPasswordHash())) {

            return null;
        }


        // -----------------------------------------------------
        // Login successful
        // -----------------------------------------------------

        return user;
    }
}