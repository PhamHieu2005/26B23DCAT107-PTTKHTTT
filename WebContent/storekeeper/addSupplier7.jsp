<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.Storekeeper7" %>
<%@ include file="/WEB-INF/util7.jspf" %>
<%
    Storekeeper7 staff = (Storekeeper7) session.getAttribute("storekeeper");
    if (staff == null) { response.sendRedirect("../member/login7.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Thêm nhà cung cấp</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan</b><span>Nhân viên kho: <%= esc(staff.getFullName()) %> | <a href="../member/logout7.jsp">Đăng xuất</a></span></div>
<div class="box" style="max-width:600px">
    <h2>Thêm nhà cung cấp mới</h2>
    <% if ("1".equals(request.getParameter("err"))) { %><p class="msg">Tên nhà cung cấp không được để trống.</p><% } %>
    <form action="doAddSupplier7.jsp" method="post">
        <table class="form">
            <tr><td>Tên NCC</td><td><input type="text" name="name" required></td></tr>
            <tr><td>Địa chỉ</td><td><input type="text" name="address"></td></tr>
            <tr><td>Điện thoại</td><td><input type="text" name="tel"></td></tr>
            <tr><td>Email</td><td><input type="text" name="email"></td></tr>
            <tr><td>Mô tả</td><td><input type="text" name="description"></td></tr>
        </table>
        <button class="btn" type="submit">Lưu</button>
        <a class="btn gray" href="searchSupplier7.jsp">Quay lại</a>
    </form>
</div>
</body>
</html>
