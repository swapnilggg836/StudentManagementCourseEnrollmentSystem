package org.giritechhub.controller;

import java.util.List;

import org.giritechhub.model.CourseEnrollment;
import org.giritechhub.service.CourseService;
import org.giritechhub.service.DepartmentService;
import org.giritechhub.service.EnrollmentService;
import org.giritechhub.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/enrollments")
public class EnrollmentController {

    private final EnrollmentService enrollmentService;
    private final StudentService studentService;
    private final CourseService courseService;
    private final DepartmentService departmentService;

    public EnrollmentController(
            EnrollmentService enrollmentService,
            StudentService studentService,
            CourseService courseService,
            DepartmentService departmentService) {

        this.enrollmentService = enrollmentService;
        this.studentService = studentService;
        this.courseService = courseService;
        this.departmentService = departmentService;
    }


    // =========================================================
    // LIST ALL ENROLLMENTS
    // GET /admin/enrollments
    // =========================================================

    @GetMapping
    public String enrollments(

            @RequestParam(
                    value = "studentId",
                    required = false
            )
            Integer studentId,

            @RequestParam(
                    value = "courseId",
                    required = false
            )
            Integer courseId,

            @RequestParam(
                    value = "deptId",
                    required = false
            )
            Integer deptId,

            @RequestParam(
                    value = "semester",
                    required = false
            )
            Integer semester,

            @RequestParam(
                    value = "status",
                    required = false
            )
            String status,

            Model model) {

        List<CourseEnrollment> enrollments;

        boolean hasFilter =
                studentId != null
                || courseId != null
                || deptId != null
                || semester != null
                || (status != null && !status.isBlank());


        // =====================================================
        // GET FILTERED OR ALL ENROLLMENTS
        // =====================================================

        if (hasFilter) {

            enrollments =
                    enrollmentService.searchEnrollments(
                            studentId,
                            courseId,
                            deptId,
                            semester,
                            status
                    );

        } else {

            enrollments =
                    enrollmentService.getAllEnrollments();
        }


        // =====================================================
        // ENROLLMENT TABLE DATA
        // =====================================================

        model.addAttribute(
                "enrollments",
                enrollments
        );


        // =====================================================
        // FILTER DROPDOWN DATA
        // =====================================================

        model.addAttribute(
                "students",
                studentService.getAllStudents()
        );

        model.addAttribute(
                "courses",
                courseService.getAllCourses()
        );

        model.addAttribute(
                "departments",
                departmentService.getAllDepartments()
        );


        // =====================================================
        // STATISTICS
        // =====================================================

        model.addAttribute(
                "totalEnrollments",
                enrollmentService.getTotalEnrollments()
        );

        model.addAttribute(
                "enrolledCount",
                enrollmentService.getEnrolledCount()
        );

        model.addAttribute(
                "droppedCount",
                enrollmentService.getDroppedCount()
        );

        model.addAttribute(
                "completedCount",
                enrollmentService.getCompletedCount()
        );


        // =====================================================
        // PRESERVE SELECTED FILTERS
        // =====================================================

        model.addAttribute(
                "selectedStudentId",
                studentId
        );

        model.addAttribute(
                "selectedCourseId",
                courseId
        );

        model.addAttribute(
                "selectedDeptId",
                deptId
        );

        model.addAttribute(
                "selectedSemester",
                semester
        );

        model.addAttribute(
                "selectedStatus",
                status
        );


        return "admin/enrollments";
    }


    // =========================================================
    // VIEW ENROLLMENT
    // GET /admin/enrollments/view?id=1
    // =========================================================

    @GetMapping("/view")
    public String viewEnrollment(

            @RequestParam(
                    value = "id"
            )
            int id,

            Model model,

            RedirectAttributes redirectAttributes) {

        try {

            CourseEnrollment enrollment =
                    enrollmentService.getEnrollmentById(id);


            if (enrollment == null) {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Enrollment not found."
                );

                return "redirect:/admin/enrollments";
            }


            model.addAttribute(
                    "enrollment",
                    enrollment
            );


            return "admin/enrollment-view";


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Unable to load enrollment."
            );

