<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="model.*, dao.ServiceDAO7" %>
<%@ include file="/WEB-INF/util7.jspf" %>
<%
    Customer7 customer = (Customer7) session.getAttribute("customer");
    if (customer == null) { response.sendRedirect("../member/login7.jsp"); return; }
    Service7 service = null;
    try {
        service = new ServiceDAO7().getService7(Integer.parseInt(request.getParameter("id")));
    } catch (NumberFormatException e) {
        // id không hợp lệ: hiển thị thông báo bên dưới
    }
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Chi tiết dịch vụ</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan</b><span>Xin chào: <%= esc(customer.getFullName()) %> | <a href="../member/logout7.jsp">Đăng xuất</a></span></div>
<div class="box" style="max-width:600px">
    <h2>Chi tiết dịch vụ</h2>
    <% if (service == null) { %>
        <p class="msg">Không tìm thấy dịch vụ.</p>
    <% } else { %>
    <table>
        <tr><th>Mã dịch vụ</th><td>DV<%= service.getId() %></td></tr>
        <tr><th>Tên dịch vụ</th><td><%= esc(service.getName()) %></td></tr>
        <tr><th>Đơn giá</th><td><%= money(service.getPrice()) %></td></tr>
        <tr><th>Thời gian</th><td><%= service.getDuration() %> phút</td></tr>
        <tr><th>Mô tả</th><td><%= esc(service.getDescription()) %></td></tr>
    </table>
    <% } %>
    <a class="btn gray" href="search7.jsp">Quay lại</a>
</div>
</body>
</html>
