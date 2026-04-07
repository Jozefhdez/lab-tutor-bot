package com.tutorbot.gapdetector.config;

import jakarta.annotation.PostConstruct;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class DatabaseHealthCheck {

    private static final Logger log = LoggerFactory.getLogger(DatabaseHealthCheck.class);

    private final DataSource dataSource;

    public DatabaseHealthCheck(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @PostConstruct
    public void verifyConnection() {
        String url = "unknown";
        try (Connection conn = dataSource.getConnection()) {
            url = conn.getMetaData().getURL();
            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery("SELECT 1 FROM DUAL")) {
                if (rs.next()) {
                    log.info("Oracle connection verified successfully — URL: {}", url);
                }
            }
        } catch (Exception e) {
            log.error("Failed to connect to Oracle database — URL: {}", url, e);
        }
    }
}
