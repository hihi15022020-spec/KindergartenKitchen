<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập hệ thống</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            background-color: #fcfcfc;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            width: 100%;
            max-width: 380px;
            background: #ffffff;
            padding: 35px 30px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
        }
        .login-container h2 {
            margin-bottom: 25px;
            font-size: 22px;
            text-align: center;
            color: #2c3e50;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 18px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: bold;
            color: #555;
        }
        .form-group input {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            outline: none;
        }
        .form-group input:focus {
            border-color: #007bff;
        }
        .btn-submit {
            width: 100%;
            padding: 11px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: #dc3545;
            font-size: 13px;
            margin-bottom: 15px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Đăng nhập hệ thống</h2>
    
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/auth/login" method="POST">
        <div class="form-group">
            <label for="username">Tên đăng nhập</label>
            <input type="text" id="username" name="username" required placeholder="Nhập tài khoản">
        </div>
        
        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" required placeholder="Nhập mật khẩu">
        </div>
        
        <button type="submit" class="btn-submit">Đăng nhập</button>
    </form>
</div>

</body>
</html>