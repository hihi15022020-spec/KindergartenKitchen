<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ thống quản lý bếp ăn</title>
    <style>
        /* ===== RESET BASIC ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif; /* Đổi font sang Arial cực kỳ basic */
        }
        body {
            background-color: #fcfcfc;
            color: #333;
            line-height: 1.6;
        }

        /* ===== HEADER SIMPLE ===== */
        .main-header {
            background-color: #ffffff;
            border-bottom: 1px solid #e0e0e0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 40px;
        }
        .main-header .logo {
            font-size: 18px;
            font-weight: bold;
            color: #2c3e50;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .main-nav {
            display: flex;
            align-items: center;
            gap: 20px; /* Tạo khoảng cách đều giữa các link */
        }
        .main-nav a {
            color: #555;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            padding: 5px 0;
            transition: color 0.2s;
        }
        .main-nav a:hover {
            color: #007bff; /* Màu xanh basic khi hover */
            border-bottom: 2px solid #007bff;
        }
        .main-nav .user-info {
            font-size: 14px;
            color: #777;
            padding-left: 10px;
            border-left: 1px solid #ddd;
        }
        .btn-logout {
            color: #dc3545 !important; /* Màu đỏ cho nút đăng xuất */
        }
        .btn-logout:hover {
            border-bottom: 2px solid #dc3545 !important;
        }

        /* ===== MAIN CONTENT ===== */
        .main-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px 20px;
            min-height: 75vh;
        }

        /* ===== FORM BASIC ===== */
        .form-container {
            max-width: 400px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
        }
        .form-container h2 {
            margin-bottom: 20px;
            font-size: 20px;
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            font-weight: bold;
            color: #555;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            outline: none;
        }
        .form-group input:focus,
        .form-group select:focus {
            border-color: #007bff;
        }
        .btn-submit {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: #dc3545;
            font-size: 13px;
            margin-bottom: 10px;
            text-align: center;
        }

        /* ===== TABLE BASIC ===== */
        table.data-table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            margin-top: 15px;
        }
        table.data-table th,
        table.data-table td {
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            text-align: left;
            font-size: 14px;
        }
        table.data-table th {
            background-color: #f8f9fa; /* Màu nền th nhẹ nhàng, không bị đen thui */
            color: #333;
            font-weight: bold;
        }
        table.data-table tr:hover {
            background-color: #f1f3f5; /* Hiệu ứng highlight dòng nhẹ nhàng */
        }

        /* ===== FOOTER ===== */
        .main-footer {
            background-color: #ffffff;
            color: #777;
            text-align: center;
            padding: 20px;
            font-size: 13px;
            border-top: 1px solid #e0e0e0;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<header class="main-header">
    <div class="logo">Kitchen Management</div>
    <nav class="main-nav">
        <c:if test="${not empty sessionScope.user}">
            <c:if test="${sessionScope.role == 'admin'}">
                <a href="${pageContext.request.contextPath}/admin/dashboard">Quản trị</a>
            </c:if>
            <a href="${pageContext.request.contextPath}/menu/list">Menu</a>
            <a href="${pageContext.request.contextPath}/attendance/list">Điểm danh</a>
            <a href="${pageContext.request.contextPath}/student/list">Học sinh</a>
            <a href="${pageContext.request.contextPath}/ingredient/list">Nguyên liệu</a>
            <a href="${pageContext.request.contextPath}/notification/list">Thông báo</a>
            <span class="user-info">Xin chào, <b>${sessionScope.user.fullName}</b></span>
            <a href="${pageContext.request.contextPath}/auth/logout" class="btn-logout">Đăng xuất</a>
        </c:if>
    </nav>
</header>

<main class="main-content">
    </main>

<footer class="main-footer">
    &copy; 2026 - Hệ thống quản lý bếp ăn mầm non. All rights reserved.
</footer>

</body>
</html>