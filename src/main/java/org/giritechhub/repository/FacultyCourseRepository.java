package org.giritechhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.giritechhub.model.FacultyCourse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class FacultyCourseRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // FIND COURSES ASSIGNED TO FACULTY
    // =========================================================

    public List<FacultyCourse> findByFacultyId(int facultyId) {

        String sql = """
                SELECT
                    c.course_id,
                    c.course_code,
                    c.title,
                    c.description,
                    c.credits,

                    c.dept_id,
                    d.dept_name,
                    d.dept_code,

                    c.faculty_id,

                    CONCAT(
                        COALESCE(f.first_name, ''),
                        ' ',
                        COALESCE(f.last_name, '')
                    ) AS faculty_name,

                    c.capacity,
                    c.schedule_day,
                    c.schedule_time,
                    c.fee_amount,

                    (
                        SELECT COUNT(*)
                        FROM enrollments e
                        WHERE e.course_id = c.course_id
                          AND e.status = 'ENROLLED'
                    ) AS enrolled_students,

                    GREATEST(
                        c.capacity -
                        (
                            SELECT COUNT(*)
                            FROM enrollments e
                            WHERE e.course_id = c.course_id
                              AND e.status = 'ENROLLED'
                        ),
                        0
                    ) AS available_seats

                FROM courses c

                LEFT JOIN departments d
                    ON c.dept_id = d.dept_id

                LEFT JOIN faculty f
                    ON c.faculty_id = f.faculty_id

                WHERE c.faculty_id = ?

                ORDER BY c.course_id DESC
                """;

        return jdbcTemplate.query(
                sql,
                new FacultyCourseRowMapper(),
                facultyId
        );
    }


    // =========================================================
    // FIND SINGLE COURSE ASSIGNED TO FACULTY
    // =========================================================

    public FacultyCourse findByIdAndFacultyId(
            int courseId,
            int facultyId) {

        String sql = """
                SELECT
                    c.course_id,
                    c.course_code,
                    c.title,
                    c.description,
                    c.credits,

                    c.dept_id,
                    d.dept_name,
                    d.dept_code,

                    c.faculty_id,

                    CONCAT(
                        COALESCE(f.first_name, ''),
                        ' ',
                        COALESCE(f.last_name, '')
                    ) AS faculty_name,

                    c.capacity,
                    c.schedule_day,
                    c.schedule_time,
                    c.fee_amount,

                    (
                        SELECT COUNT(*)
                        FROM enrollments e
                        WHERE e.course_id = c.course_id
                          AND e.status = 'ENROLLED'
                    ) AS enrolled_students,

                    GREATEST(
                        c.capacity -
                        (
                            SELECT COUNT(*)
                            FROM enrollments e
                            WHERE e.course_id = c.course_id
                              AND e.status = 'ENROLLED'
                        ),
                        0
                    ) AS available_seats

                FROM courses c

                LEFT JOIN departments d
                    ON c.dept_id = d.dept_id

                LEFT JOIN faculty f
                    ON c.faculty_id = f.faculty_id

                WHERE c.course_id = ?
                  AND c.faculty_id = ?
                """;

        List<FacultyCourse> courses =
                jdbcTemplate.query(
                        sql,
                        new FacultyCourseRowMapper(),
                        courseId,
                        facultyId
                );

        if (courses.isEmpty()) {
            return null;
        }

        return courses.get(0);
    }


    // =========================================================
    // ROW MAPPER
    // =========================================================

    private static class FacultyCourseRowMapper
            implements RowMapper<FacultyCourse> {

        @Override
        public FacultyCourse mapRow(
                ResultSet rs,
                int rowNum)
                throws SQLException {

            FacultyCourse course =
                    new FacultyCourse();

            course.setCourseId(
                    rs.getInt("course_id")
            );

            course.setCourseCode(
                    rs.getString("course_code")
            );

            course.setTitle(
                    rs.getString("title")
            );

            course.setDescription(
                    rs.getString("description")
            );

            course.setCredits(
                    rs.getInt("credits")
            );

            course.setDeptId(
                    rs.getInt("dept_id")
            );

            course.setDepartmentName(
                    rs.getString("dept_name")
            );

            course.setDepartmentCode(
                    rs.getString("dept_code")
            );

            course.setFacultyId(
                    rs.getInt("faculty_id")
            );

            course.setFacultyName(
                    rs.getString("faculty_name")
            );

            course.setCapacity(
                    rs.getInt("capacity")
            );

            course.setScheduleDay(
                    rs.getString("schedule_day")
            );

            course.setScheduleTime(
                    rs.getString("schedule_time")
            );

            course.setFeeAmount(
                    rs.getBigDecimal("fee_amount")
            );

            course.setEnrolledStudents(
                    rs.getInt("enrolled_students")
            );

            course.setAvailableSeats(
                    rs.getInt("available_seats")
            );

            return course;
        }
    }
}