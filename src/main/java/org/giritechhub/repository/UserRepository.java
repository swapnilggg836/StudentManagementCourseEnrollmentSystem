package org.giritechhub.repository;

import org.giritechhub.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public User findByEmail(String email) {

        String sql = """
                SELECT user_id, email, password_hash, role, status, created_at
                FROM users
                WHERE email = ?
                """;

        try {

            return jdbcTemplate.queryForObject(
                    sql,
                    (rs, rowNum) -> {

                        User user = new User();

                        user.setUserId(rs.getInt("user_id"));
                        user.setEmail(rs.getString("email"));
                        user.setPasswordHash(rs.getString("password_hash"));
                        user.setRole(rs.getString("role"));
                        user.setStatus(rs.getString("status"));
                        user.setCreatedAt(rs.getTimestamp("created_at"));

                        return user;
                    },
                    email
            );

        } catch (Exception e) {
            return null;
        }
    }
}