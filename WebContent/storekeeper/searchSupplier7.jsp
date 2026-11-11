<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="model.*, dao.SupplierDAO7" %>
<%@ include file="/WEB-INF/util7.jspf" %>
<%
    Storekeeper7 staff = (Storekeeper7) session.getAttribute("storekeeper");
    if (staff == null) { response.sendRedirect("../member/login7.jsp"); return; }
    String name = request.getParameter("name");
    Supplier7[] listSupplier = null;
    if (name != null) {
        name = name.trim();
        listSupplier = new SupplierDAO7().searchSupplier7(name);
        session.setAttribute("listSupplier", listSupplier);
    }
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Tìm nhà cung cấp</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan</b><span>Nhân viên kho: <%= esc(staff.getFullName()) %> | <a href="../member/logout7.jsp">Đăng xuất</a></span></div>
<div class="box">
    <h2>Tìm nhà cung cấp</h2>
    <form action="searchSupplier7.jsp" method="get">
        Tên NCC: <input type="text" name="name" value="<%= esc(name) %>">
        <button class="btn" type="submit">Tìm</button>
        <a class="btn" href="addSupplier7.jsp">Thêm mới</a>
    </form>
    <% if (listSupplier != null) { %>
        <% if (listSupplier.length == 0) { %>
            <p class="msg">Không tìm thấy nhà cung cấp. Bấm "Thêm mới" để thêm nhà cung cấp.</p>
        <% } else { %>
        <table>
            <tr><th>TT</th><th>Mã</th><th>Tên NCC</th><th>Địa chỉ</th><th>Điện thoại</th><th>Chọn</th></tr>
            <% for (int i = 0; i < listSupplier.length; i++) { Supplier7 s = listSupplier[i]; %>
            <tr><td><%= i + 1 %></td><td>NCC<%= s.getId() %></td><td><%= esc(s.getName()) %></td>
                <td><%= esc(s.getAddress()) %></td><td><%= esc(s.getTel()) %></td>
                <td><a class="btn" href="importPart7.jsp?supplierId=<%= s.getId() %>">Chọn</a></td></tr>
            <% } %>
        </table>
        <% } %>
    <% } %>
    <a class="btn gray" href="storekeeperHome7.jsp">Quay lại</a>
</div>
</body>
</html>
