package org.giritechhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.giritechhub.model.FacultyStudent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class FacultyStudentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // FIND STUDENTS OF LOGGED-IN FACULTY
    // =========================================================

    public List<FacultyStudent> findByFacultyId(
            int facultyId) {

        String sql = """
                SELECT
                    s.student_id,
                    s.user_id,
                    s.roll_no,
                    s.first_name,
                    s.last_name,

                    s.dept_id,
                    d.dept_name,
                    d.dept_code,

                    s.semester,
                    s.phone,
                    s.gender,
                    s.dob,
                    s.address,

                    c.course_id,
                    c.course_code,
                    c.title AS course_title,

                    e.enrollment_date,
                    e.status AS enrollment_status,
                    e.grade

                FROM students s

                INNER JOIN enrollments e
                    ON s.student_id = e.student_id

                INNER JOIN courses c
                    ON e.course_id = c.course_id

                LEFT JOIN departments d
                    ON s.dept_id = d.dept_id

                WHERE c.faculty_id = ?

                ORDER BY
                    s.student_id DESC,
                    c.course_id DESC
                """;

        return jdbcTemplate.query(
                sql,
                new FacultyStudentRowMapper(),
                facultyId
        );
    }


    // =========================================================
    // SEARCH STUDENTS OF LOGGED-IN FACULTY
    // =========================================================

    public List<FacultyStudent> searchByFacultyId(
            int facultyId,
            String keyword) {

        String sql = """
                SELECT
                    s.student_id,
                    s.user_id,
                    s.roll_no,
                    s.first_name,
                    s.last_name,

                    s.dept_id,
                    d.dept_name,
                    d.dept_code,

                    s.semester,
                    s.phone,
                    s.gender,
                    s.dob,
                    s.address,

                    c.course_id,
                    c.course_code,
                    c.title AS course_title,

                    e.enrollment_date,
                    e.status AS enrollment_status,
                    e.grade

                FROM students s

                INNER JOIN enrollments e
                    ON s.student_id = e.student_id

                INNER JOIN courses c
                    ON e.course_id = c.course_id

                LEFT JOIN departments d
                    ON s.dept_id = d.dept_id

                WHERE c.faculty_id = ?

                  AND (
                        s.roll_no LIKE ?
                        OR s.first_name LIKE ?
                        OR s.last_name LIKE ?
                        OR c.course_code LIKE ?
                        OR c.title LIKE ?
                        OR d.dept_name LIKE ?
                      )

                ORDER BY
                    s.student_id DESC,
                    c.course_id DESC
                """;

        String value = "%" + keyword + "%";

        return jdbcTemplate.query(
                sql,
                new FacultyStudentRowMapper(),
                facultyId,
                value,
                value,
                value,
                value,
                value,
                value
        );
    }


    // =========================================================
    // FIND ONE STUDENT OF FACULTY
    // =========================================================

    public FacultyStudent findByStudentIdAndFacultyId(
            int studentId,
            int facultyId) {

        String sql = """
                SELECT
                    s.student_id,
                    s.user_id,
                    s.roll_no,
                    s.first_name,
                    s.last_name,

                    s.dept_id,
                    d.dept_name,
                    d.dept_code,

                    s.semester,
                    s.phone,
                    s.gender,
                    s.dob,
                    s.address,

                    c.course_id,
                    c.course_code,
                    c.title AS course_title,

                    e.enrollment_date,
                    e.status AS enrollment_status,
                    e.grade

                FROM students s

                INNER JOIN enrollments e
                    ON s.student_id = e.student_id

                INNER JOIN courses c
                    ON e.course_id = c.course_id

                LEFT JOIN departments d
                    ON s.dept_id = d.dept_id

                WHERE s.student_id = ?
                  AND c.faculty_id = ?

                ORDER BY c.course_id DESC
                """;

        List<FacultyStudent> students =
                jdbcTemplate.query(
                        sql,
                        new FacultyStudentRowMapper(),
                        studentId,
                        facultyId
                );

        if (students.isEmpty()) {
            return null;
        }

        return students.get(0);
    }


    // =========================================================
    // ROW MAPPER
    // =========================================================

    private static class FacultyStudentRowMapper
            implements RowMapper<FacultyStudent> {

        @Override
        public FacultyStudent mapRow(
                ResultSet rs,
                int rowNum)
                throws SQLException {

            FacultyStudent student =
                    new FacultyStudent();


            student.setStudentId(
                    rs.getInt("student_id")
            );

            student.setUserId(
                    rs.getInt("user_id")
            );

            student.setRollNo(
                    rs.getString("roll_no")
            );

            student.setFirstName(
                    rs.getString("first_name")
            );

            student.setLastName(
                    rs.getString("last_name")
            );


            student.setDeptId(
                    rs.getInt("dept_id")
            );

            student.setDepartmentName(
                    rs.getString("dept_name")
            );

            student.setDepartmentCode(
                    rs.getString("dept_code")
            );


            student.setSemester(
                    rs.getInt("semester")
            );

            student.setPhone(
                    rs.getString("phone")
            );

            student.setGender(
                    rs.getString("gender")
            );


            java.sql.Date dob =
                    rs.getDate("dob");

            if (dob != null) {
                student.setDob(
                        dob.toLocalDate()
                );
            }


            student.setAddress(
                    rs.getString("address")
            );


            student.setCourseId(
                    rs.getInt("course_id")
            );

            student.setCourseCode(
                    rs.getString("course_code")
            );

            student.setCourseTitle(
                    rs.getString("course_title")
            );


            java.sql.Date enrollmentDate =
                    rs.getDate("enrollment_date");

            if (enrollmentDate != null) {
                student.setEnrollmentDate(
                        enrollmentDate.toLocalDate()
                );
            }


            student.setEnrollmentStatus(
                    rs.getString("enrollment_status")
            );

            student.setGrade(
                    rs.getString("grade")
            );


            return student;
        }
    }
}