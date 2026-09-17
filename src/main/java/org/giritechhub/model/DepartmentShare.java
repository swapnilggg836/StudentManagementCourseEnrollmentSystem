package org.giritechhub.model;

public class DepartmentShare {

    private String departmentCode;
    private String departmentName;
    private int studentCount;

    public DepartmentShare() {
    }

    public DepartmentShare(String departmentCode,
                           String departmentName,
                           int studentCount) {

        this.departmentCode = departmentCode;
        this.departmentName = departmentName;
        this.studentCount = studentCount;
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
}