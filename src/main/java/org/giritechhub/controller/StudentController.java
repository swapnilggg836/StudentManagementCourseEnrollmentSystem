package org.giritechhub.controller;

import java.time.LocalDate;
import java.util.List;

import org.giritechhub.model.Department;
import org.giritechhub.model.Student;
import org.giritechhub.service.DepartmentService;
import org.giritechhub.service.StudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private DepartmentService departmentService;


    // =========================================================
    // STUDENT LIST
    // =========================================================

    @GetMapping("/admin/students")
    public String students(
            @RequestParam(
                    value = "keyword",
                    required = false
            )
            String keyword,
            Model model) {

        List<Student> students;

        if (keyword == null ||
            keyword.trim().isEmpty()) {

            students =
                    studentService.getAllStudents();

        } else {

            students =
                    studentService.searchStudents(
                            keyword.trim()
                    );
        }

        model.addAttribute(
                "students",
                students
        );

        model.addAttribute(
                "keyword",
                keyword
        );

        return "admin/students";
    }


    // =========================================================
    // VIEW STUDENT
    // =========================================================

    @GetMapping("/admin/students/view")
    public String viewStudent(
            @RequestParam("id") int studentId,
            Model model) {

        Student student =
                studentService.getStudentById(
                        studentId
                );

        if (student == null) {
            return "redirect:/admin/students";
        }

        model.addAttribute(
                "student",
                student
        );

        return "admin/student-view";
    }


    // =========================================================
    // ADD STUDENT PAGE
    // =========================================================

    @GetMapping("/admin/students/add")
    public String addStudentPage(
            Model model) {

        Student student =
                new Student();

        List<Department> departments =
                departmentService.getAllDepartments();

        model.addAttribute(
                "student",
                student
        );

        model.addAttribute(
                "departments",
                departments
        );

        return "admin/student-form";
    }


    // =========================================================
    // SAVE STUDENT
    // =========================================================

    @PostMapping("/admin/students/save")
    public String saveStudent(

            @RequestParam("firstName")
            String firstName,

            @RequestParam("lastName")
            String lastName,

            @RequestParam("rollNo")
            String rollNo,

            @RequestParam("deptId")
            int deptId,

            @RequestParam("semester")
            int semester,

            @RequestParam(
                    value = "phone",
                    required = false
            )
            String phone,

            @RequestParam(
                    value = "gender",
                    required = false
            )
            String gender,

            @RequestParam(
                    value = "dob",
                    required = false
            )
            String dob,

            @RequestParam(
                    value = "address",
                    required = false
            )
            String address,

            @RequestParam("email")
            String email,

            @RequestParam("password")
            String password) {

        Student student =
                new Student();

        student.setFirstName(firstName);
        student.setLastName(lastName);
        student.setRollNo(rollNo);
        student.setDeptId(deptId);
        student.setSemester(semester);
        student.setPhone(phone);
        student.setGender(gender);
        student.setAddress(address);

        if (dob != null &&
            !dob.isBlank()) {

            student.setDob(
                    LocalDate.parse(dob)
            );
        }

        studentService.addStudent(
                student,
                email,
                password
        );

        return "redirect:/admin/students";
    }


    // =========================================================
    // EDIT STUDENT PAGE
    // =========================================================

    @GetMapping("/admin/students/edit")
    public String editStudent(
            @RequestParam("id") int studentId,
            Model model) {

        Student student =
                studentService.getStudentById(
                        studentId
                );

        if (student == null) {
            return "redirect:/admin/students";
        }

        List<Department> departments =
                departmentService.getAllDepartments();

        model.addAttribute(
                "student",
                student
        );

        model.addAttribute(
                "departments",
                departments
        );

        return "admin/student-form";
    }


    // =========================================================
    // UPDATE STUDENT
    // =========================================================

    @PostMapping("/admin/students/update")
    public String updateStudent(

            @RequestParam("studentId")
            int studentId,

            @RequestParam("firstName")
            String firstName,

            @RequestParam("lastName")
            String lastName,

            @RequestParam("rollNo")
            String rollNo,

            @RequestParam("deptId")
            int deptId,

            @RequestParam("semester")
            int semester,

            @RequestParam(
                    value = "phone",
                    required = false
            )
            String phone,

            @RequestParam(
                    value = "gender",
                    required = false
            )
            String gender,

            @RequestParam(
                    value = "dob",
                    required = false
            )
            String dob,

            @RequestParam(
                    value = "address",
                    required = false
            )
            String address) {

        Student student =
                new Student();

        student.setStudentId(studentId);
        student.setFirstName(firstName);
        student.setLastName(lastName);
        student.setRollNo(rollNo);
        student.setDeptId(deptId);
        student.setSemester(semester);
        student.setPhone(phone);
        student.setGender(gender);
        student.setAddress(address);

        if (dob != null &&
            !dob.isBlank()) {

            student.setDob(
                    LocalDate.parse(dob)
            );
        }

        studentService.updateStudent(
                student
        );

        return "redirect:/admin/students";
    }


    // =========================================================
    // DELETE STUDENT
    // =========================================================

    @PostMapping("/admin/students/delete")
    public String deleteStudent(
            @RequestParam("id") int studentId) {

        studentService.deleteStudent(
                studentId
        );

        return "redirect:/admin/students";
    }

}