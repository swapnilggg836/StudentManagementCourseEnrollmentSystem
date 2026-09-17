package org.giritechhub.model;

import java.time.LocalDate;

public class Student {

    private int studentId;
    private int userId;

    private String rollNo;
    private String firstName;
    private String lastName;

    private int deptId;
    private String departmentName;

    private int semester;

    private String phone;
    private String gender;
    private LocalDate dob;
    private String address;


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
            String departmentName,
            int semester,
            String phone,
            String gender,
            LocalDate dob,
            String address) {

        this.studentId = studentId;
        this.userId = userId;
        this.rollNo = rollNo;
        this.firstName = firstName;
        this.lastName = lastName;
        this.deptId = deptId;
        this.departmentName = departmentName;
        this.semester = semester;
        this.phone = phone;
        this.gender = gender;
        this.dob = dob;
        this.address = address;
    }


    // =========================================================
    // GETTERS AND SETTERS
    // =========================================================

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }


    public String getRollNo() {
        return rollNo;
    }

    public void setRollNo(String rollNo) {
        this.rollNo = rollNo;
    }


    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }


    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }


    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }


    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }


    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }


    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}