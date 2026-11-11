<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.Storekeeper7" %>
<%@ include file="/WEB-INF/util7.jspf" %>
<%
    Storekeeper7 staff = (Storekeeper7) session.getAttribute("storekeeper");
    if (staff == null) { response.sendRedirect("../member/login7.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Trang chủ nhân viên kho</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan</b><span>Nhân viên kho: <%= esc(staff.getFullName()) %> | <a href="../member/logout7.jsp">Đăng xuất</a></span></div>
<div class="box">
    <h2>Trang chủ nhân viên kho</h2>
    <div class="menu">
        <a href="searchSupplier7.jsp">Nhập phụ tùng</a>
        <span>Quản lí nhà cung cấp (chưa hỗ trợ)</span>
    </div>
</div>
</body>
</html>
