<%-- 
    Document   : scrilples
    Created on : 08-ene-2024, 11:52:56
    Author     : CAROL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP con Scriptlets</title>
    </head>
    <body>
        <h1>JSP con Scriptlets</h1>
        <br>
        <% 
            out.print("saludos desde el Scriptlet");
        %>
        <br>
        <% 
            String nombreAplicaion = request.getContextPath();
            out.print("Nombre de la aplicación: " + nombreAplicaion);
        %>
        <br>
        <% 
            if(session != null && session.isNew()){
        %>
        La sesion si es nueva
        <%
            }else if (session != null){
        %>
        La sesion no es nueva
        <% } %>
        <br>
        <a href="index.html">Inicio</a>
    </body>
</html>

