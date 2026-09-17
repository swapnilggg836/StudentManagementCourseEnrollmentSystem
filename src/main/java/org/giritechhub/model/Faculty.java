package org.giritechhub.model;

public class Faculty {

    private int facultyId;
    private int userId;

    private String employeeCode;
    private String firstName;
    private String lastName;

    private int deptId;
    private String departmentCode;
    private String departmentName;

    private String designation;
    private String phone;
    private String qualification;

    // From users table
    private String email;
    private String status;

    // Calculated from courses table
    private int assignedCourses;


    // =========================================================
    // CONSTRUCTOR
    // =========================================================

    public Faculty() {
    }


    // =========================================================
    // GETTERS AND SETTERS
    // =========================================================

    public int getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(int facultyId) {
        this.facultyId = facultyId;
    }


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }


    public String getEmployeeCode() {
        return employeeCode;
    }

    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
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


    public String getDepartmentCode() {
        return departmentCode;
    }

    public void setDepartmentCode(String departmentCode) {
        this.departmentCode = departmentCode;
    }


    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }


    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public int getAssignedCourses() {
        return assignedCourses;
    }

    public void setAssignedCourses(int assignedCourses) {
        this.assignedCourses = assignedCourses;
    }


    // =========================================================
    // FULL NAME
    // =========================================================

    public String getFullName() {

        String first = firstName == null
                ? ""
                : firstName.trim();

        String last = lastName == null
                ? ""
                : lastName.trim();

        return (first + " " + last).trim();
    }
}