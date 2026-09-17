package org.giritechhub.repository;

import java.util.List;

import org.giritechhub.model.DashboardStats;
import org.giritechhub.model.DepartmentShare;
import org.giritechhub.model.DepartmentSummary;
import org.giritechhub.model.EnrollmentTrend;
import org.giritechhub.model.RecentActivity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DashboardRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // DASHBOARD STATISTICS
    // =========================================================

    public DashboardStats getDashboardStats() {

        String studentsSql =
                "SELECT COUNT(*) FROM students";

        String coursesSql =
                "SELECT COUNT(*) FROM courses";

        String facultySql =
                "SELECT COUNT(*) FROM faculty";

        String enrollmentsSql =
                "SELECT COUNT(*) FROM enrollments";

        String pendingPaymentsSql =
                "SELECT COUNT(*) FROM payments " +
                "WHERE payment_status = 'PENDING'";

        String revenueSql =
                "SELECT COALESCE(SUM(amount), 0) " +
                "FROM payments " +
                "WHERE payment_status = 'PAID'";


        int totalStudents =
                jdbcTemplate.queryForObject(
                        studentsSql,
                        Integer.class
                );

        int totalCourses =
                jdbcTemplate.queryForObject(
                        coursesSql,
                        Integer.class
                );

        int totalFaculty =
                jdbcTemplate.queryForObject(
                        facultySql,
                        Integer.class
                );

        int totalEnrollments =
                jdbcTemplate.queryForObject(
                        enrollmentsSql,
                        Integer.class
                );

        int pendingPayments =
                jdbcTemplate.queryForObject(
                        pendingPaymentsSql,
                        Integer.class
                );

        Double totalRevenue =
                jdbcTemplate.queryForObject(
                        revenueSql,
                        Double.class
                );


        return new DashboardStats(
                totalStudents,
                totalCourses,
                totalFaculty,
                totalEnrollments,
                pendingPayments,
                totalRevenue != null
                        ? totalRevenue
                        : 0.0
        );
    }


    // =========================================================
    // ENROLLMENT TREND
    // =========================================================

    public List<EnrollmentTrend> getEnrollmentTrend() {

        String sql =
                "SELECT " +
                "DATE_FORMAT(enrollment_date, '%Y-%m') AS month, " +
                "COUNT(*) AS total_enrollments " +
                "FROM enrollments " +
                "GROUP BY DATE_FORMAT(enrollment_date, '%Y-%m') " +
                "ORDER BY month";


        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    EnrollmentTrend trend =
                            new EnrollmentTrend();

                    trend.setMonth(
                            rs.getString("month")
                    );

                    trend.setTotalEnrollments(
                            rs.getInt("total_enrollments")
                    );

                    return trend;
                }
        );
    }


    // =========================================================
    // DEPARTMENT SHARE
    // =========================================================

    public List<DepartmentShare> getDepartmentShare() {

        String sql =
                "SELECT " +
                "d.dept_code, " +
                "d.dept_name, " +
                "COUNT(s.student_id) AS student_count " +
                "FROM departments d " +
                "LEFT JOIN students s " +
                "ON d.dept_id = s.dept_id " +
                "GROUP BY " +
                "d.dept_id, " +
                "d.dept_code, " +
                "d.dept_name " +
                "ORDER BY student_count DESC";


        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    DepartmentShare share =
                            new DepartmentShare();

                    share.setDepartmentCode(
                            rs.getString("dept_code")
                    );

                    share.setDepartmentName(
                            rs.getString("dept_name")
                    );

                    share.setStudentCount(
                            rs.getInt("student_count")
                    );

                    return share;
                }
        );
    }


    // =========================================================
    // DEPARTMENT OPERATIONAL SUMMARY
    // =========================================================

    public List<DepartmentSummary> getDepartmentSummary() {

        String sql =
                "SELECT " +
                "d.dept_code, " +
                "d.dept_name, " +
                "COUNT(DISTINCT s.student_id) AS student_count, " +
                "COUNT(DISTINCT c.course_id) AS course_count, " +
                "COUNT(DISTINCT f.faculty_id) AS faculty_count, " +
                "COUNT(DISTINCT e.enrollment_id) AS enrollment_count " +
                "FROM departments d " +

                "LEFT JOIN students s " +
                "ON d.dept_id = s.dept_id " +

                "LEFT JOIN courses c " +
                "ON d.dept_id = c.dept_id " +

                "LEFT JOIN faculty f " +
                "ON d.dept_id = f.dept_id " +

                "LEFT JOIN enrollments e " +
                "ON s.student_id = e.student_id " +

                "GROUP BY " +
                "d.dept_id, " +
                "d.dept_code, " +
                "d.dept_name " +

                "ORDER BY d.dept_name";


        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    DepartmentSummary summary =
                            new DepartmentSummary();


                    summary.setDepartmentCode(
                            rs.getString("dept_code")
                    );

                    summary.setDepartmentName(
                            rs.getString("dept_name")
                    );


                    int studentCount =
                            rs.getInt("student_count");

                    int courseCount =
                            rs.getInt("course_count");

                    int facultyCount =
                            rs.getInt("faculty_count");

                    int enrollmentCount =
                            rs.getInt("enrollment_count");


                    summary.setStudentCount(
                            studentCount
                    );

                    summary.setCourseCount(
                            courseCount
                    );

                    summary.setFacultyCount(
                            facultyCount
                    );


                    double enrollmentPercentage = 0.0;


                    if (studentCount > 0) {

                        enrollmentPercentage =
                                ((double) enrollmentCount
                                / studentCount)
                                * 100.0;
                    }


                    if (enrollmentPercentage > 100.0) {

                        enrollmentPercentage = 100.0;
                    }


                    summary.setEnrollmentPercentage(
                            enrollmentPercentage
                    );


                    if (
                            studentCount > 0 ||
                            courseCount > 0 ||
                            facultyCount > 0
                    ) {

                        summary.setStatus("Active");

                    } else {

                        summary.setStatus("Inactive");
                    }


                    return summary;
                }
        );
    }


    // =========================================================
    // RECENT ACTIVITY
    // =========================================================

    public List<RecentActivity> getRecentActivity() {

        String sql =
                "SELECT * FROM (" +

                // -------------------------------------------------
                // ENROLLMENT ACTIVITY
                // -------------------------------------------------

                "SELECT " +
                "'ENROLLMENT' AS activity_type, " +

                "CONCAT(" +
                "s.first_name, ' ', s.last_name, " +
                "' enrolled in ', c.title" +
                ") AS description, " +

                "c.course_code AS reference, " +

                "e.status AS status, " +

                "DATE_FORMAT(" +
                "e.enrollment_date, " +
                "'%d-%m-%Y %h:%i %p'" +
                ") AS activity_date, " +

                "e.enrollment_date AS sort_date " +

                "FROM enrollments e " +

                "INNER JOIN students s " +
                "ON e.student_id = s.student_id " +

                "INNER JOIN courses c " +
                "ON e.course_id = c.course_id " +

                "UNION ALL " +

                // -------------------------------------------------
                // PAYMENT ACTIVITY
                // -------------------------------------------------

                "SELECT " +
                "'PAYMENT' AS activity_type, " +

                "CONCAT(" +
                "s.first_name, ' ', s.last_name, " +
                "' made a payment of ₹', " +
                "p.amount" +
                ") AS description, " +

                "p.transaction_ref AS reference, " +

                "p.payment_status AS status, " +

                "DATE_FORMAT(" +
                "p.payment_date, " +
                "'%d-%m-%Y %h:%i %p'" +
                ") AS activity_date, " +

                "p.payment_date AS sort_date " +

                "FROM payments p " +

                "INNER JOIN students s " +
                "ON p.student_id = s.student_id " +

                ") AS activities " +

                "ORDER BY sort_date DESC " +

                "LIMIT 10";


        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    RecentActivity activity =
                            new RecentActivity();


                    activity.setActivityType(
                            rs.getString("activity_type")
                    );

                    activity.setDescription(
                            rs.getString("description")
                    );

                    activity.setReference(
                            rs.getString("reference")
                    );

                    activity.setStatus(
                            rs.getString("status")
                    );

                    activity.setActivityDate(
                            rs.getString("activity_date")
                    );


                    return activity;
                }
        );
    }
}