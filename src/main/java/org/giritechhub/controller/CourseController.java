package org.giritechhub.controller;

import java.math.BigDecimal;
import java.util.List;

import org.giritechhub.model.Course;
import org.giritechhub.model.Department;
import org.giritechhub.model.Faculty;
import org.giritechhub.service.CourseService;
import org.giritechhub.service.DepartmentService;
import org.giritechhub.service.FacultyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private FacultyService facultyService;


    // =========================================================
    // COURSE LIST
    // =========================================================

    @GetMapping("/admin/courses")
    public String courses(
            @RequestParam(
                    value = "keyword",
                    required = false
            ) String keyword,
            Model model) {

        List<Course> courses;

        if (keyword == null || keyword.trim().isEmpty()) {

            courses = courseService.getAllCourses();

        } else {

            courses =
                    courseService.searchCourses(
                            keyword.trim()
                    );
        }

        model.addAttribute("courses", courses);
        model.addAttribute("keyword", keyword);

        return "admin/courses";
    }


    // =========================================================
    // VIEW COURSE
    // =========================================================

    @GetMapping("/admin/courses/view")
    public String viewCourse(
            @RequestParam("id") int courseId,
            Model model) {

        Course course =
                courseService.getCourseById(courseId);

        if (course == null) {
            return "redirect:/admin/courses";
        }

        model.addAttribute("course", course);

        return "admin/course-view";
    }


    // =========================================================
    // ADD COURSE PAGE
    // =========================================================

    @GetMapping("/admin/courses/add")
    public String addCoursePage(Model model) {

        Course course = new Course();

        loadFormData(model);

        model.addAttribute("course", course);

        return "admin/course-form";
    }


    // =========================================================
    // SAVE COURSE
    // =========================================================

    @PostMapping("/admin/courses/save")
    public String saveCourse(
            @RequestParam("courseCode") String courseCode,
            @RequestParam("title") String title,

            @RequestParam(
                    value = "description",
                    required = false
            ) String description,

            @RequestParam("credits") int credits,
            @RequestParam("deptId") int deptId,

            @RequestParam(
                    value = "facultyId",
                    required = false
            ) Integer facultyId,

            @RequestParam("capacity") int capacity,

            @RequestParam(
                    value = "scheduleDay",
                    required = false
            ) String scheduleDay,

            @RequestParam(
                    value = "scheduleTime",
                    required = false
            ) String scheduleTime,

            @RequestParam("feeAmount") BigDecimal feeAmount,

            Model model) {

        try {

            Course course =
                    buildCourse(
                            courseCode,
                            title,
                            description,
                            credits,
                            deptId,
                            facultyId,
                            capacity,
                            scheduleDay,
                            scheduleTime,
                            feeAmount
                    );

            courseService.addCourse(course);

            return "redirect:/admin/courses?success=Course+added+successfully";

        } catch (IllegalArgumentException e) {

            Course course =
                    buildCourse(
                            courseCode,
                            title,
                            description,
                            credits,
                            deptId,
                            facultyId,
                            capacity,
                            scheduleDay,
                            scheduleTime,
                            feeAmount
                    );

            model.addAttribute("course", course);

            loadFormData(model);

            model.addAttribute(
                    "error",
                    e.getMessage()
            );

            return "admin/course-form";
        }
    }


    // =========================================================
    // EDIT COURSE PAGE
    // =========================================================

    @GetMapping("/admin/courses/edit")
    public String editCourse(
            @RequestParam("id") int courseId,
            Model model) {

        Course course =
                courseService.getCourseById(courseId);

        if (course == null) {
            return "redirect:/admin/courses";
        }

        loadFormData(model);

        model.addAttribute("course", course);

        return "admin/course-form";
    }


    // =========================================================
    // UPDATE COURSE
    // =========================================================

    @PostMapping("/admin/courses/update")
    public String updateCourse(
            @RequestParam("courseId") int courseId,

            @RequestParam("courseCode") String courseCode,

            @RequestParam("title") String title,

            @RequestParam(
                    value = "description",
                    required = false
            ) String description,

            @RequestParam("credits") int credits,

            @RequestParam("deptId") int deptId,

            @RequestParam(
                    value = "facultyId",
                    required = false
            ) Integer facultyId,

            @RequestParam("capacity") int capacity,

            @RequestParam(
                    value = "scheduleDay",
                    required = false
            ) String scheduleDay,

            @RequestParam(
                    value = "scheduleTime",
                    required = false
            ) String scheduleTime,

            @RequestParam("feeAmount") BigDecimal feeAmount,

            Model model) {

        Course course =
                buildCourse(
                        courseCode,
                        title,
                        description,
                        credits,
                        deptId,
                        facultyId,
                        capacity,
                        scheduleDay,
                        scheduleTime,
                        feeAmount
                );

        course.setCourseId(courseId);

        try {

            courseService.updateCourse(course);

            return "redirect:/admin/courses?success=Course+updated+successfully";

        } catch (IllegalArgumentException e) {

            Course existingCourse =
                    courseService.getCourseById(courseId);

            if (existingCourse != null) {

                course.setEnrolledStudents(
                        existingCourse.getEnrolledStudents()
                );

                course.setAvailableSeats(
                        Math.max(
                                0,
                                capacity
                                - existingCourse.getEnrolledStudents()
                        )
                );
            }

            loadFormData(model);

            model.addAttribute("course", course);

            model.addAttribute(
                    "error",
                    e.getMessage()
            );

            return "admin/course-form";
        }
    }


    // =========================================================
    // DELETE COURSE
    // =========================================================

    @PostMapping("/admin/courses/delete")
    public String deleteCourse(
            @RequestParam("id") int courseId,
            Model model) {

        try {

            courseService.deleteCourse(courseId);

            return "redirect:/admin/courses?success=Course+deleted+successfully";

        } catch (IllegalStateException e) {

            return "redirect:/admin/courses?error="
                    + encodeMessage(e.getMessage());
        }
    }


    // =========================================================
    // LOAD DEPARTMENT + FACULTY FOR FORM
    // =========================================================

    private void loadFormData(Model model) {

        List<Department> departments =
                departmentService.getAllDepartments();

        List<Faculty> faculty =
                facultyService.getAllFaculty();

        model.addAttribute(
                "departments",
                departments
        );

        model.addAttribute(
                "faculty",
                faculty
        );
    }


    // =========================================================
    // BUILD COURSE OBJECT
    // =========================================================

    private Course buildCourse(
            String courseCode,
            String title,
            String description,
            int credits,
            int deptId,
            Integer facultyId,
            int capacity,
            String scheduleDay,
            String scheduleTime,
            BigDecimal feeAmount) {

        Course course = new Course();

        course.setCourseCode(courseCode);
        course.setTitle(title);
        course.setDescription(description);
        course.setCredits(credits);
        course.setDeptId(deptId);
        course.setFacultyId(facultyId);
        course.setCapacity(capacity);
        course.setScheduleDay(scheduleDay);
        course.setScheduleTime(scheduleTime);
        course.setFeeAmount(feeAmount);

        return course;
    }


    // =========================================================
    // SIMPLE URL MESSAGE ENCODING
    // =========================================================

    private String encodeMessage(String message) {

        if (message == null) {
            return "";
        }

        return message
                .replace(" ", "+")
                .replace("(", "%28")
                .replace(")", "%29");
    }
}