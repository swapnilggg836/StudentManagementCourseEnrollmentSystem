package org.giritechhub.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
public class DBConfig {

    // =========================================================
    // DATABASE CONNECTION
    // =========================================================

    @Bean
    public DataSource dataSource() {

        DriverManagerDataSource dataSource =
                new DriverManagerDataSource();

        dataSource.setDriverClassName(
                "com.mysql.cj.jdbc.Driver"
        );

        dataSource.setUrl(
                "jdbc:mysql://localhost:3306/student_management_db"
        );

        dataSource.setUsername("root");

        dataSource.setPassword("root");

        return dataSource;
    }


    // =========================================================
    // JDBC TEMPLATE
    // =========================================================

    @Bean
    public JdbcTemplate jdbcTemplate(
            DataSource dataSource) {

        return new JdbcTemplate(dataSource);
    }


    // =========================================================
    // TRANSACTION MANAGER
    // =========================================================

    @Bean
    public PlatformTransactionManager transactionManager(
            DataSource dataSource) {

        return new DataSourceTransactionManager(
                dataSource
        );
    }

}