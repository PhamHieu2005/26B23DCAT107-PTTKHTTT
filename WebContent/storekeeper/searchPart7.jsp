<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="model.*, dao.SparePartDAO7" %>
<%@ include file="/WEB-INF/util7.jspf" %>
<%
    Storekeeper7 staff = (Storekeeper7) session.getAttribute("storekeeper");
    if (staff == null) { response.sendRedirect("../member/login7.jsp"); return; }
    ImportBill7 bill = (ImportBill7) session.getAttribute("bill");
    if (bill == null) { response.sendRedirect("searchSupplier7.jsp"); return; }
    request.setCharacterEncoding("UTF-8");

    String error = null;
    // click "Thêm vào hóa đơn": tạo dòng ImportedPart7 rồi quay lại importPart7.jsp
    if ("add".equals(request.getParameter("action"))) {
        SparePart7[] list = (SparePart7[]) session.getAttribute("listPart");
        SparePart7 chosen = null;
        if (list != null) {
            for (SparePart7 p : list) {
                if (String.valueOf(p.getId()).equals(request.getParameter("partId"))) chosen = p;
            }
        }
        int quantity = 0;
        float price = 0;
        try {
            quantity = Integer.parseInt(request.getParameter("quantity"));
            price = Float.parseFloat(request.getParameter("price"));
        } catch (Exception e) {
            // để quantity/price = 0 và báo lỗi bên dưới
        }
        if (chosen == null) {
            error = "Vui lòng chọn một phụ tùng.";
        } else if (quantity <= 0 || price <= 0) {
            error = "Số lượng và đơn giá nhập phải lớn hơn 0.";
        } else {
            ImportedPart7 line = null;
            for (ImportedPart7 ip : bill.getImportedParts()) {
                if (ip.getSparePart().getId() == chosen.getId()) line = ip;
            }
            if (line == null) {
                line = new ImportedPart7();
                line.setSparePart(chosen);
                bill.getImportedParts().add(line);
            }
            // phụ tùng đã có trong hóa đơn thì cộng dồn số lượng, cập nhật đơn giá
            line.setQuantity(line.getQuantity() + quantity);
            line.setPrice(price);
            response.sendRedirect("importPart7.jsp");
            return;
        }
    }

    String name = request.getParameter("name");
    if (name != null) {
        name = name.trim();
        session.setAttribute("partKeyword", name);
        session.setAttribute("listPart", new SparePartDAO7().searchSparePart7(name));
    }
    SparePart7[] listPart = name == null && error == null ? null : (SparePart7[]) session.getAttribute("listPart");
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Tìm phụ tùng</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan</b><span>Nhân viên kho: <%= esc(staff.getFullName()) %> | <a href="../member/logout7.jsp">Đăng xuất</a></span></div>
<div class="box">
    <h2>Tìm phụ tùng</h2>
    <form action="searchPart7.jsp" method="get">
        Tên phụ tùng: <input type="text" name="name" value="<%= esc((String) session.getAttribute("partKeyword")) %>">
        <button class="btn" type="submit">Tìm</button>
        <a class="btn" href="addPart7.jsp">Thêm mới</a>
    </form>
    <% if (error != null) { %><p class="msg"><%= error %></p><% } %>
    <% if (listPart != null) { %>
        <% if (listPart.length == 0) { %>
            <p class="msg">Không tìm thấy phụ tùng. Bấm "Thêm mới" để thêm phụ tùng.</p>
        <% } else { %>
        <form action="searchPart7.jsp" method="post">
            <input type="hidden" name="action" value="add">
            <table>
                <tr><th>Chọn</th><th>Mã</th><th>Tên phụ tùng</th><th>Hãng SX</th><th>Đơn giá bán</th></tr>
                <% for (SparePart7 p : listPart) { %>
                <tr><td><input type="radio" name="partId" value="<%= p.getId() %>"></td><td>PT<%= p.getId() %></td>
                    <td><%= esc(p.getName()) %></td><td><%= esc(p.getManufacturer()) %></td><td><%= money(p.getPrice()) %></td></tr>
                <% } %>
            </table>
            Số lượng: <input type="number" name="quantity" min="1" style="width:90px">
            Đơn giá nhập: <input type="number" name="price" min="1" style="width:130px">
            <button class="btn" type="submit">Thêm vào hóa đơn</button>
        </form>
        <% } %>
    <% } %>
    <p><a class="btn gray" href="importPart7.jsp">Quay lại</a></p>
</div>
</body>
</html>
