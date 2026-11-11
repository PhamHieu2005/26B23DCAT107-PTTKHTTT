<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="model.*, dao.SparePartDAO7" %>
<%@ include file="/WEB-INF/util7.jspf" %>
<%
    Customer7 customer = (Customer7) session.getAttribute("customer");
    if (customer == null) { response.sendRedirect("../member/login7.jsp"); return; }
    SparePart7 part = null;
    try {
        part = new SparePartDAO7().getSparePart7(Integer.parseInt(request.getParameter("id")));
    } catch (NumberFormatException e) {
        // id không hợp lệ: hiển thị thông báo bên dưới
    }
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Chi tiết phụ tùng</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan</b><span>Xin chào: <%= esc(customer.getFullName()) %> | <a href="../member/logout7.jsp">Đăng xuất</a></span></div>
<div class="box" style="max-width:600px">
    <h2>Chi tiết phụ tùng</h2>
    <% if (part == null) { %>
        <p class="msg">Không tìm thấy phụ tùng.</p>
    <% } else { %>
    <table>
        <tr><th>Mã phụ tùng</th><td>PT<%= part.getId() %></td></tr>
        <tr><th>Tên phụ tùng</th><td><%= esc(part.getName()) %></td></tr>
        <tr><th>Hãng SX</th><td><%= esc(part.getManufacturer()) %></td></tr>
        <tr><th>Đơn giá</th><td><%= money(part.getPrice()) %></td></tr>
        <tr><th>Mô tả</th><td><%= esc(part.getDescription()) %></td></tr>
    </table>
    <% } %>
    <a class="btn gray" href="search7.jsp">Quay lại</a>
</div>
</body>
</html>
