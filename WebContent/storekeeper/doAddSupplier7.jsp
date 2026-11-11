<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="model.*, dao.SupplierDAO7" %>
<%
    Storekeeper7 staff = (Storekeeper7) session.getAttribute("storekeeper");
    if (staff == null) { response.sendRedirect("../member/login7.jsp"); return; }
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    if (name == null || name.trim().isEmpty()) { response.sendRedirect("addSupplier7.jsp?err=1"); return; }

    Supplier7 supplier = new Supplier7();
    supplier.setName(name.trim());
    supplier.setAddress(request.getParameter("address"));
    supplier.setTel(request.getParameter("tel"));
    supplier.setEmail(request.getParameter("email"));
    supplier.setDescription(request.getParameter("description"));
    if (new SupplierDAO7().addSupplier7(supplier)) {
        // lưu xong: chọn luôn NCC vừa thêm để sang giao diện nhập phụ tùng
        session.setAttribute("listSupplier", new Supplier7[] { supplier });
        response.sendRedirect("importPart7.jsp?supplierId=" + supplier.getId());
    } else {
        response.sendRedirect("addSupplier7.jsp?err=1");
    }
%>
