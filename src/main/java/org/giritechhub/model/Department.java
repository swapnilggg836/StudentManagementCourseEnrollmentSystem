package org.giritechhub.model;

public class Department {

    private int deptId;
    private String deptCode;
    private String deptName;
    private String hodName;


    // =========================================================
    // DEFAULT CONSTRUCTOR
    // =========================================================

    public Department() {
    }


    // =========================================================
    // GETTERS AND SETTERS
    // =========================================================

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }


    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }


    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }


    public String getHodName() {
        return hodName;
    }

    public void setHodName(String hodName) {
        this.hodName = hodName;
    }
}