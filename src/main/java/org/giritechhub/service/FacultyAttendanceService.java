package org.giritechhub.service;

import java.time.LocalDate;
import java.util.List;

import org.giritechhub.model.Attendance;
import org.giritechhub.repository.FacultyAttendanceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FacultyAttendanceService {

    @Autowired
    private FacultyAttendanceRepository facultyAttendanceRepository;

    /*
     * Get all students enrolled in a course.
     */
    public List<Attendance> getCourseStudents(int courseId) {

        if (courseId <= 0) {
            throw new IllegalArgumentException("Invalid course.");
        }

        return facultyAttendanceRepository.getCourseStudents(courseId);
    }

    /*
     * Get attendance records for a particular course and date.
     */
    public List<Attendance> getAttendanceByCourseAndDate(
            int courseId,
            LocalDate attendanceDate) {

        if (courseId <= 0) {
            throw new IllegalArgumentException("Invalid course.");
        }

        if (attendanceDate == null) {
            throw new IllegalArgumentException(
                    "Attendance date is required.");
        }

        return facultyAttendanceRepository
                .getAttendanceByCourseAndDate(
                        courseId,
                        attendanceDate);
    }

    /*
     * Save or update attendance.
     *
     * If attendance already exists for the same
     * student + course + date, it will be updated.
     * Otherwise a new record will be inserted.
     */
    @Transactional
    public void saveAttendance(
            int studentId,
            int courseId,
            LocalDate attendanceDate,
            String status) {

        if (studentId <= 0) {
            throw new IllegalArgumentException("Invalid student.");
        }

        if (courseId <= 0) {
            throw new IllegalArgumentException("Invalid course.");
        }

        if (attendanceDate == null) {
            throw new IllegalArgumentException(
                    "Attendance date is required.");
        }

        if (status == null ||
                (!"PRESENT".equalsIgnoreCase(status)
                && !"ABSENT".equalsIgnoreCase(status))) {

            throw new IllegalArgumentException(
                    "Attendance status must be PRESENT or ABSENT.");
        }

        String normalizedStatus =
                status.trim().toUpperCase();

        Attendance attendance = new Attendance();

        attendance.setStudentId(studentId);
        attendance.setCourseId(courseId);
        attendance.setAttendanceDate(attendanceDate);
        attendance.setStatus(normalizedStatus);

        boolean exists =
                facultyAttendanceRepository.attendanceExists(
                        studentId,
                        courseId,
                        attendanceDate);

        if (exists) {

            facultyAttendanceRepository
                    .updateAttendance(attendance);

        } else {

            facultyAttendanceRepository
                    .saveAttendance(attendance);
        }
    }

    /*
     * Get one attendance record.
     */
    public Attendance getAttendance(
            int studentId,
            int courseId,
            LocalDate attendanceDate) {

        if (studentId <= 0 || courseId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid student or course.");
        }

        if (attendanceDate == null) {
            throw new IllegalArgumentException(
                    "Attendance date is required.");
        }

        return facultyAttendanceRepository.getAttendance(
                studentId,
                courseId,
                attendanceDate);
    }
}