            return "redirect:/admin/enrollments";
        }
    }


    // =========================================================
    // ADD ENROLLMENT PAGE
    // GET /admin/enrollments/add
    // =========================================================

    @GetMapping("/add")
    public String addEnrollment(Model model) {

        model.addAttribute(
                "enrollment",
                new CourseEnrollment()
        );


        model.addAttribute(
                "students",
                studentService.getAllStudents()
        );


        model.addAttribute(
                "courses",
                courseService.getAllCourses()
        );


        return "admin/enrollment-form";
    }


    // =========================================================
    // SAVE ENROLLMENT
    // POST /admin/enrollments/save
    // =========================================================

    @PostMapping("/save")
    public String saveEnrollment(

            @RequestParam(
                    value = "studentId"
            )
            int studentId,

            @RequestParam(
                    value = "courseId"
            )
            int courseId,

            @RequestParam(
                    value = "status",
                    required = false,
                    defaultValue = "ENROLLED"
            )
            String status,

            @RequestParam(
                    value = "grade",
                    required = false
            )
            String grade,

            RedirectAttributes redirectAttributes) {

        try {

            CourseEnrollment enrollment =
                    new CourseEnrollment();


            enrollment.setStudentId(
                    studentId
            );


            enrollment.setCourseId(
                    courseId
            );


            enrollment.setStatus(
                    status
            );


            enrollment.setGrade(
                    grade
            );


            boolean saved =
                    enrollmentService.addEnrollment(
                            enrollment
                    );


            if (saved) {

                redirectAttributes.addFlashAttribute(
                        "success",
                        "Enrollment added successfully."
                );

            } else {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Enrollment could not be added."
                );
            }


        } catch (IllegalArgumentException e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Error while adding enrollment: "
                            + e.getMessage()
            );
        }


        return "redirect:/admin/enrollments";
    }


    // =========================================================
    // EDIT ENROLLMENT PAGE
    // GET /admin/enrollments/edit?id=1
    // =========================================================

    @GetMapping("/edit")
    public String editEnrollment(

            @RequestParam(
                    value = "id"
            )
            int id,

            Model model,

            RedirectAttributes redirectAttributes) {

        try {

            CourseEnrollment enrollment =
                    enrollmentService.getEnrollmentById(id);


            if (enrollment == null) {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Enrollment not found."
                );

                return "redirect:/admin/enrollments";
            }


            model.addAttribute(
                    "enrollment",
                    enrollment
            );


            model.addAttribute(
                    "students",
                    studentService.getAllStudents()
            );


            model.addAttribute(
                    "courses",
                    courseService.getAllCourses()
            );


            return "admin/enrollment-form";


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Unable to load enrollment."
            );

            return "redirect:/admin/enrollments";
        }
    }


    // =========================================================
    // UPDATE ENROLLMENT
    // POST /admin/enrollments/update
    // =========================================================

    @PostMapping("/update")
    public String updateEnrollment(

            @RequestParam(
                    value = "enrollmentId"
            )
            int enrollmentId,

            @RequestParam(
                    value = "studentId"
            )
            int studentId,

            @RequestParam(
                    value = "courseId"
            )
            int courseId,

            @RequestParam(
                    value = "status"
            )
            String status,

            @RequestParam(
                    value = "grade",
                    required = false
            )
            String grade,

            RedirectAttributes redirectAttributes) {

        try {

            CourseEnrollment enrollment =
                    new CourseEnrollment();


            enrollment.setEnrollmentId(
                    enrollmentId
            );


            enrollment.setStudentId(
                    studentId
            );


            enrollment.setCourseId(
                    courseId
            );


            enrollment.setStatus(
                    status
            );


            enrollment.setGrade(
                    grade
            );


            boolean updated =
                    enrollmentService.updateEnrollment(
                            enrollment
                    );


            if (updated) {

                redirectAttributes.addFlashAttribute(
                        "success",
                        "Enrollment updated successfully."
                );

            } else {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Enrollment could not be updated."
                );
            }


        } catch (IllegalArgumentException e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Error while updating enrollment: "
                            + e.getMessage()
            );
        }


        return "redirect:/admin/enrollments";
    }


    // =========================================================
    // DROP ENROLLMENT
    // POST /admin/enrollments/drop
    // =========================================================

    @PostMapping("/drop")
    public String dropEnrollment(

            @RequestParam(
                    value = "id"
            )
            int id,

            RedirectAttributes redirectAttributes) {

        try {

            boolean dropped =
                    enrollmentService.dropEnrollment(id);


            if (dropped) {

                redirectAttributes.addFlashAttribute(
                        "success",
                        "Enrollment dropped successfully."
                );

            } else {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Enrollment could not be dropped."
                );
            }


        } catch (IllegalArgumentException e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Error while dropping enrollment."
            );
        }


        return "redirect:/admin/enrollments";
    }


    // =========================================================
    // MARK ENROLLMENT COMPLETED
    // POST /admin/enrollments/complete
    // =========================================================

    @PostMapping("/complete")
    public String completeEnrollment(

            @RequestParam(
                    value = "id"
            )
            int id,

            @RequestParam(
                    value = "grade",
                    required = false
            )
            String grade,

            RedirectAttributes redirectAttributes) {

        try {

            boolean completed =
                    enrollmentService.completeEnrollment(
                            id,
                            grade
                    );


            if (completed) {

                redirectAttributes.addFlashAttribute(
                        "success",
                        "Enrollment marked as completed."
                );

            } else {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Enrollment could not be completed."
                );
            }


        } catch (IllegalArgumentException e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Error while completing enrollment."
            );
        }


        return "redirect:/admin/enrollments";
    }


    // =========================================================
    // DELETE ENROLLMENT
    // POST /admin/enrollments/delete
    // =========================================================

    @PostMapping("/delete")
    public String deleteEnrollment(

            @RequestParam(
                    value = "id"
            )
            int id,

            RedirectAttributes redirectAttributes) {

        try {

            boolean deleted =
                    enrollmentService.deleteEnrollment(id);


            if (deleted) {

                redirectAttributes.addFlashAttribute(
                        "success",
                        "Enrollment deleted successfully."
                );

            } else {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Enrollment could not be deleted."
                );
            }


        } catch (IllegalArgumentException e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );


        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Error while deleting enrollment."
            );
        }


        return "redirect:/admin/enrollments";
    }
}