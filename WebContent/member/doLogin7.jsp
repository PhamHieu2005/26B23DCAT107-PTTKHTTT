<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="model.*, dao.MemberDAO7" %>
<%
    request.setCharacterEncoding("UTF-8");
    Member7 m = new Member7();
    m.setUsername(request.getParameter("username"));
    m.setPassword(request.getParameter("password"));
    if (!new MemberDAO7().checkLogin7(m)) {
        response.sendRedirect("login7.jsp?err=1");
        return;
    }
    session.setAttribute("member", m);
    String role = m.getRole();
    if ("customer".equals(role)) {
        Customer7 c = new Customer7();
        c.setId(m.getId());
        c.setFullName(m.getFullName());
        c.setRole(role);
        session.setAttribute("customer", c);
        response.sendRedirect("../customer/customerHome7.jsp");
    } else if ("storekeeper".equals(role)) {
        Storekeeper7 s = new Storekeeper7();
        s.setId(m.getId());
        s.setFullName(m.getFullName());
        s.setRole(role);
        session.setAttribute("storekeeper", s);
        response.sendRedirect("../storekeeper/storekeeperHome7.jsp");
    } else if ("manager".equals(role)) {
        response.sendRedirect("../manager/managerHome7.jsp");
    } else {
        response.sendRedirect("../salestaff/saleStaffHome7.jsp");
    }
%>
