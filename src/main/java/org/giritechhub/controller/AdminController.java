package org.giritechhub.controller;

import java.util.List;

import org.giritechhub.model.DepartmentShare;
import org.giritechhub.model.DepartmentSummary;
import org.giritechhub.model.DashboardStats;
import org.giritechhub.model.EnrollmentTrend;
import org.giritechhub.service.DashboardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @Autowired
    private DashboardService dashboardService;


    // =========================================================
    // ADMIN DASHBOARD
    // =========================================================

    @GetMapping("/admin/dashboard")
    public String dashboard(Model model) {

        DashboardStats stats =
                dashboardService.getDashboardStats();

        List<EnrollmentTrend> enrollmentTrend =
                dashboardService.getEnrollmentTrend();

        List<DepartmentShare> departmentShare =
                dashboardService.getDepartmentShare();

        List<DepartmentSummary> departmentSummary =
                dashboardService.getDepartmentSummary();


        model.addAttribute(
                "stats",
                stats
        );

        model.addAttribute(
                "enrollmentTrend",
                enrollmentTrend
        );

        model.addAttribute(
                "departmentShare",
                departmentShare
        );

        model.addAttribute(
                "departmentSummary",
                departmentSummary
        );


        return "admin/dashboard";
    }


    // =========================================================
    // COURSE MAPPINGS
    // =========================================================
    //
    // CourseController handles all course URLs:
    //
    // /admin/courses
    // /admin/courses/add
    // /admin/courses/view
    // /admin/courses/edit
    // /admin/courses/save
    // /admin/courses/update
    // /admin/courses/delete
    //
    // DO NOT ADD COURSE METHODS HERE.
    // =========================================================


    // =========================================================
    // FACULTY MAPPINGS
    // =========================================================
    //
    // FacultyController handles all faculty URLs:
    //
    // /admin/faculty
    // /admin/faculty/add
    // /admin/faculty/view
    // /admin/faculty/edit
    // /admin/faculty/save
    // /admin/faculty/update
    // /admin/faculty/delete
    //
    // DO NOT ADD FACULTY METHODS HERE.
    // =========================================================


    // =========================================================
    // ENROLLMENT PAGE
    // =========================================================

   

    // =========================================================
    // PAYMENT PAGES
    // =========================================================



    // =========================================================
    // REPORTS
    // =========================================================

    

}