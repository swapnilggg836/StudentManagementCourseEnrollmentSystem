package org.giritechhub.service;

import org.giritechhub.model.FacultyDashboardStats;
import org.giritechhub.repository.FacultyDashboardRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FacultyDashboardService {

    @Autowired
    private FacultyDashboardRepository facultyDashboardRepository;


    // =========================================================
    // GET FACULTY DASHBOARD STATISTICS
    // =========================================================

    public FacultyDashboardStats getDashboardStats(int facultyId) {

        if (facultyId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid faculty."
            );
        }

        FacultyDashboardStats stats =
                facultyDashboardRepository.getDashboardStats(
                        facultyId
                );

        if (stats == null) {
            throw new IllegalArgumentException(
                    "Faculty dashboard data not found."
            );
        }

        return stats;
    }
}