package org.giritechhub.service;

import java.util.List;

import org.giritechhub.model.DashboardStats;
import org.giritechhub.model.DepartmentShare;
import org.giritechhub.model.DepartmentSummary;
import org.giritechhub.model.EnrollmentTrend;
import org.giritechhub.model.RecentActivity;
import org.giritechhub.repository.DashboardRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DashboardService {

    @Autowired
    private DashboardRepository dashboardRepository;


    // =========================================================
    // DASHBOARD STATISTICS
    // =========================================================

    public DashboardStats getDashboardStats() {

        return dashboardRepository.getDashboardStats();
    }


    // =========================================================
    // ENROLLMENT TREND
    // =========================================================

    public List<EnrollmentTrend> getEnrollmentTrend() {

        return dashboardRepository.getEnrollmentTrend();
    }


    // =========================================================
    // DEPARTMENT SHARE
    // =========================================================

    public List<DepartmentShare> getDepartmentShare() {

        return dashboardRepository.getDepartmentShare();
    }


    // =========================================================
    // DEPARTMENT OPERATIONAL SUMMARY
    // =========================================================

    public List<DepartmentSummary> getDepartmentSummary() {

        return dashboardRepository.getDepartmentSummary();
    }


    // =========================================================
    // RECENT ACTIVITY
    // =========================================================

    public List<RecentActivity> getRecentActivity() {

        return dashboardRepository.getRecentActivity();
    }
}