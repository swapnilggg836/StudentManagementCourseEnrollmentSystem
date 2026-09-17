package org.giritechhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReportRepository {

    private final JdbcTemplate jdbcTemplate;

    public ReportRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    // =========================================================
    // STUDENT REPORT
    // =========================================================

    public List<Map<String, Object>> getStudentReport(
            Integer deptId,
            Integer semester,
            LocalDate dateFrom,
            LocalDate dateTo) {

        StringBuilder sql = new StringBuilder("""
            SELECT
                s.student_id,
                s.roll_no,
                CONCAT(s.first_name, ' ', s.last_name) AS student_name,
                d.dept_code,
                d.dept_name,
                s.semester,
                s.phone,
                s.gender,
                u.email,
                u.status AS user_status,
                u.created_at
            FROM students s
            INNER JOIN departments d
                ON s.dept_id = d.dept_id
            INNER JOIN users u
                ON s.user_id = u.user_id
            WHERE 1 = 1
            """);

        java.util.List<Object> params = new java.util.ArrayList<>();

        if (deptId != null) {
            sql.append(" AND s.dept_id = ?");
            params.add(deptId);
        }

        if (semester != null) {
            sql.append(" AND s.semester = ?");
            params.add(semester);
        }

        if (dateFrom != null) {
            sql.append(" AND DATE(u.created_at) >= ?");
            params.add(dateFrom);
        }

        if (dateTo != null) {
            sql.append(" AND DATE(u.created_at) <= ?");
            params.add(dateTo);
        }

        sql.append(" ORDER BY s.student_id DESC");

        return jdbcTemplate.queryForList(
                sql.toString(),
                params.toArray()
        );
    }


    // =========================================================
    // COURSE REPORT
    // =========================================================

    public List<Map<String, Object>> getCourseReport(
            Integer deptId,
            Integer semester) {

        StringBuilder sql = new StringBuilder("""
            SELECT
                c.course_id,
                c.course_code,
                c.title,
                d.dept_code,
                d.dept_name,
                c.credits,
                c.capacity,
                COALESCE(
                    (
                        SELECT COUNT(*)
                        FROM enrollments e
                        WHERE e.course_id = c.course_id
                        AND e.status = 'ENROLLED'
                    ),
                    0
                ) AS enrolled_students,
                GREATEST(
                    c.capacity -
                    COALESCE(
                        (
                            SELECT COUNT(*)
                            FROM enrollments e2
                            WHERE e2.course_id = c.course_id
                            AND e2.status = 'ENROLLED'
                        ),
                        0
                    ),
                    0
                ) AS available_seats,
                f.faculty_id,
                CASE
                    WHEN f.faculty_id IS NOT NULL
                    THEN CONCAT(f.first_name, ' ', f.last_name)
                    ELSE NULL
                END AS faculty_name,
                c.schedule_day,
                c.schedule_time,
                c.fee_amount
            FROM courses c
            INNER JOIN departments d
                ON c.dept_id = d.dept_id
            LEFT JOIN faculty f
                ON c.faculty_id = f.faculty_id
            WHERE 1 = 1
            """);

        java.util.List<Object> params = new java.util.ArrayList<>();

        if (deptId != null) {
            sql.append(" AND c.dept_id = ?");
            params.add(deptId);
        }

        sql.append(" ORDER BY c.course_id DESC");

        return jdbcTemplate.queryForList(
                sql.toString(),
                params.toArray()
        );
    }


    // =========================================================
    // ENROLLMENT REPORT
    // =========================================================

    public List<Map<String, Object>> getEnrollmentReport(
            Integer deptId,
            Integer semester,
            String status,
            LocalDate dateFrom,
            LocalDate dateTo) {

        StringBuilder sql = new StringBuilder("""
            SELECT
                e.enrollment_id,
                e.student_id,
                CONCAT(s.first_name, ' ', s.last_name) AS student_name,
                s.roll_no,
                d.dept_code,
                d.dept_name,
                s.semester,
                e.course_id,
                c.course_code,
                c.title AS course_title,
                e.enrollment_date,
                e.status,
                e.grade
            FROM enrollments e
            INNER JOIN students s
                ON e.student_id = s.student_id
            INNER JOIN departments d
                ON s.dept_id = d.dept_id
            INNER JOIN courses c
                ON e.course_id = c.course_id
            WHERE 1 = 1
            """);

        java.util.List<Object> params = new java.util.ArrayList<>();

        if (deptId != null) {
            sql.append(" AND s.dept_id = ?");
            params.add(deptId);
        }

        if (semester != null) {
            sql.append(" AND s.semester = ?");
            params.add(semester);
        }

        if (status != null && !status.isBlank()) {
            sql.append(" AND e.status = ?");
            params.add(status);
        }

        if (dateFrom != null) {
            sql.append(" AND DATE(e.enrollment_date) >= ?");
            params.add(dateFrom);
        }

        if (dateTo != null) {
            sql.append(" AND DATE(e.enrollment_date) <= ?");
            params.add(dateTo);
        }

        sql.append(" ORDER BY e.enrollment_id DESC");

        return jdbcTemplate.queryForList(
                sql.toString(),
                params.toArray()
        );
    }


    // =========================================================
    // PAYMENT REPORT
    // =========================================================

    public List<Map<String, Object>> getPaymentReport(
            Integer semester,
            String paymentStatus,
            LocalDate dateFrom,
            LocalDate dateTo) {

        StringBuilder sql = new StringBuilder("""
            SELECT
                p.payment_id,
                p.student_id,
                CONCAT(s.first_name, ' ', s.last_name) AS student_name,
                s.roll_no,
                s.semester,
                p.transaction_ref,
                p.amount,
                p.payment_method,
                p.payment_status,
                p.payment_date
            FROM payments p
            INNER JOIN students s
                ON p.student_id = s.student_id
            WHERE 1 = 1
            """);

        java.util.List<Object> params = new java.util.ArrayList<>();

        if (semester != null) {
            sql.append(" AND s.semester = ?");
            params.add(semester);
        }

        if (paymentStatus != null && !paymentStatus.isBlank()) {
            sql.append(" AND p.payment_status = ?");
            params.add(paymentStatus);
        }

        if (dateFrom != null) {
            sql.append(" AND DATE(p.payment_date) >= ?");
            params.add(dateFrom);
        }

        if (dateTo != null) {
            sql.append(" AND DATE(p.payment_date) <= ?");
            params.add(dateTo);
        }

        sql.append(" ORDER BY p.payment_id DESC");

        return jdbcTemplate.queryForList(
                sql.toString(),
                params.toArray()
        );
    }


    // =========================================================
    // STUDENT SUMMARY
    // =========================================================

    public int getTotalStudents(
            Integer deptId,
            Integer semester) {

        StringBuilder sql = new StringBuilder("""
            SELECT COUNT(*)
            FROM students
            WHERE 1 = 1
            """);

        java.util.List<Object> params = new java.util.ArrayList<>();

        if (deptId != null) {
            sql.append(" AND dept_id = ?");
            params.add(deptId);
        }

        if (semester != null) {
            sql.append(" AND semester = ?");
            params.add(semester);
        }

        return jdbcTemplate.queryForObject(
                sql.toString(),
                Integer.class,
                params.toArray()
        );
    }


    // =========================================================
    // COURSE SUMMARY
    // =========================================================

    public int getTotalCourses(Integer deptId) {

        StringBuilder sql = new StringBuilder("""
            SELECT COUNT(*)
            FROM courses
            WHERE 1 = 1
            """);

        java.util.List<Object> params = new java.util.ArrayList<>();

        if (deptId != null) {
            sql.append(" AND dept_id = ?");
            params.add(deptId);
        }

        return jdbcTemplate.queryForObject(
                sql.toString(),
                Integer.class,
                params.toArray()
        );
    }


    public int getFullCourses(Integer deptId) {

        StringBuilder sql = new StringBuilder("""
            SELECT COUNT(*)
            FROM courses c
            WHERE c.capacity <=
                (
                    SELECT COUNT(*)
                    FROM enrollments e
                    WHERE e.course_id = c.course_id
                    AND e.status = 'ENROLLED'
                )
            """);

        java.util.List<Object> params = new java.util.ArrayList<>();

        if (deptId != null) {
            sql.append(" AND c.dept_id = ?");
            params.add(deptId);
        }

        return jdbcTemplate.queryForObject(
                sql.toString(),
                Integer.class,
                params.toArray()
        );
    }


    // =========================================================
    // ENROLLMENT SUMMARY
    // =========================================================

    public int getTotalEnrollments(
            Integer deptId,
            Integer semester,
            String status,
            LocalDate dateFrom,
            LocalDate dateTo) {

        StringBuilder sql = new StringBuilder("""
            SELECT COUNT(*)
            FROM enrollments e
            INNER JOIN students s
                ON e.student_id = s.student_id
            WHERE 1 = 1
            """);

        java.util.List<Object> params = new java.util.ArrayList<>();

        if (deptId != null) {
            sql.append(" AND s.dept_id = ?");
            params.add(deptId);
        }

        if (semester != null) {
            sql.append(" AND s.semester = ?");
            params.add(semester);
        }

        if (status != null && !status.isBlank()) {
            sql.append(" AND e.status = ?");
            params.add(status);
        }

        if (dateFrom != null) {
            sql.append(" AND DATE(e.enrollment_date) >= ?");
            params.add(dateFrom);
        }

        if (dateTo != null) {
            sql.append(" AND DATE(e.enrollment_date) <= ?");
            params.add(dateTo);
        }

        return jdbcTemplate.queryForObject(
                sql.toString(),
                Integer.class,
                params.toArray()
        );
    }


    // =========================================================
    // PAYMENT SUMMARY
    // =========================================================

    public java.math.BigDecimal getPaymentRevenue(
            Integer semester,
            String paymentStatus,
            LocalDate dateFrom,
            LocalDate dateTo) {

        StringBuilder sql = new StringBuilder("""
            SELECT COALESCE(SUM(p.amount), 0)
            FROM payments p
            INNER JOIN students s
                ON p.student_id = s.student_id
            WHERE 1 = 1
            """);

        java.util.List<Object> params = new java.util.ArrayList<>();

        if (semester != null) {
            sql.append(" AND s.semester = ?");
            params.add(semester);
        }

        if (paymentStatus != null && !paymentStatus.isBlank()) {
            sql.append(" AND p.payment_status = ?");
            params.add(paymentStatus);
        }

        if (dateFrom != null) {
            sql.append(" AND DATE(p.payment_date) >= ?");
            params.add(dateFrom);
        }

        if (dateTo != null) {
            sql.append(" AND DATE(p.payment_date) <= ?");
            params.add(dateTo);
        }

        return jdbcTemplate.queryForObject(
                sql.toString(),
                java.math.BigDecimal.class,
                params.toArray()
        );
    }


    // =========================================================
    // STATUS COUNTS
    // =========================================================

    public int getEnrollmentStatusCount(
            String status,
            Integer deptId,
            Integer semester,
            LocalDate dateFrom,
            LocalDate dateTo) {

        return getTotalEnrollments(
                deptId,
                semester,
                status,
                dateFrom,
                dateTo
        );
    }


    public int getPaymentStatusCount(
            String status,
            Integer semester,
            LocalDate dateFrom,
            LocalDate dateTo) {

        StringBuilder sql = new StringBuilder("""
            SELECT COUNT(*)
            FROM payments p
            INNER JOIN students s
                ON p.student_id = s.student_id
            WHERE p.payment_status = ?
            """);

        java.util.List<Object> params = new java.util.ArrayList<>();

        params.add(status);

        if (semester != null) {
            sql.append(" AND s.semester = ?");
            params.add(semester);
        }

        if (dateFrom != null) {
            sql.append(" AND DATE(p.payment_date) >= ?");
            params.add(dateFrom);
        }

        if (dateTo != null) {
            sql.append(" AND DATE(p.payment_date) <= ?");
            params.add(dateTo);
        }

        return jdbcTemplate.queryForObject(
                sql.toString(),
                Integer.class,
                params.toArray()
        );
    }
}