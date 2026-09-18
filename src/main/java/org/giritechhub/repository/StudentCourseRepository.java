package org.giritechhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.giritechhub.model.StudentCourse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class StudentCourseRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // GET ALL COURSES
    // =========================================================

    public List<StudentCourse> findAll(int studentId) {

        String sql =
                "SELECT " +
                "c.course_id, " +
                "c.course_code, " +
                "c.title, " +
                "c.description, " +
                "c.credits, " +
                "c.dept_id, " +
                "d.dept_code, " +
                "d.dept_name, " +
                "c.faculty_id, " +
                "CONCAT(f.first_name, ' ', f.last_name) AS faculty_name, " +
                "c.capacity, " +
                "COALESCE(ec.enrolled_students, 0) AS enrolled_students, " +
                "GREATEST(c.capacity - COALESCE(ec.enrolled_students, 0), 0) AS available_seats, " +
                "c.schedule_day, " +
                "c.schedule_time, " +
                "c.fee_amount, " +
                "CASE " +
                "WHEN EXISTS ( " +
                "SELECT 1 FROM enrollments e2 " +
                "WHERE e2.course_id = c.course_id " +
                "AND e2.student_id = ? " +
                "AND e2.status = 'ENROLLED' " +
                ") THEN TRUE " +
                "ELSE FALSE " +
                "END AS is_enrolled " +
                "FROM courses c " +
                "LEFT JOIN departments d " +
                "ON c.dept_id = d.dept_id " +
                "LEFT JOIN faculty f " +
                "ON c.faculty_id = f.faculty_id " +
                "LEFT JOIN ( " +
                "SELECT course_id, COUNT(*) AS enrolled_students " +
                "FROM enrollments " +
                "WHERE status = 'ENROLLED' " +
                "GROUP BY course_id " +
                ") ec " +
                "ON c.course_id = ec.course_id " +
                "ORDER BY c.course_id DESC";

        return jdbcTemplate.query(
                sql,
                new StudentCourseRowMapper(),
                studentId
        );
    }


    // =========================================================
    // SEARCH COURSES
    // =========================================================

    public List<StudentCourse> search(
            String keyword,
            int studentId) {

        String sql =
                "SELECT " +
                "c.course_id, " +
                "c.course_code, " +
                "c.title, " +
                "c.description, " +
                "c.credits, " +
                "c.dept_id, " +
                "d.dept_code, " +
                "d.dept_name, " +
                "c.faculty_id, " +
                "CONCAT(f.first_name, ' ', f.last_name) AS faculty_name, " +
                "c.capacity, " +
                "COALESCE(ec.enrolled_students, 0) AS enrolled_students, " +
                "GREATEST(c.capacity - COALESCE(ec.enrolled_students, 0), 0) AS available_seats, " +
                "c.schedule_day, " +
                "c.schedule_time, " +
                "c.fee_amount, " +
                "CASE " +
                "WHEN EXISTS ( " +
                "SELECT 1 FROM enrollments e2 " +
                "WHERE e2.course_id = c.course_id " +
                "AND e2.student_id = ? " +
                "AND e2.status = 'ENROLLED' " +
                ") THEN TRUE " +
                "ELSE FALSE " +
                "END AS is_enrolled " +
                "FROM courses c " +
                "LEFT JOIN departments d " +
                "ON c.dept_id = d.dept_id " +
                "LEFT JOIN faculty f " +
                "ON c.faculty_id = f.faculty_id " +
                "LEFT JOIN ( " +
                "SELECT course_id, COUNT(*) AS enrolled_students " +
                "FROM enrollments " +
                "WHERE status = 'ENROLLED' " +
                "GROUP BY course_id " +
                ") ec " +
                "ON c.course_id = ec.course_id " +
                "WHERE " +
                "c.course_code LIKE ? " +
                "OR c.title LIKE ? " +
                "OR c.description LIKE ? " +
                "OR d.dept_code LIKE ? " +
                "OR d.dept_name LIKE ? " +
                "OR CONCAT(f.first_name, ' ', f.last_name) LIKE ? " +
                "ORDER BY c.course_id DESC";

        String searchValue =
                "%" + keyword + "%";

        return jdbcTemplate.query(
                sql,
                new StudentCourseRowMapper(),
                studentId,
                searchValue,
                searchValue,
                searchValue,
                searchValue,
                searchValue,
                searchValue
        );
    }


    // =========================================================
    // GET COURSES BY DEPARTMENT
    // =========================================================

    public List<StudentCourse> findByDepartment(
            int deptId,
            int studentId) {

        String sql =
                "SELECT " +
                "c.course_id, " +
                "c.course_code, " +
                "c.title, " +
                "c.description, " +
                "c.credits, " +
                "c.dept_id, " +
                "d.dept_code, " +
                "d.dept_name, " +
                "c.faculty_id, " +
                "CONCAT(f.first_name, ' ', f.last_name) AS faculty_name, " +
                "c.capacity, " +
                "COALESCE(ec.enrolled_students, 0) AS enrolled_students, " +
                "GREATEST(c.capacity - COALESCE(ec.enrolled_students, 0), 0) AS available_seats, " +
                "c.schedule_day, " +
                "c.schedule_time, " +
                "c.fee_amount, " +
                "CASE " +
                "WHEN EXISTS ( " +
                "SELECT 1 FROM enrollments e2 " +
                "WHERE e2.course_id = c.course_id " +
                "AND e2.student_id = ? " +
                "AND e2.status = 'ENROLLED' " +
                ") THEN TRUE " +
                "ELSE FALSE " +
                "END AS is_enrolled " +
                "FROM courses c " +
                "LEFT JOIN departments d " +
                "ON c.dept_id = d.dept_id " +
                "LEFT JOIN faculty f " +
                "ON c.faculty_id = f.faculty_id " +
                "LEFT JOIN ( " +
                "SELECT course_id, COUNT(*) AS enrolled_students " +
                "FROM enrollments " +
                "WHERE status = 'ENROLLED' " +
                "GROUP BY course_id " +
                ") ec " +
                "ON c.course_id = ec.course_id " +
                "WHERE c.dept_id = ? " +
                "ORDER BY c.course_id DESC";

        return jdbcTemplate.query(
                sql,
                new StudentCourseRowMapper(),
                studentId,
                deptId
        );
    }


    // =========================================================
    // GET COURSE BY ID
    // =========================================================

    public StudentCourse findById(
            int courseId,
            int studentId) {

        String sql =
                "SELECT " +
                "c.course_id, " +
                "c.course_code, " +
                "c.title, " +
                "c.description, " +
                "c.credits, " +
                "c.dept_id, " +
                "d.dept_code, " +
                "d.dept_name, " +
                "c.faculty_id, " +
                "CONCAT(f.first_name, ' ', f.last_name) AS faculty_name, " +
                "c.capacity, " +
                "COALESCE(ec.enrolled_students, 0) AS enrolled_students, " +
                "GREATEST(c.capacity - COALESCE(ec.enrolled_students, 0), 0) AS available_seats, " +
                "c.schedule_day, " +
                "c.schedule_time, " +
                "c.fee_amount, " +
                "CASE " +
                "WHEN EXISTS ( " +
                "SELECT 1 FROM enrollments e2 " +
                "WHERE e2.course_id = c.course_id " +
                "AND e2.student_id = ? " +
                "AND e2.status = 'ENROLLED' " +
                ") THEN TRUE " +
                "ELSE FALSE " +
                "END AS is_enrolled " +
                "FROM courses c " +
                "LEFT JOIN departments d " +
                "ON c.dept_id = d.dept_id " +
                "LEFT JOIN faculty f " +
                "ON c.faculty_id = f.faculty_id " +
                "LEFT JOIN ( " +
                "SELECT course_id, COUNT(*) AS enrolled_students " +
                "FROM enrollments " +
                "WHERE status = 'ENROLLED' " +
                "GROUP BY course_id " +
                ") ec " +
                "ON c.course_id = ec.course_id " +
                "WHERE c.course_id = ?";

        List<StudentCourse> courses =
                jdbcTemplate.query(
                        sql,
                        new StudentCourseRowMapper(),
                        studentId,
                        courseId
                );

        if (courses.isEmpty()) {
            return null;
        }

        return courses.get(0);
    }


    // =========================================================
    // ROW MAPPER
    // =========================================================

    private static class StudentCourseRowMapper
            implements RowMapper<StudentCourse> {

        @Override
        public StudentCourse mapRow(
                ResultSet rs,
                int rowNum)
                throws SQLException {

            StudentCourse course =
                    new StudentCourse();

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

            course.setDepartmentCode(
                    rs.getString("dept_code")
            );

            course.setDepartmentName(
                    rs.getString("dept_name")
            );

            int facultyId =
                    rs.getInt("faculty_id");

            if (!rs.wasNull()) {
                course.setFacultyId(facultyId);
            }

            course.setFacultyName(
                    rs.getString("faculty_name")
            );

            course.setCapacity(
                    rs.getInt("capacity")
            );

            course.setEnrolledStudents(
                    rs.getInt("enrolled_students")
            );

            course.setAvailableSeats(
                    rs.getInt("available_seats")
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

            course.setEnrolled(
                    rs.getBoolean("is_enrolled")
            );

            return course;
        }
    }

}