package org.giritechhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.giritechhub.model.StudentSchedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class StudentScheduleRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // GET STUDENT SCHEDULE
    // =========================================================
    //
    // Fetch only courses in which the student is currently
    // ENROLLED.
    //
    // Data comes from:
    // students
    // enrollments
    // courses
    // faculty
    //
    // =========================================================

    public List<StudentSchedule> findByStudentId(int studentId) {

        String sql =
                "SELECT " +
                "c.course_id, " +
                "c.course_code, " +
                "c.title, " +
                "c.credits, " +
                "CONCAT(" +
                "COALESCE(f.first_name, ''), " +
                "CASE " +
                "WHEN f.last_name IS NOT NULL " +
                "AND f.last_name <> '' " +
                "THEN CONCAT(' ', f.last_name) " +
                "ELSE '' " +
                "END" +
                ") AS faculty_name, " +
                "c.schedule_day, " +
                "c.schedule_time " +

                "FROM enrollments e " +

                "INNER JOIN courses c " +
                "ON e.course_id = c.course_id " +

                "LEFT JOIN faculty f " +
                "ON c.faculty_id = f.faculty_id " +

                "WHERE e.student_id = ? " +
                "AND e.status = 'ENROLLED' " +

                "ORDER BY " +
                "CASE LOWER(c.schedule_day) " +
                "WHEN 'monday' THEN 1 " +
                "WHEN 'tuesday' THEN 2 " +
                "WHEN 'wednesday' THEN 3 " +
                "WHEN 'thursday' THEN 4 " +
                "WHEN 'friday' THEN 5 " +
                "WHEN 'saturday' THEN 6 " +
                "WHEN 'sunday' THEN 7 " +
                "ELSE 8 " +
                "END, " +

                "c.schedule_time";


        return jdbcTemplate.query(
                sql,
                new StudentScheduleRowMapper(),
                studentId
        );
    }


    // =========================================================
    // ROW MAPPER
    // =========================================================

    private static class StudentScheduleRowMapper
            implements RowMapper<StudentSchedule> {

        @Override
        public StudentSchedule mapRow(
                ResultSet rs,
                int rowNum)
                throws SQLException {

            StudentSchedule schedule =
                    new StudentSchedule();


            schedule.setCourseId(
                    rs.getInt("course_id")
            );


            schedule.setCourseCode(
                    rs.getString("course_code")
            );


            schedule.setCourseTitle(
                    rs.getString("title")
            );


            schedule.setCredits(
                    rs.getInt("credits")
            );


            schedule.setFacultyName(
                    rs.getString("faculty_name")
            );


            schedule.setScheduleDay(
                    rs.getString("schedule_day")
            );


            schedule.setScheduleTime(
                    rs.getString("schedule_time")
            );


            return schedule;
        }
    }
}