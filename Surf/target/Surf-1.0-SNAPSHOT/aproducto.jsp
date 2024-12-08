<%-- 
    Document   : adminusuario
    Created on : 23-feb-2024, 13:30:28
    Author     : CAROL
--%>

<%@page import="com.mycompany.dominio.*"%>
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
                width: 100%;
                border-collapse: collapse;
                margin: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            th, td {
                max-width: 150px;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
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
            List<Producto> aprooducto = (List<Producto>) sesion.getAttribute("aproducto");
        %>
        <%@ include file='Componentes/navbar3.jsp' %>

        <br><br>

        <div class="row mx-auto col-md-11">
            <div class=" mb-4">
                <a href="aproductoin.jsp" style="text-decoration: none;">
                    <div class="card transparent-card">
                        <div class="card-body center-content">
                            <h5 class="card-title text-white">INSERTAR</h5>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <br>
        <div class="row mx-auto col-md-11">
            <% if (aprooducto != null && !aprooducto.isEmpty()) { %>
            <table class="mx-auto">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Cantidad</th>
                        <th>Costo</th>
                        <th>CantComprada</th>
                        <th>Foto</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Producto pro : aprooducto) {%>
                    <tr>
                        <td><%= pro.getId_producto()%></td>
                        <td><%= pro.getNombre()%></td>
                        <td><%= pro.getCantidad()%></td>
                        <td><%= pro.getCosto()%></td>
                        <td><%= pro.getCantComprada()%></td>
                        <td><img src="<%= pro.getFoto()%>" alt="alt" style="width: 50%"/></td>
                        <td>
                            <div class="buttons-container">
                                <a href="aproductomo.jsp?id=<%= pro.getId_producto()%>" class="btn-modificar" style="text-decoration: none; color: white;">Modificar</a>
                                <form action="/Surf/AProductos" method="post">
                                    <input type="hidden" name="id" value="<%= pro.getIdProducto()%>">
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
