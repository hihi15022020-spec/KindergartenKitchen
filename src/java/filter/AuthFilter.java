package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthFilter implements Filter {

    // Các URL không cần đăng nhập
    private static final String[] PUBLIC_URLS = {
        "/auth/login",
        "/common/style.css"
    };

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();
        String path = uri.substring(contextPath.length());

        boolean isPublic = false;
        for (String publicUrl : PUBLIC_URLS) {
            if (path.startsWith(publicUrl)) {
                isPublic = true;
                break;
            }
        }

        // Bỏ qua file static (css, js, ảnh)
        if (path.endsWith(".css") || path.endsWith(".js") || path.endsWith(".png")
                || path.endsWith(".jpg") || path.endsWith(".jpeg")) {
            isPublic = true;
        }

        boolean loggedIn = (session != null && session.getAttribute("user") != null);

        if (isPublic || loggedIn) {
            // Nếu vào /admin/* nhưng không phải admin -> chặn
            if (path.startsWith("/admin/") && loggedIn) {
                String role = (String) session.getAttribute("role");
                if (role == null || !role.equalsIgnoreCase("admin")) {
                    res.sendRedirect(contextPath + "/auth/login?error=forbidden");
                    return;
                }
            }
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(contextPath + "/auth/login");
        }
    }

    @Override
    public void init(FilterConfig filterConfig) {}

    @Override
    public void destroy() {}
}