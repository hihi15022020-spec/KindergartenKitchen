package serverlet;

import dao.UseDAO;
import model.Use;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/auth/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UseDAO dao = new UseDAO();
        Use user = dao.checkLogin(username, password);

        if (user != null) {
            if ("inactive".equalsIgnoreCase(user.getStatus())) {
                req.setAttribute("error", "Tài khoản đã bị khóa.");
                req.getRequestDispatcher("/auth/login.jsp").forward(req, resp);
                return;
            }

            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRoleName());
            session.setMaxInactiveInterval(30 * 60); // 30 phút

            // Điều hướng theo role
            String role = user.getRoleName().toLowerCase();
            switch (role) {
                case "admin":
                    resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
                    break;
                default:
                    resp.sendRedirect(req.getContextPath() + "/");
                    break;
            }
        } else {
            req.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu.");
            req.getRequestDispatcher("/auth/login.jsp").forward(req, resp);
        }
    }
}