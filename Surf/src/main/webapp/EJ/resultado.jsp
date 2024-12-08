<%-- 
    Document   : resultado
    Created on : 08-ene-2024, 10:42:20
    Author     : CAROL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p> usuario: <%=request. getParameter("usuario")%></p>
        <p> contraseña <%=request. getParameter("password")%></p>
        <a href="../index.html">INICIO</a>
    </body>
</html>
