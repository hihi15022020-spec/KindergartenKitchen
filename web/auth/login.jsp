<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập hệ thống - Bếp ăn Mầm Non</title>
    <style>
          
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        /*NỀN BẦU TRỜI MẦM NON */
        body {
            background: linear-gradient(to bottom, #bfeeff 0%, #e0f7ff 100%); /* Màu xanh da trời*/
            color: #4a4a4a;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            position: relative;
        }

        /* ÔNG MẶT TRỜI CSS */
        .sun {
            position: absolute;
            top: 12%;
            right: 15%;
            width: 130px;
            height: 130px;
            background: #ffcc00;
            border-radius: 50%;
            box-shadow: 0 0 40px #ffdd33, inset -10px -10px 0px #f3b500;
            z-index: 1;
            animation: sunPulse 4s ease-in-out infinite alternate;
        }
        /* Tia nắng xung quanh mặt trời */
        .sun::before {
            content: '';
            position: absolute;
            top: -10px; left: -10px; right: -10px; bottom: -10px;
            background: rgba(255, 204, 0, 0.2);
            border-radius: 50%;
            z-index: -1;
            animation: sunRadiate 3s linear infinite;
        }
        /* ông mặt trời */
        .sun-face {
            position: relative;
            width: 100%;
            height: 100%;
        }
        .sun-face::before { /* Hai mắt */
            content: '•  •';
            position: absolute;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #6d4c41;
            font-size: 26px;
            font-weight: bold;
            letter-spacing: 5px;
        }
        .sun-face::after { /* Miệng cười */
            content: '';
            position: absolute;
            top: 55%;
            left: 50%;
            transform: translateX(-50%);
            width: 24px;
            height: 12px;
            border-bottom: 4px solid #6d4c41;
            border-radius: 0 0 15px 15px;
        }

        /* ===== ĐÁM MÂY CSS ===== */
        .cloud-container {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 1;
            pointer-events: none; 
        }
        .cloud {
            position: absolute;
            background: #ffffff;
            border-radius: 100px;
            opacity: 0.9;
            filter: drop-shadow(0 8px 15px rgba(0,0,0,0.04));
        }
        .cloud::before, .cloud::after {
            content: '';
            position: absolute;
            background: #ffffff;
            border-radius: 50%;
        }
        
        /* Định hình từng đám mây*/
        .cloud.c1 {
            width: 220px; height: 70px;
            top: 25%; left: 10%;
            animation: floatCloud 25s linear infinite;
        }
        .cloud.c1::before { width: 90px; height: 90px; top: -45px; left: 30px; }
        .cloud.c1::after { width: 110px; height: 110px; top: -55px; right: 30px; }

        .cloud.c2 {
            width: 180px; height: 55px;
            top: 18%; right: 8%;
            opacity: 0.8;
            animation: floatCloudReverse 30s linear infinite;
        }
        .cloud.c2::before { width: 70px; height: 70px; top: -35px; left: 25px; }
        .cloud.c2::after { width: 85px; height: 85px; top: -45px; right: 25px; }

        .cloud.c3 {
            width: 300px; height: 90px;
            bottom: 12%; left: -5%;
            opacity: 0.85;
            animation: floatCloud 35s linear infinite;
        }
        .cloud.c3::before { width: 120px; height: 120px; top: -60px; left: 40px; }
        .cloud.c3::after { width: 150px; height: 150px; top: -80px; right: 40px; }

        .cloud.c4 {
            width: 200px; height: 65px;
            bottom: 20%; right: 15%;
            animation: floatCloudReverse 28s linear infinite;
        }
        .cloud.c4::before { width: 80px; height: 80px; top: -40px; left: 30px; }
        .cloud.c4::after { width: 100px; height: 100px; top: -50px; right: 30px; }

        /* ===== CONTAINER ĐĂNG NHẬP ===== */
        .login-container {
            width: 100%;
            max-width: 400px;
            background: rgba(255, 255, 255, 0.96); 
            padding: 40px 35px;
            border: none;
            border-radius: 24px;
            box-shadow: 0 15px 35px rgba(44, 62, 80, 0.1);
            border-top: 6px solid #4ecdc4;
            position: relative;
            z-index: 10; /* Đảm bảo form luôn nằm lên trên mây và mặt trời */
            backdrop-filter: blur(5px); /* Làm mờ nhẹ nền phía sau form */
        }

        .login-icon {
            text-align: center;
            font-size: 45px;
            margin-bottom: 10px;
            line-height: 1;
        }

        .login-container h2 {
            margin-bottom: 8px;
            font-size: 24px;
            text-align: center;
            color: #2f3e46;
            font-weight: 700;
        }
        
        .login-subtitle {
            text-align: center;
            font-size: 13px;
            color: #9cb0b8;
            margin-bottom: 30px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        /* FORM INPUTS */
        .form-group {
            margin-bottom: 22px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: 600;
            color: #5c6b73;
        }
        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #eef1f6;
            border-radius: 12px;
            font-size: 14px;
            outline: none;
            transition: all 0.2s ease;
            background-color: #fcfdfe;
            color: #333;
        }
        .form-group input::placeholder {
            color: #c0cbd4;
        }
        .form-group input:focus {
            border-color: #4ecdc4;
            background-color: #fff;
            box-shadow: 0 0 0 3px rgba(78, 205, 196, 0.15);
        }

        /*BUTTON SUBMIT */
        .btn-submit {
            width: 100%;
            padding: 13px;
            background-color: #ff9f43;
            color: #fff;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: 0 5px 15px rgba(255, 159, 67, 0.3);
            margin-top: 10px;
        }
        .btn-submit:hover {
            background-color: #ee8a26;
            transform: translateY(-1px);
            box-shadow: 0 7px 18px rgba(255, 159, 67, 0.4);
        }
        .btn-submit:active {
            transform: translateY(1px);
        }

        /*ERROR MESSAGE */
        .error-message {
            color: #ff6b6b;
            font-size: 13px;
            margin-bottom: 20px;
            text-align: center;
            background: #ffeef0;
            padding: 10px 12px;
            border-radius: 8px;
            border-left: 4px solid #ff6b6b;
            font-weight: 500;
        }

        /* ANIMATIONS CHUYỂN ĐỘNG */
        @keyframes sunPulse {
            0% { transform: scale(1); }
            100% { transform: scale(1.04); }
        }
        @keyframes sunRadiate {
            0% { transform: scale(1); opacity: 1; }
            100% { transform: scale(1.2); opacity: 0; }
        }
        @keyframes floatCloud {
            0% { transform: translateX(-120%); }
            100% { transform: translateX(500%); }
        }
        @keyframes floatCloudReverse {
            0% { transform: translateX(120%); }
            100% { transform: translateX(-500%); }
        }
    </style>
</head>
<body>

<div class="sun">
    <div class="sun-face"></div>
</div>

<div class="cloud-container">
    <div class="cloud c1"></div>
    <div class="cloud c2"></div>
    <div class="cloud c3"></div>
    <div class="cloud c4"></div>
</div>

<div class="login-container">
    <div class="login-icon">🍳</div>
    
    <h2>Hệ Thống Bếp Ăn</h2>
    <div class="login-subtitle">QUẢN LÝ DINH DƯỠNG MẦM NON</div>
    
    <c:if test="${not empty error}">
        <div class="error-message">⚠️ ${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/auth/login" method="POST">
        <div class="form-group">
            <label for="username">Tên đăng nhập</label>
            <input type="text" id="username" name="username" required placeholder="Tài Khoản mà bạn được cấp">
        </div>
        
        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" required placeholder="Nhập mật khẩu của bạn">
        </div>
        
        <button type="submit" class="btn-submit">Đăng Nhập Ngay</button>
    </form>
</div>

</body>
</html>