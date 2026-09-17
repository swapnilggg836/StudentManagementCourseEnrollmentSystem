package org.giritechhub.model;

public class EnrollmentTrend {

    private String month;
    private int totalEnrollments;

    public EnrollmentTrend() {
    }

    public EnrollmentTrend(String month, int totalEnrollments) {
        this.month = month;
        this.totalEnrollments = totalEnrollments;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getTotalEnrollments() {
        return totalEnrollments;
    }

    public void setTotalEnrollments(int totalEnrollments) {
        this.totalEnrollments = totalEnrollments;
    }
}