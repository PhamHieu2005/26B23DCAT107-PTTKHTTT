<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="model.*" %>
<%@ include file="/WEB-INF/util7.jspf" %>
<%
    Storekeeper7 staff = (Storekeeper7) session.getAttribute("storekeeper");
    if (staff == null) { response.sendRedirect("../member/login7.jsp"); return; }
    ImportBill7 bill = (ImportBill7) session.getAttribute("bill");
    if (bill == null || bill.getImportedParts().isEmpty()) { response.sendRedirect("importPart7.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Hóa đơn nhập</title><link rel="stylesheet" href="../style7.css"></head>
<body>
<div class="top"><b>GaraMan</b><span>Nhân viên kho: <%= esc(staff.getFullName()) %> | <a href="../member/logout7.jsp">Đăng xuất</a></span></div>
<div class="box">
    <% String invoiceNo = ""; %>
    <%@ include file="/WEB-INF/invoice7.jspf" %>
    <form action="doSaveImportBill7.jsp" method="post" class="noprint" style="text-align:center;margin-top:16px">
        <button class="btn" type="submit">Lưu &amp; in</button>
        <a class="btn gray" href="importPart7.jsp">Quay lại</a>
    </form>
</div>
</body>
</html>
