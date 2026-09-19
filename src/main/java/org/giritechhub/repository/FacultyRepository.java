package org.giritechhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.giritechhub.model.Faculty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class FacultyRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // FIND ALL FACULTY
    // =========================================================

    public List<Faculty> findAll() {

        String sql = """
                SELECT
                    f.faculty_id,
                    f.user_id,
                    f.employee_code,
                    f.first_name,
                    f.last_name,
                    f.dept_id,
                    d.dept_name,
                    d.dept_code,
                    u.email,
                    u.status,
                    f.designation,
                    f.phone,
                    f.qualification,

                    (
                        SELECT COUNT(*)
                        FROM courses c
                        WHERE c.faculty_id = f.faculty_id
                    ) AS assigned_courses

                FROM faculty f

                LEFT JOIN departments d
                    ON f.dept_id = d.dept_id

                LEFT JOIN users u
                    ON f.user_id = u.user_id

                ORDER BY f.faculty_id DESC
                """;

        return jdbcTemplate.query(
                sql,
                new FacultyRowMapper()
        );
    }


    // =========================================================
    // FIND FACULTY BY ID
    // =========================================================

    public Faculty findById(int facultyId) {

        String sql = """
                SELECT
                    f.faculty_id,
                    f.user_id,
                    f.employee_code,
                    f.first_name,
                    f.last_name,
                    f.dept_id,
                    d.dept_name,
                    d.dept_code,
                    u.email,
                    u.status,
                    f.designation,
                    f.phone,
                    f.qualification,

                    (
                        SELECT COUNT(*)
                        FROM courses c
                        WHERE c.faculty_id = f.faculty_id
                    ) AS assigned_courses

                FROM faculty f

                LEFT JOIN departments d
                    ON f.dept_id = d.dept_id

                LEFT JOIN users u
                    ON f.user_id = u.user_id

                WHERE f.faculty_id = ?
                """;

        List<Faculty> faculty =
                jdbcTemplate.query(
                        sql,
                        new FacultyRowMapper(),
                        facultyId
                );

        if (faculty.isEmpty()) {
            return null;
        }

        return faculty.get(0);
    }


    // =========================================================
    // FIND FACULTY BY USER ID
    // Used for logged-in Faculty
    // =========================================================

    public Faculty findByUserId(int userId) {

        String sql = """
                SELECT
                    f.faculty_id,
                    f.user_id,
                    f.employee_code,
                    f.first_name,
                    f.last_name,
                    f.dept_id,
                    d.dept_name,
                    d.dept_code,
                    u.email,
                    u.status,
                    f.designation,
                    f.phone,
                    f.qualification,

                    (
                        SELECT COUNT(*)
                        FROM courses c
                        WHERE c.faculty_id = f.faculty_id
                    ) AS assigned_courses

                FROM faculty f

                LEFT JOIN departments d
                    ON f.dept_id = d.dept_id

                LEFT JOIN users u
                    ON f.user_id = u.user_id

                WHERE f.user_id = ?
                """;

        List<Faculty> faculty =
                jdbcTemplate.query(
                        sql,
                        new FacultyRowMapper(),
                        userId
                );

        if (faculty.isEmpty()) {
            return null;
        }

        return faculty.get(0);
    }


    // =========================================================
    // SEARCH FACULTY
    // =========================================================

    public List<Faculty> search(String keyword) {

        String sql = """
                SELECT
                    f.faculty_id,
                    f.user_id,
                    f.employee_code,
                    f.first_name,
                    f.last_name,
                    f.dept_id,
                    d.dept_name,
                    d.dept_code,
                    u.email,
                    u.status,
                    f.designation,
                    f.phone,
                    f.qualification,

                    (
                        SELECT COUNT(*)
                        FROM courses c
                        WHERE c.faculty_id = f.faculty_id
                    ) AS assigned_courses

                FROM faculty f

                LEFT JOIN departments d
                    ON f.dept_id = d.dept_id

                LEFT JOIN users u
                    ON f.user_id = u.user_id

                WHERE
                    f.employee_code LIKE ?
                    OR f.first_name LIKE ?
                    OR f.last_name LIKE ?
                    OR d.dept_name LIKE ?
                    OR d.dept_code LIKE ?
                    OR u.email LIKE ?
                    OR f.designation LIKE ?

                ORDER BY f.faculty_id DESC
                """;

        String value = "%" + keyword + "%";

        return jdbcTemplate.query(
                sql,
                new FacultyRowMapper(),
                value,
                value,
                value,
                value,
                value,
                value,
                value
        );
    }


    // =========================================================
    // SAVE FACULTY
    // =========================================================

    public int save(Faculty faculty) {

        String sql = """
                INSERT INTO faculty
                (
                    user_id,
                    employee_code,
                    first_name,
                    last_name,
                    dept_id,
                    designation,
                    phone,
                    qualification
                )
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                """;

        return jdbcTemplate.update(
                sql,
                faculty.getUserId(),
                faculty.getEmployeeCode(),
                faculty.getFirstName(),
                faculty.getLastName(),
                faculty.getDeptId(),
                faculty.getDesignation(),
                faculty.getPhone(),
                faculty.getQualification()
        );
    }


    // =========================================================
    // UPDATE FACULTY
    // =========================================================

    public int update(Faculty faculty) {

        String sql = """
                UPDATE faculty
                SET
                    employee_code = ?,
                    first_name = ?,
                    last_name = ?,
                    dept_id = ?,
                    designation = ?,
                    phone = ?,
                    qualification = ?
                WHERE faculty_id = ?
                """;

        return jdbcTemplate.update(
                sql,
                faculty.getEmployeeCode(),
                faculty.getFirstName(),
                faculty.getLastName(),
                faculty.getDeptId(),
                faculty.getDesignation(),
                faculty.getPhone(),
                faculty.getQualification(),
                faculty.getFacultyId()
        );
    }


    // =========================================================
    // DELETE FACULTY
    // =========================================================

    public int delete(int facultyId) {

        String sql = """
                DELETE FROM faculty
                WHERE faculty_id = ?
                """;

        return jdbcTemplate.update(
                sql,
                facultyId
        );
    }


    // =========================================================
    // ROW MAPPER
    // =========================================================

    private static class FacultyRowMapper
            implements RowMapper<Faculty> {

        @Override
        public Faculty mapRow(
                ResultSet rs,
                int rowNum)
                throws SQLException {

            Faculty faculty = new Faculty();

            faculty.setFacultyId(
                    rs.getInt("faculty_id")
            );

            faculty.setUserId(
                    rs.getInt("user_id")
            );

            faculty.setEmployeeCode(
                    rs.getString("employee_code")
            );

            faculty.setFirstName(
                    rs.getString("first_name")
            );

            faculty.setLastName(
                    rs.getString("last_name")
            );

            faculty.setDeptId(
                    rs.getInt("dept_id")
            );

            faculty.setDepartmentName(
                    rs.getString("dept_name")
            );

            faculty.setDepartmentCode(
                    rs.getString("dept_code")
            );

            faculty.setEmail(
                    rs.getString("email")
            );

            faculty.setStatus(
                    rs.getString("status")
            );

            faculty.setDesignation(
                    rs.getString("designation")
            );

            faculty.setPhone(
                    rs.getString("phone")
            );

            faculty.setQualification(
                    rs.getString("qualification")
            );

            faculty.setAssignedCourses(
                    rs.getInt("assigned_courses")
            );

            return faculty;
        }
    }
}