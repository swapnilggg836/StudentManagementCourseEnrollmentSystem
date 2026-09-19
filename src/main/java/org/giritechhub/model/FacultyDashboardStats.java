package org.giritechhub.model;

public class FacultyDashboardStats {

    private int facultyId;

    private String facultyName;

    private String departmentName;

    private String departmentCode;

    private String designation;

    private int assignedCourses;

    private int totalStudents;

    private int totalCapacity;


    // =========================================================
    // CONSTRUCTOR
    // =========================================================

    public FacultyDashboardStats() {
    }


    // =========================================================
    // FACULTY ID
    // =========================================================

    public int getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(int facultyId) {
        this.facultyId = facultyId;
    }


    // =========================================================
    // FACULTY NAME
    // =========================================================

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
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
    // DEPARTMENT CODE
    // =========================================================

    public String getDepartmentCode() {
        return departmentCode;
    }

    public void setDepartmentCode(String departmentCode) {
        this.departmentCode = departmentCode;
    }


    // =========================================================
    // DESIGNATION
    // =========================================================

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }


    // =========================================================
    // ASSIGNED COURSES
    // =========================================================

    public int getAssignedCourses() {
        return assignedCourses;
    }

    public void setAssignedCourses(int assignedCourses) {
        this.assignedCourses = assignedCourses;
    }


    // =========================================================
    // TOTAL STUDENTS
    // =========================================================

    public int getTotalStudents() {
        return totalStudents;
    }

    public void setTotalStudents(int totalStudents) {
        this.totalStudents = totalStudents;
    }


    // =========================================================
    // TOTAL CAPACITY
    // =========================================================

    public int getTotalCapacity() {
        return totalCapacity;
    }

    public void setTotalCapacity(int totalCapacity) {
        this.totalCapacity = totalCapacity;
    }
}