<%-- 
    Document   : adminusuario
    Created on : 23-feb-2024, 13:30:28
    Author     : CAROL
--%>

<%@page import="com.mycompany.dominio.Pack"%>
<%@page import="com.mycompany.dominio.Alojamiento"%>
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
            List<Alojamiento> aalojamiento = (List<Alojamiento>) sesion.getAttribute("aalojamiento");
            List<Pack> pack = (List<Pack>) sesion.getAttribute("apack");
        %>
        <%@ include file='Componentes/navbar3.jsp' %>

        <br><br>


        <% String idaloStr = request.getParameter("id");
            int idalo = Integer.parseInt(idaloStr);

            Alojamiento alomo = null;
            for (Alojamiento alo : aalojamiento) {
                if (alo.getIdAlojamiento() == idalo) {
                    alomo = alo;
                    break;
                }
            }

            if (alomo != null) {
        %>
        <div class="row mx-auto col-md-11">
            <div class="mb-4">
                <div class="card transparent-card">
                    <div class="card-body center-content">
                        <h1>Modificar el alojamiento con ID <%= idalo%></h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="row col-12 mx-auto">
            <div class="col-sm-3 col-md-6 p-4 mx-auto">
                <div class="card" style="width: 600px; height: 650px">
                    <div class="card-body">
                        <div class="mt-4">
                            <h5><strong>Información Alojamiento</strong></h5>
                            <form action="/Surf/AAlojamiento" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="<%= alomo.getIdAlojamiento()%>">
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="nombre" class="form-label">Nombre:</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre"
                                               value="<%= alomo.getNombre()%>">
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="email" class="form-label">Descripcion:</label>
                                        <input type="text" class="form-control" id="descripcion" name="descripcion"
                                               value="<%= alomo.getDescripcion()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="nombre" class="form-label">Direccion:</label>
                                        <input type="text" class="form-control" id="direccion" name="direccion"
                                               value="<%= alomo.getDireccion()%>">
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="telef" class="form-label">Maps:</label>
                                        <input type="text" class="form-control" id="maps" name="maps"
                                               value="<%= alomo.getMaps()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="apellido" class="form-label">Capacidad:</label>
                                        <input type="text" class="form-control" id="capacidad" name="capacidad"
                                               value="<%= alomo.getCapacidad()%>">
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="clave" class="form-label">Costo:</label>
                                        <input type="text" class="form-control" id="costo" name="costo"
                                               value="<%= alomo.getCosto()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="apellido" class="form-label">Lugar:</label>
                                        <input type="text" class="form-control" id="lugar" name="lugar"
                                               value="<%= alomo.getLugar()%>">
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="clave" class="form-label">CantComprada:</label>
                                        <input type="text" class="form-control" id="CantComprada:" name="CantComprada:"
                                               value="<%= alomo.getCantComprada()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="apellido" class="form-label">Foto1:</label>
                                        <input type="hidden" name="ft12" value="<%= alomo.getFoto1()%>">
                                        <input type="file" class="form-control" id="ft1" name="ft1">
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="apellido" class="form-label">Foto2:</label>
                                        <input type="hidden" name="ft22" value="<%= alomo.getFoto2()%>">
                                        <input type="file" class="form-control" id="ft2" name="ft2">
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="apellido" class="form-label">Foto3:</label>
                                        <input type="hidden" name="ft32" value="<%= alomo.getFoto3()%>">
                                        <input type="file" class="form-control" id="ft3" name="ft3">
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="apellido" class="form-label">Foto4:</label>
                                        <input type="hidden" name="ft42" value="<%= alomo.getFoto4()%>">
                                        <input type="file" class="form-control" id="ft4" name="ft4">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="packId" class="form-label">Pack ID:</label>
                                        <select class="form-select" id="packId" name="packId">
                                            <% if (pack != null) { %>
                                            <% for (Pack p : pack) {%>
                                            <option value="<%= p.getIdPack()%>" selected>
                                                <%= p.getIdPack()%> - <%= p.getTitulo()%>
                                            </option>
                                            <% } %>
                                            <% } else { %>
                                            <option value="">No hay packs disponibles</option>
                                            <% }%>
                                        </select>
                                    </div>
                                    <div class="mb-3 col">
                                        <br>
                                        <button type="submit" class="btn btn-primary btn-modificar" name="modificar">Modificar</button>
                                    </div>
                                </div>
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