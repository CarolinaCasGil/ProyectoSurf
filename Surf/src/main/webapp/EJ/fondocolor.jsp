<%-- 
    Document   : fondocolor
    Created on : 08-ene-2024, 11:09:55
    Author     : CAROL
--%>
<%
    String fondo =request.getParameter("colorFondo");
    if (fondo==null || fondo.trim().equals("")){
        fondo="white";
    }
   
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="<%=fondo%>">
        <h1>JSP cambio de calor</h1>
        <br/>
        Color de fondo aplicado: <%=fondo%>
        <br/>
        <a href="../index.html">Inicio</a>
    </body>
</html>


