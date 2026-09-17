package org.giritechhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.giritechhub.model.Course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class CourseRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // GET ALL COURSES
    // =========================================================

    public List<Course> findAll() {

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
                    CASE
                        WHEN f.faculty_id IS NOT NULL
                        THEN CONCAT(f.first_name, ' ', f.last_name)
                        ELSE NULL
                    END AS faculty_name,
                    c.capacity,
                    c.schedule_day,
                    c.schedule_time,
                    c.fee_amount,

                    (
                        SELECT COUNT(*)
                        FROM enrollments e
                        WHERE e.course_id = c.course_id
                        AND e.status = 'ENROLLED'
                    ) AS enrolled_students

                FROM courses c

                LEFT JOIN departments d
                    ON c.dept_id = d.dept_id

                LEFT JOIN faculty f
                    ON c.faculty_id = f.faculty_id

                ORDER BY c.course_id DESC
                """;

        return jdbcTemplate.query(sql, new CourseRowMapper());
    }


    // =========================================================
    // GET COURSE BY ID
    // =========================================================

    public Course findById(int courseId) {

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
                    CASE
                        WHEN f.faculty_id IS NOT NULL
                        THEN CONCAT(f.first_name, ' ', f.last_name)
                        ELSE NULL
                    END AS faculty_name,
                    c.capacity,
                    c.schedule_day,
                    c.schedule_time,
                    c.fee_amount,

                    (
                        SELECT COUNT(*)
                        FROM enrollments e
                        WHERE e.course_id = c.course_id
                        AND e.status = 'ENROLLED'
                    ) AS enrolled_students

                FROM courses c

                LEFT JOIN departments d
                    ON c.dept_id = d.dept_id

                LEFT JOIN faculty f
                    ON c.faculty_id = f.faculty_id

                WHERE c.course_id = ?
                """;

        List<Course> courses =
                jdbcTemplate.query(
                        sql,
                        new CourseRowMapper(),
                        courseId
                );

        if (courses.isEmpty()) {
            return null;
        }

        return courses.get(0);
    }


    // =========================================================
    // SEARCH COURSES
    // =========================================================

    public List<Course> search(String keyword) {

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
                    CASE
                        WHEN f.faculty_id IS NOT NULL
                        THEN CONCAT(f.first_name, ' ', f.last_name)
                        ELSE NULL
                    END AS faculty_name,
                    c.capacity,
                    c.schedule_day,
                    c.schedule_time,
                    c.fee_amount,

                    (
                        SELECT COUNT(*)
                        FROM enrollments e
                        WHERE e.course_id = c.course_id
                        AND e.status = 'ENROLLED'
                    ) AS enrolled_students

                FROM courses c

                LEFT JOIN departments d
                    ON c.dept_id = d.dept_id

                LEFT JOIN faculty f
                    ON c.faculty_id = f.faculty_id

                WHERE
                    c.course_code LIKE ?
                    OR c.title LIKE ?
                    OR d.dept_name LIKE ?
                    OR d.dept_code LIKE ?
                    OR CONCAT(f.first_name, ' ', f.last_name) LIKE ?

                ORDER BY c.course_id DESC
                """;

        String searchValue = "%" + keyword + "%";

        return jdbcTemplate.query(
                sql,
                new CourseRowMapper(),
                searchValue,
                searchValue,
                searchValue,
                searchValue,
                searchValue
        );
    }


    // =========================================================
    // ADD COURSE
    // =========================================================

    public int save(Course course) {

        String sql = """
                INSERT INTO courses
                (
                    course_code,
                    title,
                    description,
                    credits,
                    dept_id,
                    faculty_id,
                    capacity,
                    schedule_day,
                    schedule_time,
                    fee_amount
                )
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """;

        return jdbcTemplate.update(
                sql,
                course.getCourseCode(),
                course.getTitle(),
                course.getDescription(),
                course.getCredits(),
                course.getDeptId(),
                course.getFacultyId(),
                course.getCapacity(),
                course.getScheduleDay(),
                course.getScheduleTime(),
                course.getFeeAmount()
        );
    }


    // =========================================================
    // UPDATE COURSE
    // =========================================================

    public int update(Course course) {

        String sql = """
                UPDATE courses
                SET
                    course_code = ?,
                    title = ?,
                    description = ?,
                    credits = ?,
                    dept_id = ?,
                    faculty_id = ?,
                    capacity = ?,
                    schedule_day = ?,
                    schedule_time = ?,
                    fee_amount = ?
                WHERE course_id = ?
                """;

        return jdbcTemplate.update(
                sql,
                course.getCourseCode(),
                course.getTitle(),
                course.getDescription(),
                course.getCredits(),
                course.getDeptId(),
                course.getFacultyId(),
                course.getCapacity(),
                course.getScheduleDay(),
                course.getScheduleTime(),
                course.getFeeAmount(),
                course.getCourseId()
        );
    }


    // =========================================================
    // DELETE COURSE
    // =========================================================

    public int delete(int courseId) {

        String sql = """
                DELETE FROM courses
                WHERE course_id = ?
                """;

        return jdbcTemplate.update(sql, courseId);
    }


    // =========================================================
    // ROW MAPPER
    // =========================================================

    private static class CourseRowMapper
            implements RowMapper<Course> {

        @Override
        public Course mapRow(
                ResultSet rs,
                int rowNum) throws SQLException {

            Course course = new Course();

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


            // -------------------------------------------------
            // FACULTY
            // -------------------------------------------------

            int facultyId =
                    rs.getInt("faculty_id");

            if (rs.wasNull()) {
                course.setFacultyId(null);
            } else {
                course.setFacultyId(facultyId);
            }

            course.setFacultyName(
                    rs.getString("faculty_name")
            );


            // -------------------------------------------------
            // COURSE DETAILS
            // -------------------------------------------------

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


            // -------------------------------------------------
            // ENROLLMENT DETAILS
            // -------------------------------------------------

            int enrolledStudents =
                    rs.getInt("enrolled_students");

            course.setEnrolledStudents(
                    enrolledStudents
            );


            int availableSeats =
                    course.getCapacity()
                    - enrolledStudents;

            if (availableSeats < 0) {
                availableSeats = 0;
            }

            course.setAvailableSeats(
                    availableSeats
            );


            return course;
        }
    }
}