<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ thống quản lý bếp ăn Mầm Non</title>
    <style>
        /* RESET BASIC & FONT */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Font chữ hiện đại*/
        }
        body {
            background-color: #f7f9fa; /* Nền xám nhạt */
            color: #4a4a4a;
            line-height: 1.6;
        }

        
        .main-header {
            background-color: #ffffff;
            border-bottom: 3px solid #ffcc00; /* Đường kẻ màu vàng tươi */
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 40px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.02);
        }
        .main-header .logo {
            font-size: 20px;
            font-weight: bold;
            color: #ff6b6b; /* Màu cam hồng dâu tây */
            text-transform: uppercase;
            letter-spacing: 0.5px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .main-header .logo::before {
            content: "🍳"; /* icon */
            font-size: 22px;
        }
        .main-nav {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .main-nav a {
            color: #5c6b73;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            padding: 8px 14px;
            border-radius: 20px; /* các nút menu */
            transition: all 0.2s ease;
        }
        .main-nav a:hover {
            color: #ffffff;
            background-color: #4ecdc4; /* Màu xanh(bạc hà) */
        }
        .main-nav .user-info {
            font-size: 14px;
            color: #777;
            padding-left: 15px;
            border-left: 2px dashed #ddd; /* Đường chia nét đứt*/
        }
        .main-nav .user-info b {
            color: #ff6b6b;
        }
        .btn-logout {
            color: #ff6b6b !important;
            border: 1px solid #ff8e8e;
        }
        .btn-logout:hover {
            background-color: #ff6b6b !important;
            color: #fff !important;
        }

        /* MAIN CONTENT */
        .main-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px 20px;
            min-height: 75vh;
        }

        /*  FORM STYLE */
        .form-container {
            max-width: 450px;
            margin: 40px auto;
            background: #fff;
            padding: 35px;
            border: none;
            border-radius: 16px; 
            box-shadow: 0 8px 24px rgba(0,0,0,0.05); /* Đổ bóng mịn */
            border-top: 5px solid #4ecdc4; /* viền trên màu xanh */
        }
        .form-container h2 {
            margin-bottom: 25px;
            font-size: 22px;
            text-align: center;
            color: #2f3e46;
            font-weight: 700;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: 600;
            color: #5c6b73;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px 14px;
            border: 2px solid #eef1f6;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s;
            background-color: #fcfdfe;
        }
        .form-group input:focus,
        .form-group select:focus {
            border-color: #4ecdc4; /* màu xanh */
            background-color: #fff;
        }
        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #ff9f43; /* Màu cam ấm áp */
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.2s;
            box-shadow: 0 4px 12px rgba(255, 159, 67, 0.3);
        }
        .btn-submit:hover {
            background-color: #ee8a26;
        }
        .error-message {
            color: #ff6b6b;
            font-size: 13px;
            margin-bottom: 12px;
            text-align: center;
            background: #ffeef0;
            padding: 8px;
            border-radius: 6px;
        }

        /* TABLE STYLE */
        table.data-table {
            width: 100%;
            border-collapse: separate; /* border-radius cho table */
            border-spacing: 0;
            background: #fff;
            margin-top: 20px;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.03);
            border: 1px solid #eef1f6;
        }
        table.data-table th,
        table.data-table td {
            padding: 14px 18px;
            border-bottom: 1px solid #eef1f6;
            text-align: left;
            font-size: 14px;
        }
        table.data-table th {
            background-color: #f1f9f9; /* Màu nền xanh */
            color: #2f3e46;
            font-weight: 700;
        }
        table.data-table tr:last-child td {
            border-bottom: none; /* Xóa viền hàng cuối để không lỗi bo góc */
        }
        table.data-table tr:hover {
            background-color: #f9fbfb; /* Hiệu ứng */
        }

        /* FOOTER  */
        .main-footer {
            background-color: #ffffff;
            color: #a0abba;
            text-align: center;
            padding: 25px;
            font-size: 13px;
            border-top: 1px solid #eef1f6;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<header class="main-header">
    <div class="logo">Mầm Non Kitchen</div>
    <nav class="main-nav">
        <c:if test="${not empty sessionScope.user}">
            <c:if test="${sessionScope.role == 'admin'}">
                <a href="${pageContext.request.contextPath}/admin/dashboard" style="background-color: #fff3cd; color: #856404;">Quản trị</a>
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