package org.giritechhub.repository;

import java.util.ArrayList;
import java.util.List;

import org.giritechhub.model.EnrollmentPayment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentRepository {

    private final JdbcTemplate jdbcTemplate;

    public PaymentRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    // =========================================================
    // GET ALL PAYMENTS
    // =========================================================

    public List<EnrollmentPayment> findAll() {

        String sql = """
                SELECT
                    p.payment_id,
                    p.student_id,

                    CONCAT(s.first_name, ' ', s.last_name)
                        AS student_name,

                    s.roll_no,
                    s.semester,

                    p.transaction_ref,
                    p.amount,
                    p.payment_method,
                    p.payment_status,
                    p.payment_date

                FROM payments p

                INNER JOIN students s
                    ON p.student_id = s.student_id

                ORDER BY p.payment_id DESC
                """;

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> mapRow(rs)
        );
    }


    // =========================================================
    // GET PAYMENT BY ID
    // =========================================================

    public EnrollmentPayment findById(int paymentId) {

        String sql = """
                SELECT
                    p.payment_id,
                    p.student_id,

                    CONCAT(s.first_name, ' ', s.last_name)
                        AS student_name,

                    s.roll_no,
                    s.semester,

                    p.transaction_ref,
                    p.amount,
                    p.payment_method,
                    p.payment_status,
                    p.payment_date

                FROM payments p

                INNER JOIN students s
                    ON p.student_id = s.student_id

                WHERE p.payment_id = ?
                """;

        List<EnrollmentPayment> payments =
                jdbcTemplate.query(
                        sql,
                        (rs, rowNum) -> mapRow(rs),
                        paymentId
                );

        return payments.isEmpty()
                ? null
                : payments.get(0);
    }


    // =========================================================
    // SEARCH / FILTER PAYMENTS
    // =========================================================

    public List<EnrollmentPayment> search(
            Integer studentId,
            Integer semester,
            String paymentStatus) {

        StringBuilder sql = new StringBuilder("""
                SELECT
                    p.payment_id,
                    p.student_id,

                    CONCAT(s.first_name, ' ', s.last_name)
                        AS student_name,

                    s.roll_no,
                    s.semester,

                    p.transaction_ref,
                    p.amount,
                    p.payment_method,
                    p.payment_status,
                    p.payment_date

                FROM payments p

                INNER JOIN students s
                    ON p.student_id = s.student_id

                WHERE 1 = 1
                """);

        List<Object> params = new ArrayList<>();


        // Student filter
        if (studentId != null) {

            sql.append("""
                    AND p.student_id = ?
                    """);

            params.add(studentId);
        }


        // Semester filter
        if (semester != null) {

            sql.append("""
                    AND s.semester = ?
                    """);

            params.add(semester);
        }


        // Payment status filter
        if (paymentStatus != null
                && !paymentStatus.isBlank()) {

            sql.append("""
                    AND p.payment_status = ?
                    """);

            params.add(paymentStatus);
        }


        sql.append("""
                ORDER BY p.payment_id DESC
                """);


        return jdbcTemplate.query(
                sql.toString(),
                (rs, rowNum) -> mapRow(rs),
                params.toArray()
        );
    }


    // =========================================================
    // SAVE PAYMENT
    // =========================================================

    public int save(EnrollmentPayment payment) {

        String sql = """
                INSERT INTO payments
                (
                    student_id,
                    transaction_ref,
                    amount,
                    payment_method,
                    payment_status,
                    payment_date
                )
                VALUES
                (
                    ?,
                    ?,
                    ?,
                    ?,
                    ?,
                    CURRENT_TIMESTAMP
                )
                """;

        return jdbcTemplate.update(
                sql,
                payment.getStudentId(),
                payment.getTransactionRef(),
                payment.getAmount(),
                payment.getPaymentMethod(),
                payment.getPaymentStatus()
        );
    }


    // =========================================================
    // UPDATE PAYMENT
    // =========================================================

    public int update(EnrollmentPayment payment) {

        String sql = """
                UPDATE payments
                SET
                    student_id = ?,
                    transaction_ref = ?,
                    amount = ?,
                    payment_method = ?,
                    payment_status = ?
                WHERE payment_id = ?
                """;

        return jdbcTemplate.update(
                sql,
                payment.getStudentId(),
                payment.getTransactionRef(),
                payment.getAmount(),
                payment.getPaymentMethod(),
                payment.getPaymentStatus(),
                payment.getPaymentId()
        );
    }


    // =========================================================
    // DELETE PAYMENT
    // =========================================================

    public int delete(int paymentId) {

        String sql = """
                DELETE FROM payments
                WHERE payment_id = ?
                """;

        return jdbcTemplate.update(
                sql,
                paymentId
        );
    }


    // =========================================================
    // COUNT ALL PAYMENTS
    // =========================================================

    public int countAll() {

        String sql = """
                SELECT COUNT(*)
                FROM payments
                """;

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class
                );

        return count == null ? 0 : count;
    }


    // =========================================================
    // COUNT SUCCESSFUL PAYMENTS
    // =========================================================

    public int countPaid() {

        String sql = """
                SELECT COUNT(*)
                FROM payments
                WHERE payment_status = 'PAID'
                """;

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class
                );

        return count == null ? 0 : count;
    }


    // =========================================================
    // COUNT FAILED PAYMENTS
    // =========================================================

    public int countFailed() {

        String sql = """
                SELECT COUNT(*)
                FROM payments
                WHERE payment_status = 'FAILED'
                """;

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class
                );

        return count == null ? 0 : count;
    }


    // =========================================================
    // COUNT PENDING PAYMENTS
    // =========================================================

    public int countPending() {

        String sql = """
                SELECT COUNT(*)
                FROM payments
                WHERE payment_status = 'PENDING'
                """;

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class
                );

        return count == null ? 0 : count;
    }


    // =========================================================
    // TOTAL REVENUE
    // =========================================================

    public java.math.BigDecimal getTotalRevenue() {

        String sql = """
                SELECT COALESCE(
                    SUM(amount),
                    0
                )
                FROM payments
                WHERE payment_status = 'PAID'
                """;

        java.math.BigDecimal revenue =
                jdbcTemplate.queryForObject(
                        sql,
                        java.math.BigDecimal.class
                );

        return revenue == null
                ? java.math.BigDecimal.ZERO
                : revenue;
    }


    // =========================================================
    // CHECK TRANSACTION REFERENCE
    // =========================================================

    public boolean transactionExists(
            String transactionRef) {

        String sql = """
                SELECT COUNT(*)
                FROM payments
                WHERE transaction_ref = ?
                """;

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        transactionRef
                );

        return count != null && count > 0;
    }


    // =========================================================
    // ROW MAPPER
    // =========================================================

    private EnrollmentPayment mapRow(
            java.sql.ResultSet rs)
            throws java.sql.SQLException {

        EnrollmentPayment payment =
                new EnrollmentPayment();


        payment.setPaymentId(
                rs.getInt("payment_id")
        );


        payment.setStudentId(
                rs.getInt("student_id")
        );


        payment.setStudentName(
                rs.getString("student_name")
        );


        payment.setRollNo(
                rs.getString("roll_no")
        );


        payment.setSemester(
                rs.getInt("semester")
        );


        payment.setTransactionRef(
                rs.getString("transaction_ref")
        );


        payment.setAmount(
                rs.getBigDecimal("amount")
        );


        payment.setPaymentMethod(
                rs.getString("payment_method")
        );


        payment.setPaymentStatus(
                rs.getString("payment_status")
        );


        if (rs.getTimestamp("payment_date") != null) {

            payment.setPaymentDate(
                    rs.getTimestamp("payment_date")
                            .toLocalDateTime()
            );
        }


        return payment;
    }
}