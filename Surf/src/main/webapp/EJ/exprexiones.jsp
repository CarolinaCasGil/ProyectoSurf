<%-- 
    Document   : exprexiones
    Created on : 08-ene-2024, 10:50:43
    Author     : CAROL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p>Concatenacion: <%="Saludos" + " " + "JSP"%></p>
        <p>Concatenacion: <%= 2 * 3 / 2%></p>
        <p>Concatenacion: <%= session.getId()%></p>
    </body>
</html>
