<%-- 
    Document   : adminusuario
    Created on : 23-feb-2024, 13:30:28
    Author     : CAROL
--%>

<%@page import="com.mycompany.dominio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/css_footer.css">
        <style>
            body {
                background-image: url('img/fondoadmin.png');
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }

            .icon-container {
                display: flex;
                justify-content: space-around;
                align-items: center;
                height: 100px;
                /* Altura de la barra que contiene los iconos */
            }

            .icon {
                font-size: 24px;
                color: #333;
            }

            table {
                border-collapse: collapse;
                width: 80%; /* Ancho de la tabla */
                margin: 20px; /* Espaciado exterior de la tabla */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Sombra ligera */
            }

            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: rgba(255, 255, 255, 0.5);
            }

            td {
                background-color: rgba(84, 139, 234, 0.5);
                color: white;
            }

            p {
                text-align: center;
                font-size: 18px;
                margin-top: 20px;
            }

            .buttons-container {
                display: flex;
                gap: 10px;
                justify-content: center;
            }

            .btn-modificar,
            .btn-eliminar {
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                font-size: 14px;
            }

            .btn-eliminar {
                background-color: #dc3545;
            }

            .transparent-card {
                width: 300px;
                height: 100px;
                background-color: rgba(255, 255, 255, 0.5);
                border: 2px solid #ffffff;
                border-radius: 10px;
            }
            .center-content {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100%;
            }

            .card {
                margin: 0 auto;
                width: 50%; /* Ajusta el ancho según tus necesidades */
            }

            .card-title {
                margin-bottom: 0;
            }

        </style>
        <script>
            $(document).ready(function () {
                // Cada 3 segundos, avanza al siguiente elemento del carrusel
                setInterval(function () {
                    $('.carousel').carousel('next');
                }, 3000);
            });
        </script>
    </head>
    <body>


        <%
            HttpSession sesion = request.getSession();
            List<Usuario> ausuario = (List<Usuario>) sesion.getAttribute("ausuario");
            String nom = "root";
            String clave = "1234";

            if (sesion.getAttribute("nom_usuario") == null && sesion.getAttribute("clave") == null) {%>
        <%@ include file='Componentes/navbar.jsp' %>
        <% } else if (nom.equals(sesion.getAttribute("nom_usuario")) && clave.equals(sesion.getAttribute("clave"))) {%>
        <%@ include file='Componentes/navbar3.jsp' %>
        <% } else {%>
        <%@ include file='Componentes/navbar2.jsp' %>
        <% }%>

        <br><br>

        <div class="row mx-auto col-md-11 justify-content-center mb-4">
            <!-- Primer elemento -->
            <div class="col-md-5 col-sm-8">
                <a href="ausuarioin.jsp" style="text-decoration: none;">
                    <div class="card transparent-card text-center">
                        <div class="card-body center-content">
                            <h5 class="card-title text-white">INSERTAR</h5>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Segundo elemento -->
            <div class="col-md-5 col-sm-8">
                <form action="/Surf/AUsuarioX" method="post">
                    <div class="card transparent-card text-center">
                        <div class="card-body center-content">
                            <button type="submit"  name="usuariox" style="background-color: rgb(0,0,0,0); border: 0;">
                                <h5 class="card-title text-white">USUARIO X</h5>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <br>
        <div class="row mx-auto col-md-11">
            <% if (ausuario != null && !ausuario.isEmpty()) { %>
            <table class="mx-auto">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom_Usuario</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Email</th>
                        <th>Telefono</th>
                        <th>Clave</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Usuario usuario : ausuario) {%>
                    <tr>
                        <td><%= usuario.getIdUsuario()%></td>
                        <td><%= usuario.getNomUsuario()%></td>
                        <td><%= usuario.getNombre()%></td>
                        <td><%= usuario.getApellido()%></td>
                        <td><%= usuario.getEmail()%></td>
                        <td><%= usuario.getTelefono()%></td>
                        <td><%= usuario.getClave()%></td>
                        <td>
                            <div class="buttons-container">
                                <a href="ausuariomo.jsp?id=<%= usuario.getIdUsuario()%>" class="btn-modificar" style="text-decoration: none; color: white;">Modificar</a>
                                <form action="/Surf/AUsuario" method="post">
                                    <input type="hidden" name="id" value="<%= usuario.getIdUsuario()%>">
                                    <button type="submit" class="btn btn-eliminar" name="eliminar">Eliminar</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <% } else { %>
            <p>No hay usuarios disponibles.</p>
            <% }%>
        </div>


    </body>
</html>
