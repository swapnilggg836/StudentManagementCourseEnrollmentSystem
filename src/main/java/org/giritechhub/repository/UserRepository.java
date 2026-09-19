package org.giritechhub.repository;

import java.sql.PreparedStatement;
import java.sql.Statement;

import org.giritechhub.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // FIND USER BY EMAIL
    // =========================================================

    public User findByEmail(String email) {

        String sql = """
                SELECT
                    user_id,
                    email,
                    password_hash,
                    role,
                    status,
                    created_at
                FROM users
                WHERE email = ?
                """;

        try {

            return jdbcTemplate.queryForObject(
                    sql,

                    (rs, rowNum) -> {

                        User user = new User();

                        user.setUserId(
                                rs.getInt("user_id")
                        );

                        user.setEmail(
                                rs.getString("email")
                        );

                        user.setPasswordHash(
                                rs.getString("password_hash")
                        );

                        user.setRole(
                                rs.getString("role")
                        );

                        user.setStatus(
                                rs.getString("status")
                        );

                        user.setCreatedAt(
                                rs.getTimestamp("created_at")
                        );

                        return user;
                    },

                    email
            );

        } catch (EmptyResultDataAccessException e) {

            System.out.println(
                    "No user found with email: " + email
            );

            return null;

        } catch (Exception e) {

            System.out.println(
                    "ERROR while finding user by email: "
                    + email
            );

            e.printStackTrace();

            return null;
        }
    }


    // =========================================================
    // CHECK EMAIL EXISTS
    // =========================================================

    public boolean emailExists(String email) {

        String sql = """
                SELECT COUNT(*)
                FROM users
                WHERE email = ?
                """;

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        email
                );

        return count != null && count > 0;
    }


    // =========================================================
    // CREATE USER
    // =========================================================

    public int createUser(
            String email,
            String passwordHash,
            String role) {

        String sql = """
                INSERT INTO users
                (
                    email,
                    password_hash,
                    role,
                    status
                )
                VALUES (?, ?, ?, 'ACTIVE')
                """;

        KeyHolder keyHolder =
                new GeneratedKeyHolder();

        jdbcTemplate.update(connection -> {

            PreparedStatement statement =
                    connection.prepareStatement(
                            sql,
                            Statement.RETURN_GENERATED_KEYS
                    );

            statement.setString(
                    1,
                    email
            );

            statement.setString(
                    2,
                    passwordHash
            );

            statement.setString(
                    3,
                    role
            );

            return statement;

        }, keyHolder);

        Number generatedKey =
                keyHolder.getKey();

        if (generatedKey == null) {

            throw new IllegalStateException(
                    "Unable to create user. User ID was not generated."
            );
        }

        return generatedKey.intValue();
    }


    // =========================================================
    // DELETE USER BY ID
    // =========================================================

    public int deleteById(int userId) {

        String sql = """
                DELETE FROM users
                WHERE user_id = ?
                """;

        return jdbcTemplate.update(
                sql,
                userId
        );
    }
}