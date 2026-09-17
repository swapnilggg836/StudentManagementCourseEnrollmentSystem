package org.giritechhub.repository;

import java.util.List;

import org.giritechhub.model.CourseEnrollment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EnrollmentRepository {

    private final JdbcTemplate jdbcTemplate;

    public EnrollmentRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // =========================================================
    // GET ALL ENROLLMENTS
    // =========================================================

    public List<CourseEnrollment> findAll() {

        String sql = """
                SELECT
                    e.enrollment_id,
                    e.student_id,
                    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
                    s.roll_no,

                    e.course_id,
                    c.course_code,
                    c.title AS course_title,

                    d.dept_id,
                    d.dept_code AS department_code,
                    d.dept_name AS department_name,

                    s.semester,

                    e.enrollment_date,
                    e.status,
                    e.grade

                FROM enrollments e

                INNER JOIN students s
                    ON e.student_id = s.student_id

                INNER JOIN courses c
                    ON e.course_id = c.course_id

                INNER JOIN departments d
                    ON s.dept_id = d.dept_id

                ORDER BY e.enrollment_id DESC
                """;

        return jdbcTemplate.query(sql, (rs, rowNum) -> mapRow(rs));
    }


    // =========================================================
    // GET ENROLLMENT BY ID
    // =========================================================

    public CourseEnrollment findById(int enrollmentId) {

        String sql = """
                SELECT
                    e.enrollment_id,
                    e.student_id,
                    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
                    s.roll_no,

                    e.course_id,
                    c.course_code,
                    c.title AS course_title,

                    d.dept_id,
                    d.dept_code AS department_code,
                    d.dept_name AS department_name,

                    s.semester,

                    e.enrollment_date,
                    e.status,
                    e.grade

                FROM enrollments e

                INNER JOIN students s
                    ON e.student_id = s.student_id

                INNER JOIN courses c
                    ON e.course_id = c.course_id

                INNER JOIN departments d
                    ON s.dept_id = d.dept_id

                WHERE e.enrollment_id = ?
                """;

        List<CourseEnrollment> list =
                jdbcTemplate.query(sql,
                        (rs, rowNum) -> mapRow(rs),
                        enrollmentId);

        return list.isEmpty() ? null : list.get(0);
    }


    // =========================================================
    // SEARCH / FILTER ENROLLMENTS
    // =========================================================

    public List<CourseEnrollment> search(
            Integer studentId,
            Integer courseId,
            Integer deptId,
            Integer semester,
            String status) {

        StringBuilder sql = new StringBuilder("""
                SELECT
                    e.enrollment_id,
                    e.student_id,
                    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
                    s.roll_no,

                    e.course_id,
                    c.course_code,
                    c.title AS course_title,

                    d.dept_id,
                    d.dept_code AS department_code,
                    d.dept_name AS department_name,

                    s.semester,

                    e.enrollment_date,
                    e.status,
                    e.grade

                FROM enrollments e

                INNER JOIN students s
                    ON e.student_id = s.student_id

                INNER JOIN courses c
                    ON e.course_id = c.course_id

                INNER JOIN departments d
                    ON s.dept_id = d.dept_id

                WHERE 1 = 1
                """);

        java.util.List<Object> params = new java.util.ArrayList<>();


        // Student filter
        if (studentId != null) {
            sql.append(" AND e.student_id = ?");
            params.add(studentId);
        }


        // Course filter
        if (courseId != null) {
            sql.append(" AND e.course_id = ?");
            params.add(courseId);
        }


        // Department filter
        if (deptId != null) {
            sql.append(" AND s.dept_id = ?");
            params.add(deptId);
        }


        // Semester filter
        if (semester != null) {
            sql.append(" AND s.semester = ?");
            params.add(semester);
        }


        // Status filter
        if (status != null && !status.isBlank()) {
            sql.append(" AND e.status = ?");
            params.add(status);
        }


        sql.append(" ORDER BY e.enrollment_id DESC");


        return jdbcTemplate.query(
                sql.toString(),
                (rs, rowNum) -> mapRow(rs),
                params.toArray()
        );
    }


    // =========================================================
    // ADD ENROLLMENT
    // =========================================================

    public int save(CourseEnrollment enrollment) {

        String sql = """
                INSERT INTO enrollments
                (
                    student_id,
                    course_id,
                    enrollment_date,
                    status,
                    grade
                )
                VALUES (?, ?, CURRENT_TIMESTAMP, ?, ?)
                """;

        return jdbcTemplate.update(
                sql,
                enrollment.getStudentId(),
                enrollment.getCourseId(),
                enrollment.getStatus(),
                enrollment.getGrade()
        );
    }


    // =========================================================
    // UPDATE ENROLLMENT
    // =========================================================

    public int update(CourseEnrollment enrollment) {

        String sql = """
                UPDATE enrollments
                SET
                    student_id = ?,
                    course_id = ?,
                    status = ?,
                    grade = ?
                WHERE enrollment_id = ?
                """;

        return jdbcTemplate.update(
                sql,
                enrollment.getStudentId(),
                enrollment.getCourseId(),
                enrollment.getStatus(),
                enrollment.getGrade(),
                enrollment.getEnrollmentId()
        );
    }


    // =========================================================
    // DROP ENROLLMENT
    // =========================================================

    public int drop(int enrollmentId) {

        String sql = """
                UPDATE enrollments
                SET status = 'DROPPED'
                WHERE enrollment_id = ?
                """;

        return jdbcTemplate.update(sql, enrollmentId);
    }


    // =========================================================
    // MARK COMPLETED
    // =========================================================

    public int complete(int enrollmentId, String grade) {

        String sql = """
                UPDATE enrollments
                SET
                    status = 'COMPLETED',
                    grade = ?
                WHERE enrollment_id = ?
                """;

        return jdbcTemplate.update(
                sql,
                grade,
                enrollmentId
        );
    }


    // =========================================================
    // DELETE ENROLLMENT
    // =========================================================

    public int delete(int enrollmentId) {

        String sql = """
                DELETE FROM enrollments
                WHERE enrollment_id = ?
                """;

        return jdbcTemplate.update(sql, enrollmentId);
    }


    // =========================================================
    // CHECK DUPLICATE ENROLLMENT
    // =========================================================

    public boolean exists(int studentId, int courseId) {

        String sql = """
                SELECT COUNT(*)
                FROM enrollments
                WHERE student_id = ?
                  AND course_id = ?
                  AND status = 'ENROLLED'
                """;

        Integer count = jdbcTemplate.queryForObject(
                sql,
                Integer.class,
                studentId,
                courseId
        );

        return count != null && count > 0;
    }


    // =========================================================
    // COUNT ENROLLMENTS
    // =========================================================

    public int countAll() {

        String sql = """
                SELECT COUNT(*)
                FROM enrollments
                """;

        Integer count =
                jdbcTemplate.queryForObject(sql, Integer.class);

        return count == null ? 0 : count;
    }


    // =========================================================
    // COUNT BY STATUS
    // =========================================================

    public int countByStatus(String status) {

        String sql = """
                SELECT COUNT(*)
                FROM enrollments
                WHERE status = ?
                """;

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        status
                );

        return count == null ? 0 : count;
    }


    // =========================================================
    // ROW MAPPER
    // =========================================================

    private CourseEnrollment mapRow(
            java.sql.ResultSet rs) throws java.sql.SQLException {

        CourseEnrollment enrollment =
                new CourseEnrollment();

        enrollment.setEnrollmentId(
                rs.getInt("enrollment_id")
        );

        enrollment.setStudentId(
                rs.getInt("student_id")
        );

        enrollment.setStudentName(
                rs.getString("student_name")
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
                rs.getString("course_title")
        );

        enrollment.setDeptId(
                rs.getInt("dept_id")
        );

        enrollment.setDepartmentCode(
                rs.getString("department_code")
        );

        enrollment.setDepartmentName(
                rs.getString("department_name")
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