<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="model.*, dao.ServiceDAO7, dao.SparePartDAO7" %>
<%@ include file="/WEB-INF/util7.jspf" %>
<%
    Customer7 customer = (Customer7) session.getAttribute("customer");
    if (customer == null) { response.sendRedirect("../member/login7.jsp"); return; }

    String keyword = request.getParameter("keyword");
    String error = null;
    if (keyword != null) {
        keyword = keyword.trim();
        if (keyword.isEmpty()) {
            error = "Vui lòng nhập từ khóa cần tìm.";
        } else {
            session.setAttribute("keyword", keyword);
            session.setAttribute("listService", new ServiceDAO7().searchService7(keyword));
            session.setAttribute("listPart", new SparePartDAO7().searchSparePart7(keyword));
        }
    }
    // khi quay lại từ trang chi tiết thì hiển thị lại kết quả đã lưu trong session
    String shownKey = (String) session.getAttribute("keyword");
    Service7[] listService = (Service7[]) session.getAttribute("listService");
    SparePart7[] listPart = (SparePart7[]) session.getAttribute("listPart");
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Tìm kiếm dịch vụ/phụ tùng</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan</b><span>Xin chào: <%= esc(customer.getFullName()) %> | <a href="../member/logout7.jsp">Đăng xuất</a></span></div>
<div class="box">
    <h2>Tìm kiếm dịch vụ / phụ tùng</h2>
    <form action="search7.jsp" method="get">
        Từ khóa: <input type="text" name="keyword" value="<%= esc(shownKey) %>">
        <button class="btn" type="submit">Tìm</button>
    </form>
    <% if (error != null) { %><p class="msg"><%= error %></p><% } %>

    <% if (listService != null && listPart != null) { %>
        <% if (listService.length == 0 && listPart.length == 0) { %>
            <p class="msg">Không tìm thấy dịch vụ/phụ tùng phù hợp với từ khóa "<%= esc(shownKey) %>".</p>
        <% } %>
        <h3>Dịch vụ</h3>
        <% if (listService.length == 0) { %><p>Không có kết quả.</p><% } else { %>
        <table>
            <tr><th>TT</th><th>Mã</th><th>Tên dịch vụ</th><th>Đơn giá</th><th>Mô tả</th></tr>
            <% for (int i = 0; i < listService.length; i++) { Service7 s = listService[i]; %>
            <tr><td><%= i + 1 %></td><td>DV<%= s.getId() %></td>
                <td><a href="serviceDetail7.jsp?id=<%= s.getId() %>"><%= esc(s.getName()) %></a></td>
                <td><%= money(s.getPrice()) %></td><td><%= esc(s.getDescription()) %></td></tr>
            <% } %>
        </table>
        <% } %>
        <h3>Phụ tùng</h3>
        <% if (listPart.length == 0) { %><p>Không có kết quả.</p><% } else { %>
        <table>
            <tr><th>TT</th><th>Mã</th><th>Tên phụ tùng</th><th>Hãng SX</th><th>Đơn giá</th></tr>
            <% for (int i = 0; i < listPart.length; i++) { SparePart7 p = listPart[i]; %>
            <tr><td><%= i + 1 %></td><td>PT<%= p.getId() %></td>
                <td><a href="partDetail7.jsp?id=<%= p.getId() %>"><%= esc(p.getName()) %></a></td>
                <td><%= esc(p.getManufacturer()) %></td><td><%= money(p.getPrice()) %></td></tr>
            <% } %>
        </table>
        <% } %>
    <% } %>
    <a class="btn gray" href="customerHome7.jsp">Quay lại</a>
</div>
</body>
</html>
