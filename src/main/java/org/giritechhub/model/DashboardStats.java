package org.giritechhub.model;

public class DashboardStats {

    private int totalStudents;
    private int totalCourses;
    private int totalFaculty;
    private int totalEnrollments;
    private int pendingPayments;
    private double totalRevenue;

    public DashboardStats() {
    }

    public DashboardStats(int totalStudents,
                          int totalCourses,
                          int totalFaculty,
                          int totalEnrollments,
                          int pendingPayments,
                          double totalRevenue) {

        this.totalStudents = totalStudents;
        this.totalCourses = totalCourses;
        this.totalFaculty = totalFaculty;
        this.totalEnrollments = totalEnrollments;
        this.pendingPayments = pendingPayments;
        this.totalRevenue = totalRevenue;
    }

    public int getTotalStudents() {
        return totalStudents;
    }

    public void setTotalStudents(int totalStudents) {
        this.totalStudents = totalStudents;
    }

    public int getTotalCourses() {
        return totalCourses;
    }

    public void setTotalCourses(int totalCourses) {
        this.totalCourses = totalCourses;
    }

    public int getTotalFaculty() {
        return totalFaculty;
    }

    public void setTotalFaculty(int totalFaculty) {
        this.totalFaculty = totalFaculty;
    }

    public int getTotalEnrollments() {
        return totalEnrollments;
    }

    public void setTotalEnrollments(int totalEnrollments) {
        this.totalEnrollments = totalEnrollments;
    }

    public int getPendingPayments() {
        return pendingPayments;
    }

    public void setPendingPayments(int pendingPayments) {
        this.pendingPayments = pendingPayments;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }
}