package org.giritechhub.service;

import java.util.Collections;
import java.util.List;

import org.giritechhub.model.StudentDashboardStats;
import org.giritechhub.model.StudentUpcomingClass;
import org.giritechhub.repository.StudentDashboardRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentDashboardService {

    @Autowired
    private StudentDashboardRepository dashboardRepository;


    // =========================================================
    // GET DASHBOARD STATS
    // =========================================================

    public StudentDashboardStats getDashboardStats(
            int userId) {

        return dashboardRepository.getDashboardStats(
                userId
        );
    }


    // =========================================================
    // GET UPCOMING CLASSES
    // =========================================================

    public List<StudentUpcomingClass> getUpcomingClasses(
            int studentId) {

        List<StudentUpcomingClass> classes =
                dashboardRepository.getUpcomingClasses(
                        studentId
                );

        if (classes == null) {
            return Collections.emptyList();
        }

        return classes;
    }
}