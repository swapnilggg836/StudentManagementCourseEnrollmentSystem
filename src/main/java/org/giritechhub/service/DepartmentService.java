package org.giritechhub.service;

import java.util.List;

import org.giritechhub.model.Department;
import org.giritechhub.repository.DepartmentRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentRepository departmentRepository;


    // =========================================================
    // GET ALL DEPARTMENTS
    // =========================================================

    public List<Department> getAllDepartments() {

        return departmentRepository.findAll();
    }


    // =========================================================
    // GET DEPARTMENT BY ID
    // =========================================================

    public Department getDepartmentById(int deptId) {

        return departmentRepository.findById(deptId);
    }


    // =========================================================
    // SEARCH DEPARTMENTS
    // =========================================================

    public List<Department> searchDepartments(
            String keyword) {

        if (keyword == null ||
            keyword.trim().isEmpty()) {

            return getAllDepartments();
        }

        return departmentRepository.search(
                keyword.trim()
        );
    }


    // =========================================================
    // ADD DEPARTMENT
    // =========================================================

    public int addDepartment(
            Department department) {

        if (department == null) {

            throw new IllegalArgumentException(
                    "Department cannot be null."
            );
        }

        return departmentRepository.save(
                department
        );
    }


    // =========================================================
    // UPDATE DEPARTMENT
    // =========================================================

    public boolean updateDepartment(
            Department department) {

        if (department == null) {
            return false;
        }

        int result =
                departmentRepository.update(
                        department
                );

        return result > 0;
    }


    // =========================================================
    // DELETE DEPARTMENT
    // =========================================================

    public boolean deleteDepartment(
            int deptId) {

        int result =
                departmentRepository.delete(
                        deptId
                );

        return result > 0;
    }

}