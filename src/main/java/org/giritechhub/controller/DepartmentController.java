package org.giritechhub.controller;

import java.util.List;

import org.giritechhub.model.Department;
import org.giritechhub.service.DepartmentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;


    // =========================================================
    // DEPARTMENT LIST + SEARCH
    // =========================================================

    @GetMapping("/admin/departments")
    public String departments(
            @RequestParam(
                    value = "keyword",
                    required = false
            )
            String keyword,
            Model model) {

        List<Department> departments;

        if (keyword == null ||
            keyword.trim().isEmpty()) {

            departments =
                    departmentService.getAllDepartments();

        } else {

            departments =
                    departmentService.searchDepartments(
                            keyword.trim()
                    );
        }

        model.addAttribute(
                "departments",
                departments
        );

        model.addAttribute(
                "keyword",
                keyword
        );

        return "admin/departments";
    }


    // =========================================================
    // ADD DEPARTMENT PAGE
    // =========================================================

    @GetMapping("/admin/departments/add")
    public String addDepartmentPage(
            Model model) {

        model.addAttribute(
                "department",
                new Department()
        );

        return "admin/department-form";
    }


    // =========================================================
    // SAVE DEPARTMENT
    // =========================================================

    @PostMapping("/admin/departments/save")
    public String saveDepartment(

            @RequestParam("deptCode")
            String deptCode,

            @RequestParam("deptName")
            String deptName,

            @RequestParam(
                    value = "hodName",
                    required = false
            )
            String hodName) {

        Department department =
                new Department();

        department.setDeptCode(
                deptCode.trim()
        );

        department.setDeptName(
                deptName.trim()
        );

        if (hodName != null &&
            !hodName.trim().isEmpty()) {

            department.setHodName(
                    hodName.trim()
            );
        }

        departmentService.addDepartment(
                department
        );

        return "redirect:/admin/departments";
    }


    // =========================================================
    // EDIT DEPARTMENT PAGE
    // =========================================================

    @GetMapping("/admin/departments/edit")
    public String editDepartment(
            @RequestParam("id") int deptId,
            Model model) {

        Department department =
                departmentService.getDepartmentById(
                        deptId
                );

        if (department == null) {

            return "redirect:/admin/departments";
        }

        model.addAttribute(
                "department",
                department
        );

        return "admin/department-form";
    }


    // =========================================================
    // UPDATE DEPARTMENT
    // =========================================================

    @PostMapping("/admin/departments/update")
    public String updateDepartment(

            @RequestParam("deptId")
            int deptId,

            @RequestParam("deptCode")
            String deptCode,

            @RequestParam("deptName")
            String deptName,

            @RequestParam(
                    value = "hodName",
                    required = false
            )
            String hodName) {

        Department department =
                new Department();

        department.setDeptId(
                deptId
        );

        department.setDeptCode(
                deptCode.trim()
        );

        department.setDeptName(
                deptName.trim()
        );

        if (hodName != null &&
            !hodName.trim().isEmpty()) {

            department.setHodName(
                    hodName.trim()
            );
        }

        departmentService.updateDepartment(
                department
        );

        return "redirect:/admin/departments";
    }


    // =========================================================
    // DELETE DEPARTMENT
    // =========================================================

    @PostMapping("/admin/departments/delete")
    public String deleteDepartment(
            @RequestParam("id") int deptId) {

        departmentService.deleteDepartment(
                deptId
        );

        return "redirect:/admin/departments";
    }

}