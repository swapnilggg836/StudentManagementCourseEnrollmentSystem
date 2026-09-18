package org.giritechhub.model;

import java.time.LocalDate;

public class Student {

    private int studentId;
    private int userId;

    private String rollNo;
    private String firstName;
    private String lastName;

    private int deptId;
    private String departmentCode;
    private String departmentName;

    private int semester;

    private String phone;
    private String gender;
    private LocalDate dob;
    private String address;

    // User information
    private String email;
    private String status;


    // =========================================================
    // DEFAULT CONSTRUCTOR
    // =========================================================

    public Student() {
    }


    // =========================================================
    // FULL CONSTRUCTOR
    // =========================================================

    public Student(
            int studentId,
            int userId,
            String rollNo,
            String firstName,
            String lastName,
            int deptId,
            String departmentCode,
            String departmentName,
            int semester,
            String phone,
            String gender,
            LocalDate dob,
            String address,
            String email,
            String status) {

        this.studentId = studentId;
        this.userId = userId;

        this.rollNo = rollNo;
        this.firstName = firstName;
        this.lastName = lastName;

        this.deptId = deptId;
        this.departmentCode = departmentCode;
        this.departmentName = departmentName;

        this.semester = semester;

        this.phone = phone;
        this.gender = gender;
        this.dob = dob;
        this.address = address;

        this.email = email;
        this.status = status;
    }


    // =========================================================
    // STUDENT ID
    // =========================================================

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }


    // =========================================================
    // USER ID
    // =========================================================

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }


    // =========================================================
    // ROLL NUMBER
    // =========================================================

    public String getRollNo() {
        return rollNo;
    }

    public void setRollNo(String rollNo) {
        this.rollNo = rollNo;
    }


    // =========================================================
    // FIRST NAME
    // =========================================================

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }


    // =========================================================
    // LAST NAME
    // =========================================================

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }


    // =========================================================
    // DEPARTMENT ID
    // =========================================================

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }


    // =========================================================
    // DEPARTMENT CODE
    // =========================================================

    public String getDepartmentCode() {
        return departmentCode;
    }

    public void setDepartmentCode(String departmentCode) {
        this.departmentCode = departmentCode;
    }


    // =========================================================
    // DEPARTMENT NAME
    // =========================================================

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }


    // =========================================================
    // SEMESTER
    // =========================================================

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }


    // =========================================================
    // PHONE
    // =========================================================

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    // =========================================================
    // GENDER
    // =========================================================

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }


    // =========================================================
    // DATE OF BIRTH
    // =========================================================

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }


    // =========================================================
    // ADDRESS
    // =========================================================

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    // =========================================================
    // EMAIL
    // =========================================================

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    // =========================================================
    // STATUS
    // =========================================================

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    // =========================================================
    // FULL NAME
    // Useful for JSP
    // =========================================================

    public String getFullName() {

        String first = firstName == null ? "" : firstName.trim();
        String last = lastName == null ? "" : lastName.trim();

        return (first + " " + last).trim();
    }
}