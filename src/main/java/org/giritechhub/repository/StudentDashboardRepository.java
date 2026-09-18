package org.giritechhub.repository;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.giritechhub.model.StudentDashboardStats;
import org.giritechhub.model.StudentUpcomingClass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDashboardRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // STUDENT DASHBOARD SUMMARY
    // =========================================================

    public StudentDashboardStats getDashboardStats(int userId) {

        String sql = """

            SELECT
                s.student_id,
                s.user_id,
                s.first_name,
                s.last_name,
                s.roll_no,
                s.dept_id,
                s.semester,

                u.email,

                d.dept_code,
                d.dept_name,

                (
                    SELECT COUNT(*)
                    FROM enrollments e
                    WHERE e.student_id = s.student_id
                      AND e.status = 'ENROLLED'
                ) AS enrolled_courses,

                COALESCE(
                    (
                        SELECT SUM(c.credits)
                        FROM enrollments e
                        INNER JOIN courses c
                            ON e.course_id = c.course_id
                        WHERE e.student_id = s.student_id
                          AND e.status = 'ENROLLED'
                    ),
                    0
                ) AS total_credits,

                COALESCE(
                    (
                        SELECT SUM(p.amount)
                        FROM payments p
                        WHERE p.student_id = s.student_id
                          AND p.payment_status = 'PENDING'
                    ),
                    0
                ) AS pending_fees

            FROM students s

            INNER JOIN users u
                ON s.user_id = u.user_id

            LEFT JOIN departments d
                ON s.dept_id = d.dept_id

            WHERE s.user_id = ?

            """;

        List<StudentDashboardStats> result =
                jdbcTemplate.query(
                        sql,
                        this::mapDashboardStats,
                        userId
                );

        if (result.isEmpty()) {
            return null;
        }

        return result.get(0);
    }


    // =========================================================
    // UPCOMING CLASSES
    // =========================================================

    public List<StudentUpcomingClass> getUpcomingClasses(
            int studentId) {

        String sql = """

            SELECT
                c.course_id,
                c.course_code,
                c.title,
                c.credits,

                c.schedule_day,
                c.schedule_time,

                CASE
                    WHEN f.faculty_id IS NOT NULL
                    THEN CONCAT(
                        f.first_name,
                        ' ',
                        f.last_name
                    )
                    ELSE 'Faculty Not Assigned'
                END AS faculty_name

            FROM enrollments e

            INNER JOIN courses c
                ON e.course_id = c.course_id

            LEFT JOIN faculty f
                ON c.faculty_id = f.faculty_id

            WHERE e.student_id = ?
              AND e.status = 'ENROLLED'

            ORDER BY
                CASE UPPER(c.schedule_day)

                    WHEN 'MONDAY' THEN 1
                    WHEN 'TUESDAY' THEN 2
                    WHEN 'WEDNESDAY' THEN 3
                    WHEN 'THURSDAY' THEN 4
                    WHEN 'FRIDAY' THEN 5
                    WHEN 'SATURDAY' THEN 6
                    WHEN 'SUNDAY' THEN 7

                    ELSE 8

                END,

                c.schedule_time

            LIMIT 5

            """;

        return jdbcTemplate.query(
                sql,
                this::mapUpcomingClass,
                studentId
        );
    }


    // =========================================================
    // MAP DASHBOARD STATS
    // =========================================================

    private StudentDashboardStats mapDashboardStats(
            ResultSet rs,
            int rowNum) throws SQLException {

        StudentDashboardStats stats =
                new StudentDashboardStats();

        stats.setStudentId(
                rs.getInt("student_id")
        );

        stats.setUserId(
                rs.getInt("user_id")
        );

        stats.setFirstName(
                rs.getString("first_name")
        );

        stats.setLastName(
                rs.getString("last_name")
        );

        stats.setEmail(
                rs.getString("email")
        );

        stats.setRollNo(
                rs.getString("roll_no")
        );

        stats.setDeptId(
                rs.getInt("dept_id")
        );

        stats.setDepartmentCode(
                rs.getString("dept_code")
        );

        stats.setDepartmentName(
                rs.getString("dept_name")
        );

        stats.setSemester(
                rs.getInt("semester")
        );

        stats.setEnrolledCourses(
                rs.getInt("enrolled_courses")
        );

        stats.setTotalCredits(
                rs.getInt("total_credits")
        );

        BigDecimal pendingFees =
                rs.getBigDecimal("pending_fees");

        stats.setPendingFees(pendingFees);

        return stats;
    }


    // =========================================================
    // MAP UPCOMING CLASS
    // =========================================================

    private StudentUpcomingClass mapUpcomingClass(
            ResultSet rs,
            int rowNum) throws SQLException {

        StudentUpcomingClass upcomingClass =
                new StudentUpcomingClass();

        upcomingClass.setCourseId(
                rs.getInt("course_id")
        );

        upcomingClass.setCourseCode(
                rs.getString("course_code")
        );

        upcomingClass.setCourseTitle(
                rs.getString("title")
        );

        upcomingClass.setCredits(
                rs.getInt("credits")
        );

        upcomingClass.setFacultyName(
                rs.getString("faculty_name")
        );

        upcomingClass.setScheduleDay(
                rs.getString("schedule_day")
        );

        upcomingClass.setScheduleTime(
                rs.getString("schedule_time")
        );

        return upcomingClass;
    }
}