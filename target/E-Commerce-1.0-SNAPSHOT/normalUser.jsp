<%@page import="com.ecommerce.entities.User"%>
<%

    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {

        if (user.getUserType().equals("admin")) {
          session.setAttribute("message", "You are admin! Do not access Normal user page");
          response.sendRedirect("login.jsp");
          return;
        }

    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal user Page</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <h1>Normal user page</h1>
    </body>
</html>
