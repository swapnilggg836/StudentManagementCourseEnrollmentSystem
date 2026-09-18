package org.giritechhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.giritechhub.model.CourseEnrollment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class StudentEnrollmentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // CHECK WHETHER STUDENT IS ALREADY ENROLLED
    // =========================================================
    //
    // IMPORTANT:
    // Only ENROLLED status blocks a new enrollment.
    //
    // DROPPED status does NOT block re-enrollment.
    // =========================================================

    public boolean isAlreadyEnrolled(
            int studentId,
            int courseId) {

        String sql =
                "SELECT COUNT(*) " +
                "FROM enrollments " +
                "WHERE student_id = ? " +
                "AND course_id = ? " +
                "AND status = 'ENROLLED'";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        studentId,
                        courseId
                );

        return count != null && count > 0;
    }


    // =========================================================
    // CHECK AVAILABLE SEATS
    // =========================================================

    public int getAvailableSeats(int courseId) {

        String sql =
                "SELECT GREATEST(" +
                "c.capacity - " +
                "COALESCE(" +
                "(SELECT COUNT(*) " +
                "FROM enrollments e " +
                "WHERE e.course_id = c.course_id " +
                "AND e.status = 'ENROLLED'), " +
                "0), " +
                "0) " +
                "FROM courses c " +
                "WHERE c.course_id = ?";

        Integer seats =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        courseId
                );

        return seats == null ? 0 : seats;
    }


    // =========================================================
    // CHECK COURSE EXISTS
    // =========================================================

    public boolean courseExists(int courseId) {

        String sql =
                "SELECT COUNT(*) " +
                "FROM courses " +
                "WHERE course_id = ?";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        courseId
                );

        return count != null && count > 0;
    }


    // =========================================================
    // CREATE / REACTIVATE ENROLLMENT
    // =========================================================
    //
    // CASE 1:
    // No previous enrollment
    //      -> INSERT new ENROLLED row
    //
    // CASE 2:
    // Previous enrollment is DROPPED
    //      -> UPDATE existing row to ENROLLED
    //
    // CASE 3:
    // Previous enrollment is ENROLLED
    //      -> StudentPaymentService blocks it before this method
    //
    // =========================================================

    public int save(
            int studentId,
            int courseId) {


        // -----------------------------------------------------
        // CHECK WHETHER RECORD ALREADY EXISTS
        // -----------------------------------------------------

        String checkSql =
                "SELECT COUNT(*) " +
                "FROM enrollments " +
                "WHERE student_id = ? " +
                "AND course_id = ?";

        Integer count =
                jdbcTemplate.queryForObject(
                        checkSql,
                        Integer.class,
                        studentId,
                        courseId
                );


        // -----------------------------------------------------
        // EXISTING RECORD
        // -----------------------------------------------------

        if (count != null && count > 0) {

            String updateSql =
                    "UPDATE enrollments " +
                    "SET status = 'ENROLLED', " +
                    "grade = NULL, " +
                    "enrollment_date = CURRENT_TIMESTAMP " +
                    "WHERE student_id = ? " +
                    "AND course_id = ? " +
                    "AND status = 'DROPPED'";

            return jdbcTemplate.update(
                    updateSql,
                    studentId,
                    courseId
            );
        }


        // -----------------------------------------------------
        // NEW RECORD
        // -----------------------------------------------------

        String insertSql =
                "INSERT INTO enrollments " +
                "(student_id, course_id, status) " +
                "VALUES (?, ?, 'ENROLLED')";

        return jdbcTemplate.update(
                insertSql,
                studentId,
                courseId
        );
    }


    // =========================================================
    // GET STUDENT ENROLLMENTS
    // =========================================================

    public List<CourseEnrollment> findByStudentId(
            int studentId) {

        String sql =
                "SELECT " +
                "e.enrollment_id, " +
                "e.student_id, " +
                "s.first_name, " +
                "s.last_name, " +
                "s.roll_no, " +
                "e.course_id, " +
                "c.course_code, " +
                "c.title, " +
                "c.credits, " +
                "s.dept_id, " +
                "d.dept_code, " +
                "d.dept_name, " +
                "s.semester, " +
                "e.enrollment_date, " +
                "e.status, " +
                "e.grade " +
                "FROM enrollments e " +
                "INNER JOIN students s " +
                "ON e.student_id = s.student_id " +
                "INNER JOIN courses c " +
                "ON e.course_id = c.course_id " +
                "LEFT JOIN departments d " +
                "ON s.dept_id = d.dept_id " +
                "WHERE e.student_id = ? " +
                "ORDER BY e.enrollment_date DESC";

        return jdbcTemplate.query(
                sql,
                new EnrollmentRowMapper(),
                studentId
        );
    }


    // =========================================================
    // GET ONE ENROLLMENT
    // =========================================================

    public CourseEnrollment findById(
            int enrollmentId,
            int studentId) {

        String sql =
                "SELECT " +
                "e.enrollment_id, " +
                "e.student_id, " +
                "s.first_name, " +
                "s.last_name, " +
                "s.roll_no, " +
                "e.course_id, " +
                "c.course_code, " +
                "c.title, " +
                "c.credits, " +
                "s.dept_id, " +
                "d.dept_code, " +
                "d.dept_name, " +
                "s.semester, " +
                "e.enrollment_date, " +
                "e.status, " +
                "e.grade " +
                "FROM enrollments e " +
                "INNER JOIN students s " +
                "ON e.student_id = s.student_id " +
                "INNER JOIN courses c " +
                "ON e.course_id = c.course_id " +
                "LEFT JOIN departments d " +
                "ON s.dept_id = d.dept_id " +
                "WHERE e.enrollment_id = ? " +
                "AND e.student_id = ?";

        List<CourseEnrollment> result =
                jdbcTemplate.query(
                        sql,
                        new EnrollmentRowMapper(),
                        enrollmentId,
                        studentId
                );

        if (result.isEmpty()) {
            return null;
        }

        return result.get(0);
    }


    // =========================================================
    // DROP ENROLLMENT
    // =========================================================

    public int dropEnrollment(
            int enrollmentId,
            int studentId) {

        String sql =
                "UPDATE enrollments " +
                "SET status = 'DROPPED' " +
                "WHERE enrollment_id = ? " +
                "AND student_id = ? " +
                "AND status = 'ENROLLED'";

        return jdbcTemplate.update(
                sql,
                enrollmentId,
                studentId
        );
    }


    // =========================================================
    // ROW MAPPER
    // =========================================================

    private static class EnrollmentRowMapper
            implements RowMapper<CourseEnrollment> {

        @Override
        public CourseEnrollment mapRow(
                ResultSet rs,
                int rowNum)
                throws SQLException {

            CourseEnrollment enrollment =
                    new CourseEnrollment();


            enrollment.setEnrollmentId(
                    rs.getInt("enrollment_id")
            );


            enrollment.setStudentId(
                    rs.getInt("student_id")
            );


            enrollment.setStudentName(
                    rs.getString("first_name")
                    + " "
                    + rs.getString("last_name")
            );


            enrollment.setRollNo(
                    rs.getString("roll_no")
            );


            enrollment.setCourseId(
                    rs.getInt("course_id")
            );


            enrollment.setCourseCode(
                    rs.getString("course_code")
            );


            enrollment.setCourseTitle(
                    rs.getString("title")
            );


            enrollment.setCredits(
                    rs.getInt("credits")
            );


            enrollment.setDeptId(
                    rs.getInt("dept_id")
            );


            enrollment.setDepartmentCode(
                    rs.getString("dept_code")
            );


            enrollment.setDepartmentName(
                    rs.getString("dept_name")
            );


            enrollment.setSemester(
                    rs.getInt("semester")
            );


            if (rs.getTimestamp("enrollment_date") != null) {

                enrollment.setEnrollmentDate(
                        rs.getTimestamp("enrollment_date")
                                .toLocalDateTime()
                );
            }


            enrollment.setStatus(
                    rs.getString("status")
            );


            enrollment.setGrade(
                    rs.getString("grade")
            );


            return enrollment;
        }
    }
}