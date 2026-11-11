<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="model.*, dao.ImportBillDAO7" %>
<%@ include file="/WEB-INF/util7.jspf" %>
<%
    Storekeeper7 staff = (Storekeeper7) session.getAttribute("storekeeper");
    if (staff == null) { response.sendRedirect("../member/login7.jsp"); return; }
    ImportBill7 bill = (ImportBill7) session.getAttribute("bill");
    if (bill == null || bill.getImportedParts().isEmpty()) { response.sendRedirect("storekeeperHome7.jsp"); return; }
    boolean ok = new ImportBillDAO7().saveImportBill7(bill);
    if (ok) session.removeAttribute("bill");
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Lưu hóa đơn nhập</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan</b><span>Nhân viên kho: <%= esc(staff.getFullName()) %> | <a href="../member/logout7.jsp">Đăng xuất</a></span></div>
<div class="box">
<% if (!ok) { %>
    <p class="msg">Lưu hóa đơn thất bại. Hóa đơn vẫn được giữ nguyên, vui lòng thử lại.</p>
    <a class="btn gray" href="importBill7.jsp">Quay lại</a>
<% } else { %>
    <p class="ok noprint">Lưu hóa đơn nhập thành công.</p>
    <% String invoiceNo = String.format("%06d", bill.getId()); %>
    <%@ include file="/WEB-INF/invoice7.jspf" %>
    <div class="noprint" style="text-align:center;margin-top:16px">
        <button class="btn" onclick="window.print()">In hóa đơn</button>
        <a class="btn gray" href="storekeeperHome7.jsp">OK</a>
    </div>
<% } %>
</div>
</body>
</html>
