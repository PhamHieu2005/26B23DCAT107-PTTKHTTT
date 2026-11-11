<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Đăng nhập - GaraMan</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan – Hệ thống quản lí gara ô tô</b></div>
<div class="box" style="max-width:420px">
    <h2>Đăng nhập</h2>
    <% if ("1".equals(request.getParameter("err"))) { %>
        <p class="msg">Sai tên đăng nhập hoặc mật khẩu.</p>
    <% } %>
    <form action="doLogin7.jsp" method="post">
        <table class="form">
            <tr><td>Tên đăng nhập</td><td><input type="text" name="username" required></td></tr>
            <tr><td>Mật khẩu</td><td><input type="password" name="password" required></td></tr>
        </table>
        <button class="btn" type="submit">Đăng nhập</button>
    </form>
</div>
</body>
</html>
