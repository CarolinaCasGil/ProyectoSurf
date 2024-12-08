<%-- 
    Document   : adminusuario
    Created on : 23-feb-2024, 13:30:28
    Author     : CAROL
--%>

<%@page import="com.mycompany.dominio.Actividad"%>
<%@page import="com.mycompany.dominio.Pack"%>
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
                width: 50%;
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

        <!-- ########################################## MENU ######################################################## -->
        <%
            HttpSession sesion = request.getSession();
            List<Pack> pack = (List<Pack>) sesion.getAttribute("apack");
            List<Actividad> actividad = (List<Actividad>) sesion.getAttribute("actividad");
            String nom = "root";
            String clave = "1234";


        %>
        <%@ include file='Componentes/navbar3.jsp' %>

        <br><br>


        <%            String idpackStr = request.getParameter("id");
            int idpack = Integer.parseInt(idpackStr);

            Pack packModificar = null;
            for (Pack p : pack) {
                if (p.getIdPack() == idpack) {
                    packModificar = p;
                    break;
                }
            }

            if (packModificar != null) {
        %>
        <div class="row mx-auto col-md-11">
            <div class="mb-4">
                <div class="card transparent-card">
                    <div class="card-body center-content">
                        <h1>Modificar el pack con ID <%= idpack%></h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="row col-12 mx-auto">
            <div class="col-sm-3 col-md-6 p-4 mx-auto">
                <div class="card" style="width: 600px; height: 500px">
                    <div class="card-body"> 
                        <div class="mt-4">
                            <h5><strong>Información Pack</strong></h5>
                            <form action="/Surf/APack2" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="<%= packModificar.getIdPack()%>">
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="nombre" class="form-label">Cantidad Actividad:</label>
                                        <input type="text" class="form-control" id="cant_act" name="cant_act"
                                               value="<%= packModificar.getCantActv()%>">
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="email" class="form-label">Costo:</label>
                                        <input type="text" class="form-control" id="costo" name="costo"
                                               value="<%= packModificar.getCosto()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="nombre" class="form-label">Titulo:</label>
                                        <input type="text" class="form-control" id="titulo" name="titulo"
                                               value="<%= packModificar.getTitulo()%>">
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="email" class="form-label">Foto</label>
                                        <input type="hidden" name="foto2" value="<%= packModificar.getFoto()%>">
                                        <input type="file" class="form-control" id="foto" name="foto"
                                               value="<%= packModificar.getFoto()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="nombre" class="form-label">Descripcion:</label>
                                        <input type="text" class="form-control" id="descripcion" name="descripcion"
                                               value="<%= packModificar.getDescripcion()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="apellido" class="form-label">Cant Comprada:</label>
                                        <input type="text" class="form-control" id="cant_comp" name="cant_comp"
                                               value="<%= packModificar.getCantComprada()%>">
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="idActividad" class="form-label">ID Actividad:</label>
                                        <select class="form-select" id="idActividad" name="idActividad">
                                            <% for (Actividad act : actividad) {%>
                                            <option value="<%= act.getIdActividad()%>"
                                                    <% if (act.getIdActividad() == packModificar.getIdActividad().getIdActividad()) { %>selected<% }%>
                                                    >
                                                <%= act.getIdActividad()%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-modificar" id="modificar" name="modificar">Guardar Cambios</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>

    </body>
</html>