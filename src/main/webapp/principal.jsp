<%-- 
    Document   : principal
    Created on : 20 nov. 2022, 00:51:24
    Author     : kjlme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alquiler de Autos</title>
    </head>
    <body>
        <%
            out.print(" días" + request.getParameter("id"));
        %>
    </body>
</html>
