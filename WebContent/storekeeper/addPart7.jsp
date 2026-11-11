<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.Storekeeper7" %>
<%@ include file="/WEB-INF/util7.jspf" %>
<%
    Storekeeper7 staff = (Storekeeper7) session.getAttribute("storekeeper");
    if (staff == null) { response.sendRedirect("../member/login7.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Thêm phụ tùng</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan</b><span>Nhân viên kho: <%= esc(staff.getFullName()) %> | <a href="../member/logout7.jsp">Đăng xuất</a></span></div>
<div class="box" style="max-width:600px">
    <h2>Thêm phụ tùng mới</h2>
    <% if ("1".equals(request.getParameter("err"))) { %><p class="msg">Tên phụ tùng không được để trống và đơn giá phải lớn hơn 0.</p><% } %>
    <form action="doAddPart7.jsp" method="post">
        <table class="form">
            <tr><td>Tên phụ tùng</td><td><input type="text" name="name" required></td></tr>
            <tr><td>Hãng SX</td><td><input type="text" name="manufacturer"></td></tr>
            <tr><td>Đơn giá bán</td><td><input type="number" name="price" min="1" required></td></tr>
            <tr><td>Mô tả</td><td><input type="text" name="description"></td></tr>
        </table>
        <button class="btn" type="submit">Lưu</button>
        <a class="btn gray" href="searchPart7.jsp">Quay lại</a>
    </form>
</div>
</body>
</html>
