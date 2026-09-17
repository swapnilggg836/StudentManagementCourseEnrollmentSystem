package org.giritechhub.repository;

import java.util.List;

import org.giritechhub.model.Department;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DepartmentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // GET ALL DEPARTMENTS
    // =========================================================

    public List<Department> findAll() {

        String sql = """
                SELECT
                    dept_id,
                    dept_code,
                    dept_name,
                    hod_name
                FROM departments
                ORDER BY dept_name
                """;

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Department department =
                            new Department();

                    department.setDeptId(
                            rs.getInt("dept_id")
                    );

                    department.setDeptCode(
                            rs.getString("dept_code")
                    );

                    department.setDeptName(
                            rs.getString("dept_name")
                    );

                    department.setHodName(
                            rs.getString("hod_name")
                    );

                    return department;
                }
        );
    }


    // =========================================================
    // GET DEPARTMENT BY ID
    // =========================================================

    public Department findById(int deptId) {

        String sql = """
                SELECT
                    dept_id,
                    dept_code,
                    dept_name,
                    hod_name
                FROM departments
                WHERE dept_id = ?
                """;

        List<Department> departments =
                jdbcTemplate.query(
                        sql,
                        (rs, rowNum) -> {

                            Department department =
                                    new Department();

                            department.setDeptId(
                                    rs.getInt("dept_id")
                            );

                            department.setDeptCode(
                                    rs.getString("dept_code")
                            );

                            department.setDeptName(
                                    rs.getString("dept_name")
                            );

                            department.setHodName(
                                    rs.getString("hod_name")
                            );

                            return department;
                        },
                        deptId
                );

        if (departments.isEmpty()) {
            return null;
        }

        return departments.get(0);
    }


    // =========================================================
    // SEARCH DEPARTMENTS
    // =========================================================

    public List<Department> search(String keyword) {

        String sql = """
                SELECT
                    dept_id,
                    dept_code,
                    dept_name,
                    hod_name
                FROM departments
                WHERE
                    dept_code LIKE ?
                    OR dept_name LIKE ?
                    OR hod_name LIKE ?
                ORDER BY dept_name
                """;

        String searchValue =
                "%" + keyword + "%";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Department department =
                            new Department();

                    department.setDeptId(
                            rs.getInt("dept_id")
                    );

                    department.setDeptCode(
                            rs.getString("dept_code")
                    );

                    department.setDeptName(
                            rs.getString("dept_name")
                    );

                    department.setHodName(
                            rs.getString("hod_name")
                    );

                    return department;
                },
                searchValue,
                searchValue,
                searchValue
        );
    }


    // =========================================================
    // INSERT DEPARTMENT
    // =========================================================

    public int save(Department department) {

        String sql = """
                INSERT INTO departments
                (
                    dept_code,
                    dept_name,
                    hod_name
                )
                VALUES (?, ?, ?)
                """;

        return jdbcTemplate.update(
                sql,
                department.getDeptCode(),
                department.getDeptName(),
                department.getHodName()
        );
    }


    // =========================================================
    // UPDATE DEPARTMENT
    // =========================================================

    public int update(Department department) {

        String sql = """
                UPDATE departments
                SET
                    dept_code = ?,
                    dept_name = ?,
                    hod_name = ?
                WHERE dept_id = ?
                """;

        return jdbcTemplate.update(
                sql,
                department.getDeptCode(),
                department.getDeptName(),
                department.getHodName(),
                department.getDeptId()
        );
    }


    // =========================================================
    // DELETE DEPARTMENT
    // =========================================================

    public int delete(int deptId) {

        String sql = """
                DELETE FROM departments
                WHERE dept_id = ?
                """;

        return jdbcTemplate.update(
                sql,
                deptId
        );
    }

}