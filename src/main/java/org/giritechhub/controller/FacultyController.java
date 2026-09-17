package org.giritechhub.controller;

import java.util.List;

import org.giritechhub.model.Department;
import org.giritechhub.model.Faculty;
import org.giritechhub.service.DepartmentService;
import org.giritechhub.service.FacultyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FacultyController {

    @Autowired
    private FacultyService facultyService;

    @Autowired
    private DepartmentService departmentService;


    // =========================================================
    // FACULTY LIST
    // =========================================================

    @GetMapping("/admin/faculty")
    public String faculty(
            @RequestParam(
                    value = "keyword",
                    required = false
            )
            String keyword,
            Model model) {

        List<Faculty> faculty;

        if (keyword == null ||
            keyword.trim().isEmpty()) {

            faculty =
                    facultyService.getAllFaculty();

        } else {

            faculty =
                    facultyService.searchFaculty(
                            keyword.trim()
                    );
        }


        // Dynamic statistics

        int totalFaculty =
                faculty.size();

        long activeFaculty =
                faculty.stream()
                        .filter(f ->
                                "ACTIVE".equalsIgnoreCase(
                                        f.getStatus()
                                )
                        )
                        .count();

        long departmentCount =
                faculty.stream()
                        .map(Faculty::getDeptId)
                        .filter(id -> id > 0)
                        .distinct()
                        .count();

        int totalAssignedCourses =
                faculty.stream()
                        .mapToInt(
                                Faculty::getAssignedCourses
                        )
                        .sum();


        model.addAttribute(
                "faculty",
                faculty
        );

        model.addAttribute(
                "keyword",
                keyword
        );

        model.addAttribute(
                "totalFaculty",
                totalFaculty
        );

        model.addAttribute(
                "activeFaculty",
                activeFaculty
        );

        model.addAttribute(
                "departmentCount",
                departmentCount
        );

        model.addAttribute(
                "totalAssignedCourses",
                totalAssignedCourses
        );


        return "admin/faculty";
    }


    // =========================================================
    // VIEW FACULTY
    // =========================================================

    @GetMapping("/admin/faculty/view")
    public String viewFaculty(
            @RequestParam("id") int facultyId,
            Model model) {

        Faculty faculty =
                facultyService.getFacultyById(
                        facultyId
                );

        if (faculty == null) {

            return "redirect:/admin/faculty";
        }

        model.addAttribute(
                "faculty",
                faculty
        );

        return "admin/faculty-view";
    }


    // =========================================================
    // ADD FACULTY PAGE
    // =========================================================

    @GetMapping("/admin/faculty/add")
    public String addFacultyPage(
            Model model) {

        model.addAttribute(
                "faculty",
                new Faculty()
        );

        loadFormData(model);

        return "admin/faculty-form";
    }


    // =========================================================
    // SAVE FACULTY
    // =========================================================

    @PostMapping("/admin/faculty/save")
    public String saveFaculty(

            @RequestParam("employeeCode")
            String employeeCode,

            @RequestParam("firstName")
            String firstName,

            @RequestParam("lastName")
            String lastName,

            @RequestParam("deptId")
            int deptId,

            @RequestParam(
                    value = "designation",
                    required = false)
            String designation,

            @RequestParam(
                    value = "phone",
                    required = false)
            String phone,

            @RequestParam(
                    value = "qualification",
                    required = false)
            String qualification,

            @RequestParam("email")
            String email,

            @RequestParam("password")
            String password,

            Model model) {


        Faculty faculty =
                buildFaculty(
                        employeeCode,
                        firstName,
                        lastName,
                        deptId,
                        designation,
                        phone,
                        qualification
                );


        try {

            facultyService.addFaculty(
                    faculty,
                    email,
                    password
            );

            return "redirect:/admin/faculty?success=Faculty+added+successfully";

        } catch (IllegalArgumentException e) {

            loadFormData(model);

            model.addAttribute(
                    "faculty",
                    faculty
            );

            model.addAttribute(
                    "email",
                    email
            );

            model.addAttribute(
                    "error",
                    e.getMessage()
            );

            return "admin/faculty-form";
        }
    }


    // =========================================================
    // EDIT FACULTY
    // =========================================================

    @GetMapping("/admin/faculty/edit")
    public String editFaculty(
            @RequestParam("id") int facultyId,
            Model model) {

        Faculty faculty =
                facultyService.getFacultyById(
                        facultyId
                );

        if (faculty == null) {

            return "redirect:/admin/faculty";
        }

        loadFormData(model);

        model.addAttribute(
                "faculty",
                faculty
        );

        return "admin/faculty-form";
    }


    // =========================================================
    // UPDATE FACULTY
    // =========================================================

    @PostMapping("/admin/faculty/update")
    public String updateFaculty(

            @RequestParam("facultyId")
            int facultyId,

            @RequestParam("employeeCode")
            String employeeCode,

            @RequestParam("firstName")
            String firstName,

            @RequestParam("lastName")
            String lastName,

            @RequestParam("deptId")
            int deptId,

            @RequestParam(
                    value = "designation",
                    required = false)
            String designation,

            @RequestParam(
                    value = "phone",
                    required = false)
            String phone,

            @RequestParam(
                    value = "qualification",
                    required = false)
            String qualification,

            Model model) {


        Faculty faculty =
                buildFaculty(
                        employeeCode,
                        firstName,
                        lastName,
                        deptId,
                        designation,
                        phone,
                        qualification
                );

        faculty.setFacultyId(
                facultyId
        );


        try {

            facultyService.updateFaculty(
                    faculty
            );

            return "redirect:/admin/faculty?success=Faculty+updated+successfully";

        } catch (IllegalArgumentException e) {

            loadFormData(model);

            Faculty existing =
                    facultyService.getFacultyById(
                            facultyId
                    );

            if (existing != null) {

                faculty.setUserId(
                        existing.getUserId()
                );

                faculty.setEmail(
                        existing.getEmail()
                );

                faculty.setStatus(
                        existing.getStatus()
                );

                faculty.setAssignedCourses(
                        existing.getAssignedCourses()
                );
            }

            model.addAttribute(
                    "faculty",
                    faculty
            );

            model.addAttribute(
                    "error",
                    e.getMessage()
            );

            return "admin/faculty-form";
        }
    }


    // =========================================================
    // DELETE FACULTY
    // =========================================================

    @PostMapping("/admin/faculty/delete")
    public String deleteFaculty(
            @RequestParam("id") int facultyId) {

        try {

            facultyService.deleteFaculty(
                    facultyId
            );

            return "redirect:/admin/faculty?success=Faculty+deleted+successfully";

        } catch (IllegalStateException e) {

            return "redirect:/admin/faculty?error="
                    + encodeMessage(
                            e.getMessage()
                    );
        }
    }


    // =========================================================
    // LOAD DEPARTMENTS
    // =========================================================

    private void loadFormData(
            Model model) {

        List<Department> departments =
                departmentService.getAllDepartments();

        model.addAttribute(
                "departments",
                departments
        );
    }


    // =========================================================
    // BUILD FACULTY
    // =========================================================

    private Faculty buildFaculty(

            String employeeCode,
            String firstName,
            String lastName,
            int deptId,
            String designation,
            String phone,
            String qualification) {

        Faculty faculty =
                new Faculty();

        faculty.setEmployeeCode(
                employeeCode
        );

        faculty.setFirstName(
                firstName
        );

        faculty.setLastName(
                lastName
        );

        faculty.setDeptId(
                deptId
        );

        faculty.setDesignation(
                designation
        );

        faculty.setPhone(
                phone
        );

        faculty.setQualification(
                qualification
        );

        return faculty;
    }


    // =========================================================
    // ENCODE MESSAGE
    // =========================================================

    private String encodeMessage(
            String message) {

        if (message == null) {
            return "";
        }

        return message
                .replace(" ", "+")
                .replace("(", "%28")
                .replace(")", "%29");
    }
}