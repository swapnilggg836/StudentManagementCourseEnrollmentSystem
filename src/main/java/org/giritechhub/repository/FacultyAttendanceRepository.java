package org.giritechhub.repository;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.giritechhub.model.Attendance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FacultyAttendanceRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /*
     * Get all students enrolled in a particular course.
     * Only ENROLLED students are included.
     */
    public List<Attendance> getCourseStudents(int courseId) {

        String sql = """
                SELECT
                    s.student_id,
                    s.first_name,
                    s.last_name,
                    s.roll_no,
                    c.course_id,
                    c.course_code,
                    c.title
                FROM students s
                INNER JOIN enrollments e
                    ON s.student_id = e.student_id
                INNER JOIN courses c
                    ON e.course_id = c.course_id
                WHERE c.course_id = ?
                  AND e.status = 'ENROLLED'
                ORDER BY s.roll_no
                """;

        return jdbcTemplate.query(sql, (rs, rowNum) -> {

            Attendance attendance = new Attendance();

            attendance.setStudentId(rs.getInt("student_id"));

            String firstName = rs.getString("first_name");
            String lastName = rs.getString("last_name");

            attendance.setStudentName(
                    ((firstName == null ? "" : firstName) + " "
                    + (lastName == null ? "" : lastName)).trim()
            );

            attendance.setRollNo(rs.getString("roll_no"));

            attendance.setCourseId(rs.getInt("course_id"));
            attendance.setCourseCode(rs.getString("course_code"));
            attendance.setCourseTitle(rs.getString("title"));

            return attendance;
        }, courseId);
    }

    /*
     * Get attendance records for a course and date.
     */
    public List<Attendance> getAttendanceByCourseAndDate(
            int courseId,
            LocalDate attendanceDate) {

        String sql = """
                SELECT
                    a.attendance_id,
                    a.student_id,
                    s.first_name,
                    s.last_name,
                    s.roll_no,
                    a.course_id,
                    c.course_code,
                    c.title,
                    a.attendance_date,
                    a.status
                FROM attendance a
                INNER JOIN students s
                    ON a.student_id = s.student_id
                INNER JOIN courses c
                    ON a.course_id = c.course_id
                WHERE a.course_id = ?
                  AND a.attendance_date = ?
                ORDER BY s.roll_no
                """;

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Attendance attendance = new Attendance();

                    attendance.setAttendanceId(
                            rs.getInt("attendance_id"));

                    attendance.setStudentId(
                            rs.getInt("student_id"));

                    String firstName = rs.getString("first_name");
                    String lastName = rs.getString("last_name");

                    attendance.setStudentName(
                            ((firstName == null ? "" : firstName) + " "
                            + (lastName == null ? "" : lastName)).trim()
                    );

                    attendance.setRollNo(
                            rs.getString("roll_no"));

                    attendance.setCourseId(
                            rs.getInt("course_id"));

                    attendance.setCourseCode(
                            rs.getString("course_code"));

                    attendance.setCourseTitle(
                            rs.getString("title"));

                    Date date = rs.getDate("attendance_date");

                    if (date != null) {
                        attendance.setAttendanceDate(
                                date.toLocalDate());
                    }

                    attendance.setStatus(
                            rs.getString("status"));

                    return attendance;
                },
                courseId,
                Date.valueOf(attendanceDate)
        );
    }

    /*
     * Check whether attendance already exists
     * for a student, course and date.
     */
    public boolean attendanceExists(
            int studentId,
            int courseId,
            LocalDate attendanceDate) {

        String sql = """
                SELECT COUNT(*)
                FROM attendance
                WHERE student_id = ?
                  AND course_id = ?
                  AND attendance_date = ?
                """;

        Integer count = jdbcTemplate.queryForObject(
                sql,
                Integer.class,
                studentId,
                courseId,
                Date.valueOf(attendanceDate)
        );

        return count != null && count > 0;
    }

    /*
     * Insert attendance record.
     */
    public void saveAttendance(Attendance attendance) {

        String sql = """
                INSERT INTO attendance
                (
                    student_id,
                    course_id,
                    attendance_date,
                    status
                )
                VALUES (?, ?, ?, ?)
                """;

        jdbcTemplate.update(
                sql,
                attendance.getStudentId(),
                attendance.getCourseId(),
                Date.valueOf(attendance.getAttendanceDate()),
                attendance.getStatus()
        );
    }

    /*
     * Update existing attendance record.
     */
    public void updateAttendance(Attendance attendance) {

        String sql = """
                UPDATE attendance
                SET status = ?
                WHERE student_id = ?
                  AND course_id = ?
                  AND attendance_date = ?
                """;

        jdbcTemplate.update(
                sql,
                attendance.getStatus(),
                attendance.getStudentId(),
                attendance.getCourseId(),
                Date.valueOf(attendance.getAttendanceDate())
        );
    }

    /*
     * Get a single attendance record.
     */
    public Attendance getAttendance(
            int studentId,
            int courseId,
            LocalDate attendanceDate) {

        String sql = """
                SELECT
                    a.attendance_id,
                    a.student_id,
                    s.first_name,
                    s.last_name,
                    s.roll_no,
                    a.course_id,
                    c.course_code,
                    c.title,
                    a.attendance_date,
                    a.status
                FROM attendance a
                INNER JOIN students s
                    ON a.student_id = s.student_id
                INNER JOIN courses c
                    ON a.course_id = c.course_id
                WHERE a.student_id = ?
                  AND a.course_id = ?
                  AND a.attendance_date = ?
                """;

        List<Attendance> results = jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Attendance attendance = new Attendance();

                    attendance.setAttendanceId(
                            rs.getInt("attendance_id"));

                    attendance.setStudentId(
                            rs.getInt("student_id"));

                    String firstName = rs.getString("first_name");
                    String lastName = rs.getString("last_name");

                    attendance.setStudentName(
                            ((firstName == null ? "" : firstName) + " "
                            + (lastName == null ? "" : lastName)).trim()
                    );

                    attendance.setRollNo(
                            rs.getString("roll_no"));

                    attendance.setCourseId(
                            rs.getInt("course_id"));

                    attendance.setCourseCode(
                            rs.getString("course_code"));

                    attendance.setCourseTitle(
                            rs.getString("title"));

                    Date date = rs.getDate("attendance_date");

                    if (date != null) {
                        attendance.setAttendanceDate(
                                date.toLocalDate());
                    }

                    attendance.setStatus(
                            rs.getString("status"));

                    return attendance;
                },
                studentId,
                courseId,
                Date.valueOf(attendanceDate)
        );

        if (results.isEmpty()) {
            return null;
        }

        return results.get(0);
    }
}