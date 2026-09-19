package org.giritechhub.controller;

import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.giritechhub.model.Attendance;
import org.giritechhub.model.Faculty;
import org.giritechhub.model.FacultyCourse;
import org.giritechhub.service.FacultyAttendanceService;
import org.giritechhub.service.FacultyCourseService;
import org.giritechhub.service.FacultyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FacultyAttendanceController {

    @Autowired
    private FacultyService facultyService;

    @Autowired
    private FacultyCourseService facultyCourseService;

    @Autowired
    private FacultyAttendanceService facultyAttendanceService;

    /*
     * Faculty Attendance page.
     */
    @GetMapping("/faculty/attendance")
    public String attendancePage(
            @RequestParam(value = "courseId", required = false) Integer courseId,
            @RequestParam(value = "date", required = false) String date,
            HttpSession session,
            Model model) {

        Faculty faculty = getLoggedInFaculty(session);

        if (faculty == null) {
            return "redirect:/login";
        }

        int facultyId = faculty.getFacultyId();

        List<FacultyCourse> courses =
                facultyCourseService.getMyCourses(facultyId);

        model.addAttribute("faculty", faculty);
        model.addAttribute("courses", courses);

        /*
         * No course selected yet.
         */
        if (courseId == null) {
            return "faculty/attendance";
        }

        /*
         * Security check:
         * Make sure the selected course belongs
         * to the logged-in faculty.
         */
        FacultyCourse selectedCourse =
                facultyCourseService.getMyCourseById(
                        courseId,
                        facultyId);

        if (selectedCourse == null) {
            model.addAttribute(
                    "errorMessage",
                    "You are not authorized to manage attendance for this course."
            );

            return "faculty/attendance";
        }

        LocalDate attendanceDate;

        try {

            if (date == null || date.trim().isEmpty()) {
                attendanceDate = LocalDate.now();
            } else {
                attendanceDate = LocalDate.parse(date);
            }

        } catch (Exception e) {

            model.addAttribute(
                    "errorMessage",
                    "Invalid attendance date."
            );

            return "faculty/attendance";
        }

        List<Attendance> students =
                facultyAttendanceService
                        .getCourseStudents(courseId);

        List<Attendance> attendanceRecords =
                facultyAttendanceService
                        .getAttendanceByCourseAndDate(
                                courseId,
                                attendanceDate);

        /*
         * Merge existing attendance status
         * into the enrolled student list.
         */
        for (Attendance student : students) {

            for (Attendance record : attendanceRecords) {

                if (student.getStudentId()
                        == record.getStudentId()) {

                    student.setAttendanceDate(
                            record.getAttendanceDate());

                    student.setStatus(
                            record.getStatus());

                    student.setAttendanceId(
                            record.getAttendanceId());

                    break;
                }
            }
        }

        model.addAttribute(
                "selectedCourse",
                selectedCourse);

        model.addAttribute(
                "selectedDate",
                attendanceDate);

        model.addAttribute(
                "students",
                students);

        return "faculty/attendance";
    }

    /*
     * Save attendance for one student.
     */
    @PostMapping("/faculty/attendance/save")
    public String saveAttendance(
            @RequestParam("studentId") int studentId,
            @RequestParam("courseId") int courseId,
            @RequestParam("attendanceDate") String attendanceDate,
            @RequestParam("status") String status,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        Faculty faculty = getLoggedInFaculty(session);

        if (faculty == null) {
            return "redirect:/login";
        }

        int facultyId = faculty.getFacultyId();

        /*
         * Security check:
         * The faculty can only save attendance
         * for their own course.
         */
        FacultyCourse selectedCourse =
                facultyCourseService.getMyCourseById(
                        courseId,
                        facultyId);

        if (selectedCourse == null) {

            redirectAttributes.addFlashAttribute(
                    "errorMessage",
                    "You are not authorized to manage this course."
            );

            return "redirect:/faculty/attendance";
        }

        try {

            LocalDate date =
                    LocalDate.parse(attendanceDate);

            facultyAttendanceService.saveAttendance(
                    studentId,
                    courseId,
                    date,
                    status
            );

            redirectAttributes.addFlashAttribute(
                    "successMessage",
                    "Attendance saved successfully."
            );

            return "redirect:/faculty/attendance"
                    + "?courseId=" + courseId
                    + "&date=" + attendanceDate;

        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "errorMessage",
                    e.getMessage()
            );

            return "redirect:/faculty/attendance"
                    + "?courseId=" + courseId
                    + "&date=" + attendanceDate;
        }
    }

    /*
     * Resolve the logged-in faculty from the session.
     */
    private Faculty getLoggedInFaculty(HttpSession session) {

        Object userIdObject =
                session.getAttribute("userId");

        if (userIdObject == null) {
            return null;
        }

        int userId;

        try {

            userId = (Integer) userIdObject;

        } catch (ClassCastException e) {

            session.invalidate();
            return null;
        }

        Faculty faculty =
                facultyService.getFacultyByUserId(userId);

        if (faculty == null) {
            session.invalidate();
            return null;
        }

        /*
         * Only ACTIVE faculty can access
         * attendance management.
         */
        if (faculty.getStatus() != null
                && !"ACTIVE".equalsIgnoreCase(
                        faculty.getStatus().trim())) {

            session.invalidate();
            return null;
        }

        return faculty;
    }
}