<%-- 
    Document   : iniciosesion
    Created on : 28-nov-2023, 10:40:52
    Author     : CAROL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--        <script>
                    function validarFormulario() {
                        var usuario = document.getElementById("usuario").value;
                        var password = document.getElementById("password").value;
                        var tecnologias = document.querySelector("input[name='tecnologias']:checked");
                        var genero = document.querySelector("input[name='genero']:checked");
                        var ocupacion = document.getElementById("ocupacion").value;
        
                        if (usuario === "" || password === "" || !tecnologias || !genero || ocupacion === "") {
                            alert("Por favor, complete todos los campos obligatorios.");
                            return false;
                        }
        
                        return true;
                    }
                </script>-->
    </head>
    <body>
        <h1>FORMULARIO SERVLET</h1>

        <!--action="/Surf/iniciosesion" method="POST"-->

        <form action="EJ/resultado.jsp" method="POST">
            Usuario:
            <input type="text" name="usuario" required>
            <br>
            Contraseña:
            <input type="password" name="password" required>

            <br>

            <input type="submit" value="Iniciar Sesión">
        </form>
        <a href="EJ/exprexiones.jsp">Expresiones</a>


        <br><br>
        <!--        <h1>FORMULARIO REGISTRO</h1>-->

        <!--        <form action="/Surf/mostrar" method="POST">
                    <label for="usuario">Usuario (obligatorio):</label>
                    <input type="text" id="usuario" name="usuario" required>
        
                    <br><br>
        
                    <label for="password">Password (obligatorio):</label>
                    <input type="password" id="password" name="password" required>
        
                    <br><br>
        
                    <label>Tecnologías de interés (obligatorio):</label>
        
                    <br><br>
        
                    <input type="checkbox" id="java" name="tecnologias" value="java" >
                    <label for="java">Java</label>
        
                    <input type="checkbox" id="dotnet" name="tecnologias" value="dotnet" >
                    <label for="dotnet">.Net</label>
        
                    <input type="checkbox" id="php" name="tecnologias" value="php" >
                    <label for="php">PHP</label>
        
                    <br><br>
        
                    <label>Género (obligatorio):</label>
                    <br><br>
                    <input type="radio" id="hombre" name="genero" value="hombre" required>
                    <label for="hombre">Hombre</label>
        
                    <input type="radio" id="mujer" name="genero" value="mujer" required>
                    <label for="mujer">Mujer</label>
        
                    <br><br>
        
                    <label for="ocupacion">Ocupación (obligatorio):</label>
                    <select id="ocupacion" name="ocupacion" required>
                        <option value="estudiante">Estudiante</option>
                        <option value="profesor">Profesor</option>
                        <option value="desarrollador">Desarrollador</option>
                        <option value="otro">Otro</option>
                    </select>
        
                    <br><br>
        
                    <label for="musica">Música favorita:</label>
                    <select id="musica" name="musica" size="1">
                        <option value="rock">Rock</option>
                        <option value="pop">Pop</option>
                        <option value="electronica">Electrónica</option>
                        <option value="hiphop">Hip Hop</option>
                        <option value="otro">Otro</option>
                    </select>
        
                    <br><br>
        
                    <label for="comentarios">Comentarios mediante un text area:</label><br>
                    <textarea id="comentarios" name="comentarios" rows="4" cols="30"></textarea>
        
                    <br><br>
        
                    <input type="submit" value="Enviar" onclick="return validarFormulario();">
                    <input type="reset" value="Limpiar">
                </form>-->

        <form action="EJ/fondocolor.jsp">
            <!--Debemos proporcionar un nombre de color valido-->
            Proporciona el color de fondo (ej: red, blue, yellow, white, etc...)
            <input type="text" name="colorFondo"/>
            <br/>
            <input type="submit" name="Enviar"/>
            
        </form>


    </body>
</html>
