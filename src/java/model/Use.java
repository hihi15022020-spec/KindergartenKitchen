package model;

public class Use {
    private int userID;
    private String username;
    private String password;
    private String fullName;
    private String email;
    private String phone;
    private int roleID;
    private String roleName; // dùng khi JOIN với bảng Roles
    private String status;

    public Use() {}

    public Use(int userID, String username, String password, String fullName,
                 String email, String phone, int roleID, String status) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.roleID = roleID;
        this.status = status;
    }

    // Getters & Setters
    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public int getRoleID() { return roleID; }
    public void setRoleID(int roleID) { this.roleID = roleID; }

    public String getRoleName() { return roleName; }
    public void setRoleName(String roleName) { this.roleName = roleName; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}