package org.giritechhub.model;

import java.math.BigDecimal;

public class Course {

    private int courseId;
    private String courseCode;
    private String title;
    private String description;
    private int credits;

    private int deptId;
    private String departmentName;
    private String departmentCode;

    private Integer facultyId;
    private String facultyName;

    private int capacity;
    private String scheduleDay;
    private String scheduleTime;

    private BigDecimal feeAmount;

    // Calculated fields for Admin UI
    private int enrolledStudents;
    private int availableSeats;


    // =========================================================
    // CONSTRUCTORS
    // =========================================================

    public Course() {
    }


    // =========================================================
    // GETTERS AND SETTERS
    // =========================================================

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }


    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
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


    public String getDepartmentCode() {
        return departmentCode;
    }

    public void setDepartmentCode(String departmentCode) {
        this.departmentCode = departmentCode;
    }


    public Integer getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(Integer facultyId) {
        this.facultyId = facultyId;
    }


    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }


    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }


    public String getScheduleDay() {
        return scheduleDay;
    }

    public void setScheduleDay(String scheduleDay) {
        this.scheduleDay = scheduleDay;
    }


    public String getScheduleTime() {
        return scheduleTime;
    }

    public void setScheduleTime(String scheduleTime) {
        this.scheduleTime = scheduleTime;
    }


    public BigDecimal getFeeAmount() {
        return feeAmount;
    }

    public void setFeeAmount(BigDecimal feeAmount) {
        this.feeAmount = feeAmount;
    }


    public int getEnrolledStudents() {
        return enrolledStudents;
    }

    public void setEnrolledStudents(int enrolledStudents) {
        this.enrolledStudents = enrolledStudents;
    }


    public int getAvailableSeats() {
        return availableSeats;
    }

    public void setAvailableSeats(int availableSeats) {
        this.availableSeats = availableSeats;
    }
}