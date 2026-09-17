package org.giritechhub.model;

public class DepartmentSummary {

    private String departmentCode;
    private String departmentName;

    private int studentCount;
    private int courseCount;
    private int facultyCount;

    private double enrollmentPercentage;

    private String status;


    public DepartmentSummary() {
    }


    public DepartmentSummary(
            String departmentCode,
            String departmentName,
            int studentCount,
            int courseCount,
            int facultyCount,
            double enrollmentPercentage,
            String status) {

        this.departmentCode = departmentCode;
        this.departmentName = departmentName;
        this.studentCount = studentCount;
        this.courseCount = courseCount;
        this.facultyCount = facultyCount;
        this.enrollmentPercentage = enrollmentPercentage;
        this.status = status;
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


    public int getStudentCount() {
        return studentCount;
    }

    public void setStudentCount(int studentCount) {
        this.studentCount = studentCount;
    }


    public int getCourseCount() {
        return courseCount;
    }

    public void setCourseCount(int courseCount) {
        this.courseCount = courseCount;
    }


    public int getFacultyCount() {
        return facultyCount;
    }

    public void setFacultyCount(int facultyCount) {
        this.facultyCount = facultyCount;
    }


    public double getEnrollmentPercentage() {
        return enrollmentPercentage;
    }

    public void setEnrollmentPercentage(double enrollmentPercentage) {
        this.enrollmentPercentage = enrollmentPercentage;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}