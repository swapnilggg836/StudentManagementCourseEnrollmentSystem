package org.giritechhub.model;
import java.sql.Timestamp;
public class User {
    private int userId;
    private String email;
    private String passwordHash;
    private String role;
    private String status;
    private Timestamp createdAt;
    // Default Constructor
    public User() {
    }


    // Constructor
    public User(int userId, String email, String passwordHash,
                String role, String status, Timestamp createdAt) {

        this.userId = userId;
        this.email = email;
        this.passwordHash = passwordHash;
        this.role = role;
        this.status = status;
        this.createdAt = createdAt;
    }

    // Getter and Setter for userId

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }


    // Getter and Setter for email

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    // Getter and Setter for passwordHash

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }


    // Getter and Setter for role

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }


    // Getter and Setter for status

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    // Getter and Setter for createdAt

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}