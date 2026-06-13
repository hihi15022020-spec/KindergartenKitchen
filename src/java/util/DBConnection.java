package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String SERVER_NAME = "localhost";
    private static final String PORT = "1433";
    private static final String DB_NAME = "QuanLyBepAn"; // đổi tên DB nếu khác
    private static final String USER = "sa";
    private static final String PASSWORD = "123"; 

    private static final String URL = "jdbc:sqlserver://" + SERVER_NAME + ":" + PORT
            + ";QuanLyBepAn=" + DB_NAME
            + ";encrypt=true;trustServerCertificate=true";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Không tìm thấy SQL Server JDBC Driver: " + e.getMessage());
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Test kết nối
    public static void main(String[] args) {
        try (Connection conn = getConnection()) {
            if (conn != null) {
                System.out.println("Kết nối thành công!");
            }
        } catch (SQLException e) {
            System.out.println("Kết nối thất bại: " + e.getMessage());
        }
    }
}