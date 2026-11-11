<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="model.*, java.util.Date, java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/util7.jspf" %>
<%
    Storekeeper7 staff = (Storekeeper7) session.getAttribute("storekeeper");
    if (staff == null) { response.sendRedirect("../member/login7.jsp"); return; }

    // chọn NCC (từ searchSupplier7.jsp hoặc doAddSupplier7.jsp) => tạo hóa đơn nhập mới
    String supplierId = request.getParameter("supplierId");
    if (supplierId != null) {
        Supplier7[] list = (Supplier7[]) session.getAttribute("listSupplier");
        if (list != null) {
            for (Supplier7 s : list) {
                if (String.valueOf(s.getId()).equals(supplierId)) {
                    ImportBill7 newBill = new ImportBill7();
                    newBill.setImportDate(new Date());
                    newBill.setSupplier(s);
                    newBill.setStorekeeper(staff);
                    session.setAttribute("bill", newBill);
                }
            }
        }
    }
    ImportBill7 bill = (ImportBill7) session.getAttribute("bill");
    if (bill == null) { response.sendRedirect("searchSupplier7.jsp"); return; }

    String remove = request.getParameter("remove");
    if (remove != null && remove.matches("\\d+")) {
        int idx = Integer.parseInt(remove);
        if (idx < bill.getImportedParts().size()) bill.getImportedParts().remove(idx);
    }
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Nhập phụ tùng</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan</b><span>Nhân viên kho: <%= esc(staff.getFullName()) %> | <a href="../member/logout7.jsp">Đăng xuất</a></span></div>
<div class="box">
    <h2>Nhập phụ tùng</h2>
    <p>Nhân viên kho: <b><%= esc(staff.getFullName()) %></b> &nbsp; Ngày nhập: <b><%= new SimpleDateFormat("dd/MM/yyyy").format(bill.getImportDate()) %></b><br>
       Nhà cung cấp: <b>NCC<%= bill.getSupplier().getId() %> - <%= esc(bill.getSupplier().getName()) %></b></p>
    <table>
        <tr><th>TT</th><th>Mã PT</th><th>Tên phụ tùng</th><th>SL</th><th>Đơn giá nhập</th><th>Thành tiền</th><th>Xóa</th></tr>
        <% for (int i = 0; i < bill.getImportedParts().size(); i++) { ImportedPart7 p = bill.getImportedParts().get(i); %>
        <tr><td><%= i + 1 %></td><td>PT<%= p.getSparePart().getId() %></td><td><%= esc(p.getSparePart().getName()) %></td>
            <td><%= p.getQuantity() %></td><td><%= money(p.getPrice()) %></td><td><%= money(p.getQuantity() * p.getPrice()) %></td>
            <td><a href="importPart7.jsp?remove=<%= i %>">Xóa</a></td></tr>
        <% } %>
        <% if (bill.getImportedParts().isEmpty()) { %><tr><td colspan="7">Chưa có phụ tùng nào.</td></tr><% } %>
    </table>
    <p><b>Tổng tiền: <%= money(bill.getTotalAmount()) %></b></p>
    <a class="btn" href="searchPart7.jsp">Thêm phụ tùng</a>
    <% if (bill.getImportedParts().isEmpty()) { %>
        <button class="btn" disabled>Xác nhận</button>
    <% } else { %>
        <a class="btn" href="importBill7.jsp">Xác nhận</a>
    <% } %>
    <a class="btn gray" href="searchSupplier7.jsp">Quay lại</a>
</div>
</body>
</html>
