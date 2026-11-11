<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="model.*, dao.SparePartDAO7, java.net.URLEncoder" %>
<%
    Storekeeper7 staff = (Storekeeper7) session.getAttribute("storekeeper");
    if (staff == null) { response.sendRedirect("../member/login7.jsp"); return; }
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    float price = 0;
    try {
        price = Float.parseFloat(request.getParameter("price"));
    } catch (Exception e) {
        // để price = 0 và báo lỗi
    }
    if (name == null || name.trim().isEmpty() || price <= 0) { response.sendRedirect("addPart7.jsp?err=1"); return; }

    SparePart7 part = new SparePart7();
    part.setName(name.trim());
    part.setManufacturer(request.getParameter("manufacturer"));
    part.setPrice(price);
    part.setDescription(request.getParameter("description"));
    if (new SparePartDAO7().addSparePart7(part)) {
        // lưu xong: quay lại giao diện tìm phụ tùng, hiển thị phụ tùng vừa thêm
        response.sendRedirect("searchPart7.jsp?name=" + URLEncoder.encode(part.getName(), "UTF-8"));
    } else {
        response.sendRedirect("addPart7.jsp?err=1");
    }
%>
