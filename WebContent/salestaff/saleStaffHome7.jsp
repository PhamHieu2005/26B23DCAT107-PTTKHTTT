<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.Member7" %>
<%@ include file="/WEB-INF/util7.jspf" %>
<%
    Member7 m = (Member7) session.getAttribute("member");
    if (m == null || !"salestaff".equals(m.getRole())) { response.sendRedirect("../member/login7.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Trang chủ nhân viên bán hàng</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan</b><span>Nhân viên bán hàng: <%= esc(m.getFullName()) %> | <a href="../member/logout7.jsp">Đăng xuất</a></span></div>
<div class="box">
    <h2>Trang chủ nhân viên bán hàng</h2>
    <div class="menu">
        <span>Nhận xe sửa chữa (chưa hỗ trợ)</span>
        <span>Nhận thanh toán (chưa hỗ trợ)</span>
    </div>
</div>
</body>
</html>
