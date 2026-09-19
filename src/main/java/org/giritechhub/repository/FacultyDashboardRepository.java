package org.giritechhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.giritechhub.model.FacultyDashboardStats;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class FacultyDashboardRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // GET FACULTY DASHBOARD STATISTICS
    // =========================================================

    public FacultyDashboardStats getDashboardStats(int facultyId) {

        String sql = """
                SELECT
                    f.faculty_id,

                    CONCAT(
                        COALESCE(f.first_name, ''),
                        ' ',
                        COALESCE(f.last_name, '')
                    ) AS faculty_name,

                    d.dept_name,
                    d.dept_code,

                    f.designation,

                    (
                        SELECT COUNT(*)
                        FROM courses c
                        WHERE c.faculty_id = f.faculty_id
                    ) AS assigned_courses,

                    (
                        SELECT COUNT(DISTINCT e.student_id)
                        FROM enrollments e
                        INNER JOIN courses c
                            ON e.course_id = c.course_id
                        WHERE c.faculty_id = f.faculty_id
                        AND e.status = 'ENROLLED'
                    ) AS total_students,

                    (
                        SELECT COALESCE(SUM(c.capacity), 0)
                        FROM courses c
                        WHERE c.faculty_id = f.faculty_id
                    ) AS total_capacity

                FROM faculty f

                LEFT JOIN departments d
                    ON f.dept_id = d.dept_id

                WHERE f.faculty_id = ?
                """;


        List<FacultyDashboardStats> result =
                jdbcTemplate.query(
                        sql,
                        new FacultyDashboardStatsRowMapper(),
                        facultyId
                );


        if (result.isEmpty()) {
            return null;
        }

        return result.get(0);
    }


    // =========================================================
    // ROW MAPPER
    // =========================================================

    private static class FacultyDashboardStatsRowMapper
            implements RowMapper<FacultyDashboardStats> {

        @Override
        public FacultyDashboardStats mapRow(
                ResultSet rs,
                int rowNum)
                throws SQLException {

            FacultyDashboardStats stats =
                    new FacultyDashboardStats();


            stats.setFacultyId(
                    rs.getInt("faculty_id")
            );


            stats.setFacultyName(
                    rs.getString("faculty_name")
            );


            stats.setDepartmentName(
                    rs.getString("dept_name")
            );


            stats.setDepartmentCode(
                    rs.getString("dept_code")
            );


            stats.setDesignation(
                    rs.getString("designation")
            );


            stats.setAssignedCourses(
                    rs.getInt("assigned_courses")
            );


            stats.setTotalStudents(
                    rs.getInt("total_students")
            );


            stats.setTotalCapacity(
                    rs.getInt("total_capacity")
            );


            return stats;
        }
    }
}