package org.giritechhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.giritechhub.model.EnrollmentPayment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class StudentFeesRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================================
    // GET ALL PAYMENTS OF STUDENT
    // =========================================================

    public List<EnrollmentPayment> findByStudentId(int studentId) {

        String sql =
                "SELECT " +
                "payment_id, " +
                "student_id, " +
                "transaction_ref, " +
                "amount, " +
                "payment_method, " +
                "payment_status, " +
                "payment_date " +
                "FROM payments " +
                "WHERE student_id = ? " +
                "ORDER BY payment_date DESC";

        return jdbcTemplate.query(
                sql,
                new PaymentRowMapper(),
                studentId
        );
    }


    // =========================================================
    // GET TOTAL PAID AMOUNT
    // =========================================================

    public double getTotalPaidAmount(int studentId) {

        String sql =
                "SELECT COALESCE(SUM(amount), 0) " +
                "FROM payments " +
                "WHERE student_id = ? " +
                "AND payment_status = 'PAID'";

        Double total =
                jdbcTemplate.queryForObject(
                        sql,
                        Double.class,
                        studentId
                );

        return total == null ? 0.0 : total;
    }


    // =========================================================
    // GET TOTAL TRANSACTIONS
    // =========================================================

    public int getTotalTransactions(int studentId) {

        String sql =
                "SELECT COUNT(*) " +
                "FROM payments " +
                "WHERE student_id = ?";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        studentId
                );

        return count == null ? 0 : count;
    }


    // =========================================================
    // GET SUCCESSFUL TRANSACTIONS
    // =========================================================

    public int getSuccessfulTransactions(int studentId) {

        String sql =
                "SELECT COUNT(*) " +
                "FROM payments " +
                "WHERE student_id = ? " +
                "AND payment_status = 'PAID'";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        studentId
                );

        return count == null ? 0 : count;
    }


    // =========================================================
    // GET FAILED / PENDING TRANSACTIONS
    // =========================================================

    public int getPendingTransactions(int studentId) {

        String sql =
                "SELECT COUNT(*) " +
                "FROM payments " +
                "WHERE student_id = ? " +
                "AND payment_status = 'PENDING'";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        studentId
                );

        return count == null ? 0 : count;
    }


    // =========================================================
    // GET ONE PAYMENT
    // =========================================================

    public EnrollmentPayment findById(
            int paymentId,
            int studentId) {

        String sql =
                "SELECT " +
                "payment_id, " +
                "student_id, " +
                "transaction_ref, " +
                "amount, " +
                "payment_method, " +
                "payment_status, " +
                "payment_date " +
                "FROM payments " +
                "WHERE payment_id = ? " +
                "AND student_id = ?";

        List<EnrollmentPayment> result =
                jdbcTemplate.query(
                        sql,
                        new PaymentRowMapper(),
                        paymentId,
                        studentId
                );

        if (result.isEmpty()) {
            return null;
        }

        return result.get(0);
    }


    // =========================================================
    // ROW MAPPER
    // =========================================================

    private static class PaymentRowMapper
            implements RowMapper<EnrollmentPayment> {

        @Override
        public EnrollmentPayment mapRow(
                ResultSet rs,
                int rowNum)
                throws SQLException {

            EnrollmentPayment payment =
                    new EnrollmentPayment();


            payment.setPaymentId(
                    rs.getInt("payment_id")
            );


            payment.setStudentId(
                    rs.getInt("student_id")
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
}