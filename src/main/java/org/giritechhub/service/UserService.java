package org.giritechhub.service;

import org.giritechhub.model.User;
import org.giritechhub.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User authenticate(String email, String password) {

        User user = userRepository.findByEmail(email);

        if (user == null) {
            return null;
        }

        if (!user.getStatus().equals("ACTIVE")) {
            return null;
        }

        if (!user.getPasswordHash().equals(password)) {
            return null;
        }

        return user;
    }
}