package dao;

import model.Use;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UseDAO {

    // Kiểm tra đăng nhập, JOIN lấy luôn RoleName
    public Use checkLogin(String username, String password) {
        String sql = "SELECT u.UserID, u.Username, u.Password, u.FullName, u.Email, "
                    + "u.Phone, u.RoleID, r.RoleName, u.Status "
                    + "FROM Users u JOIN Roles r ON u.RoleID = r.RoleID "
                    + "WHERE u.Username = ? AND u.Password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password); // Nên hash password trong thực tế

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Use user = new Use();
                    user.setUserID(rs.getInt("UserID"));
                    user.setUsername(rs.getString("Username"));
                    user.setPassword(rs.getString("Password"));
                    user.setFullName(rs.getString("FullName"));
                    user.setEmail(rs.getString("Email"));
                    user.setPhone(rs.getString("Phone"));
                    user.setRoleID(rs.getInt("RoleID"));
                    user.setRoleName(rs.getString("RoleName"));
                    user.setStatus(rs.getString("Status"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // sai username/password
    }

    // Kiểm tra username đã tồn tại chưa (dùng cho đăng ký nếu có)
    public boolean isUsernameExists(String username) {
        String sql = "SELECT UserID FROM Users WHERE Username = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Thêm user mới
    public boolean insertUser(Use user) {
        String sql = "INSERT INTO Users(Username, Password, FullName, Email, Phone, RoleID, Status) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullName());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhone());
            ps.setInt(6, user.getRoleID());
            ps.setString(7, user.getStatus());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}