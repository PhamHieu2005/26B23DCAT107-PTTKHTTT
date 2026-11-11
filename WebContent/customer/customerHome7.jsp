<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.Customer7" %>
<%@ include file="/WEB-INF/util7.jspf" %>
<%
    Customer7 customer = (Customer7) session.getAttribute("customer");
    if (customer == null) { response.sendRedirect("../member/login7.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Trang chủ khách hàng</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan</b><span>Xin chào: <%= esc(customer.getFullName()) %> | <a href="../member/logout7.jsp">Đăng xuất</a></span></div>
<div class="box">
    <h2>Trang chủ khách hàng</h2>
    <div class="menu">
        <a href="search7.jsp">Tìm kiếm dịch vụ/phụ tùng</a>
        <span>Đặt lịch hẹn trực tuyến (chưa hỗ trợ)</span>
    </div>
</div>
</body>
</html>
