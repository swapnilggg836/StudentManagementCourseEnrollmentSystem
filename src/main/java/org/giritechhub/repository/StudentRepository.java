package org.giritechhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.giritechhub.model.Student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class StudentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // GET ALL STUDENTS
    // =========================================================

    public List<Student> findAll() {

        String sql =
                "SELECT " +
                "s.student_id, " +
                "s.user_id, " +
                "s.roll_no, " +
                "s.first_name, " +
                "s.last_name, " +
                "s.dept_id, " +
                "d.dept_code, " +
                "d.dept_name, " +
                "s.semester, " +
                "s.phone, " +
                "s.gender, " +
                "s.dob, " +
                "s.address, " +
                "u.email, " +
                "u.status " +
                "FROM students s " +
                "LEFT JOIN departments d " +
                "ON s.dept_id = d.dept_id " +
                "LEFT JOIN users u " +
                "ON s.user_id = u.user_id " +
                "ORDER BY s.student_id DESC";

        return jdbcTemplate.query(
                sql,
                new StudentRowMapper()
        );
    }


    // =========================================================
    // GET STUDENT BY ID
    // =========================================================

    public Student findById(int studentId) {

        String sql =
                "SELECT " +
                "s.student_id, " +
                "s.user_id, " +
                "s.roll_no, " +
                "s.first_name, " +
                "s.last_name, " +
                "s.dept_id, " +
                "d.dept_code, " +
                "d.dept_name, " +
                "s.semester, " +
                "s.phone, " +
                "s.gender, " +
                "s.dob, " +
                "s.address, " +
                "u.email, " +
                "u.status " +
                "FROM students s " +
                "LEFT JOIN departments d " +
                "ON s.dept_id = d.dept_id " +
                "LEFT JOIN users u " +
                "ON s.user_id = u.user_id " +
                "WHERE s.student_id = ?";

        List<Student> students =
                jdbcTemplate.query(
                        sql,
                        new StudentRowMapper(),
                        studentId
                );

        if (students.isEmpty()) {
            return null;
        }

        return students.get(0);
    }


    // =========================================================
    // GET STUDENT BY USER ID
    // Used for logged-in Student Dashboard/Profile
    // =========================================================

    public Student findByUserId(int userId) {

        String sql =
                "SELECT " +
                "s.student_id, " +
                "s.user_id, " +
                "s.roll_no, " +
                "s.first_name, " +
                "s.last_name, " +
                "s.dept_id, " +
                "d.dept_code, " +
                "d.dept_name, " +
                "s.semester, " +
                "s.phone, " +
                "s.gender, " +
                "s.dob, " +
                "s.address, " +
                "u.email, " +
                "u.status " +
                "FROM students s " +
                "LEFT JOIN departments d " +
                "ON s.dept_id = d.dept_id " +
                "LEFT JOIN users u " +
                "ON s.user_id = u.user_id " +
                "WHERE s.user_id = ?";

        List<Student> students =
                jdbcTemplate.query(
                        sql,
                        new StudentRowMapper(),
                        userId
                );

        if (students.isEmpty()) {
            return null;
        }

        return students.get(0);
    }


    // =========================================================
    // SEARCH STUDENTS
    // =========================================================

    public List<Student> search(String keyword) {

        String sql =
                "SELECT " +
                "s.student_id, " +
                "s.user_id, " +
                "s.roll_no, " +
                "s.first_name, " +
                "s.last_name, " +
                "s.dept_id, " +
                "d.dept_code, " +
                "d.dept_name, " +
                "s.semester, " +
                "s.phone, " +
                "s.gender, " +
                "s.dob, " +
                "s.address, " +
                "u.email, " +
                "u.status " +
                "FROM students s " +
                "LEFT JOIN departments d " +
                "ON s.dept_id = d.dept_id " +
                "LEFT JOIN users u " +
                "ON s.user_id = u.user_id " +
                "WHERE " +
                "s.roll_no LIKE ? " +
                "OR s.first_name LIKE ? " +
                "OR s.last_name LIKE ? " +
                "OR d.dept_name LIKE ? " +
                "OR u.email LIKE ? " +
                "ORDER BY s.student_id DESC";

        String searchValue =
                "%" + keyword + "%";

        return jdbcTemplate.query(
                sql,
                new StudentRowMapper(),
                searchValue,
                searchValue,
                searchValue,
                searchValue,
                searchValue
        );
    }


    // =========================================================
    // INSERT STUDENT
    // =========================================================

    public int save(Student student) {

        String sql =
                "INSERT INTO students " +
                "(user_id, roll_no, first_name, last_name, " +
                "dept_id, semester, phone, gender, dob, address) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                student.getUserId(),
                student.getRollNo(),
                student.getFirstName(),
                student.getLastName(),
                student.getDeptId(),
                student.getSemester(),
                student.getPhone(),
                student.getGender(),
                student.getDob(),
                student.getAddress()
        );
    }


    // =========================================================
    // UPDATE STUDENT
    // =========================================================

    public int update(Student student) {

        String sql =
                "UPDATE students SET " +
                "roll_no = ?, " +
                "first_name = ?, " +
                "last_name = ?, " +
                "dept_id = ?, " +
                "semester = ?, " +
                "phone = ?, " +
                "gender = ?, " +
                "dob = ?, " +
                "address = ? " +
                "WHERE student_id = ?";

        return jdbcTemplate.update(
                sql,
                student.getRollNo(),
                student.getFirstName(),
                student.getLastName(),
                student.getDeptId(),
                student.getSemester(),
                student.getPhone(),
                student.getGender(),
                student.getDob(),
                student.getAddress(),
                student.getStudentId()
        );
    }


    // =========================================================
    // DELETE STUDENT
    // =========================================================

    public int delete(int studentId) {

        String sql =
                "DELETE FROM students " +
                "WHERE student_id = ?";

        return jdbcTemplate.update(
                sql,
                studentId
        );
    }


    // =========================================================
    // ROW MAPPER
    // =========================================================

    private static class StudentRowMapper
            implements RowMapper<Student> {

        @Override
        public Student mapRow(
                ResultSet rs,
                int rowNum)
                throws SQLException {

            Student student =
                    new Student();


            // -------------------------------------------------
            // STUDENT INFORMATION
            // -------------------------------------------------

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


            // -------------------------------------------------
            // DEPARTMENT
            // -------------------------------------------------

            student.setDeptId(
                    rs.getInt("dept_id")
            );

            student.setDepartmentCode(
                    rs.getString("dept_code")
            );

            student.setDepartmentName(
                    rs.getString("dept_name")
            );


            // -------------------------------------------------
            // ACADEMIC INFORMATION
            // -------------------------------------------------

            student.setSemester(
                    rs.getInt("semester")
            );


            // -------------------------------------------------
            // CONTACT INFORMATION
            // -------------------------------------------------

            student.setPhone(
                    rs.getString("phone")
            );

            student.setGender(
                    rs.getString("gender")
            );


            // -------------------------------------------------
            // DATE OF BIRTH
            // -------------------------------------------------

            if (rs.getDate("dob") != null) {

                student.setDob(
                        rs.getDate("dob")
                                .toLocalDate()
                );
            }


            // -------------------------------------------------
            // ADDRESS
            // -------------------------------------------------

            student.setAddress(
                    rs.getString("address")
            );


            // -------------------------------------------------
            // USER INFORMATION
            // -------------------------------------------------

            student.setEmail(
                    rs.getString("email")
            );

            student.setStatus(
                    rs.getString("status")
            );


            return student;
        }
    }

}