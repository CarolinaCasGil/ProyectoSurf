<%-- 
    Document   : adminusuario
    Created on : 23-feb-2024, 13:30:28
    Author     : CAROL
--%>

<%@page import="java.text.SimpleDateFormat"%>
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

            .nav-link.nav-link-white-text {
                background-color: rgba(255, 255, 255, 0.4) !important;
                color: white !important;
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
            List<UsuarioProducto> upro = (List<UsuarioProducto>) sesion.getAttribute("aupro");
            List<UsuarioPack> upac = (List<UsuarioPack>) sesion.getAttribute("aupac");
            List<UsuarioAlojamiento> ualoj = (List<UsuarioAlojamiento>) sesion.getAttribute("aualoj");
            List<Alojamiento> ialoja = (List<Alojamiento>) sesion.getAttribute("aalojamiento");
            List<Pack> ipack = (List<Pack>) sesion.getAttribute("apacks");
            List<Producto> producto = (List<Producto>) sesion.getAttribute("aproducto");
            String nom = "root";
            String clave = "1234";
        %>
        <%@ include file='Componentes/navbar3.jsp' %>

        <br><br>


        <br>


        <div class="container">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active nav-link-white-text" id="tab1-tab" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">PRODUCTOS</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-white-text" id="tab2-tab" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">PACK</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-white-text" id="tab3-tab" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false">ALOJAMIENTOS</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab1-tab">
                    <!-- Contenido de la Tabla 1 -->
                    <br>

                    <div class="row mx-auto col-md-11 justify-content-center mb-4">
                        <div class="col-md-5 col-sm-8">
                            <a href="ausuarioinX.jsp?name=1" style="text-decoration: none;">
                                <div class="card transparent-card text-center">
                                    <div class="card-body center-content">
                                        <h5 class="card-title text-white">INSERTAR</h5>
                                    </div>
                                </div>
                            </a>
                        </div>

                    </div>



                    <div class="row mx-auto col-md-11">
                        <% if (upro != null && !upro.isEmpty()) { %>
                        <table class="mx-auto">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>IdUsuario</th>
                                    <th style="width: 150px;">Fecha</th>
                                    <th>IdProducto</th>
                                    <th>Cantidad</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
                                <% for (UsuarioProducto uproducto : upro) {%>
                                <tr>
                                    <td><%= uproducto.getIdUsuarioProducto()%></td>
                                    <td><%= uproducto.getIdUsuario()%></td>
                                    <td style="width: 150px;"><%= sdf.format(uproducto.getFechaPedido())%></td>
                                    <td><%= uproducto.getIdProducto()%></td>
                                    <td><%= uproducto.getCantidad()%></td>
                                    <td>
                                        <div class="buttons-container">
                                            <a href="ausuariomoX.jsp?id=<%= uproducto.getIdUsuarioProducto()%>&name=1" class="btn-modificar" style="text-decoration: none; color: white;">Modificar</a>
                                            <form action="/Surf/AUsuarioX" method="post">
                                                <input type="hidden" name="id" value="<%= uproducto.getIdUsuarioProducto()%>">
                                                <button type="submit" class="btn btn-eliminar" name="eliminarpro">Eliminar</button>
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
                </div>
                <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab2-tab">
                    <!-- Contenido de la Tabla 2 -->

                    <br>

                    <div class="row mx-auto col-md-11 justify-content-center mb-4">
                        <div class="col-md-5 col-sm-8">
                            <a href="ausuarioinX.jsp?name=2" style="text-decoration: none;">
                                <div class="card transparent-card text-center">
                                    <div class="card-body center-content">
                                        <h5 class="card-title text-white">INSERTAR</h5>
                                    </div>
                                </div>
                            </a>
                        </div>

                    </div>

                    <div class="row mx-auto col-md-11">
                        <% if (upac != null && !upac.isEmpty()) { %>
                        <table class="mx-auto">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>IdUsuario</th>
                                    <th style="width: 150px;">Fecha</th>
                                    <th>IdPack</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
                                <% for (UsuarioPack usupack : upac) {%>
                                <tr>
                                    <td><%= usupack.getIdUsuarioPack()%></td>
                                    <td><%= usupack.getIdUsuario()%></td>
                                    <td style="width: 150px;"><%= sdf.format(usupack.getFechaInicio())%></td>
                                    <td><%= usupack.getIdPack()%></td>
                                    <td>
                                        <div class="buttons-container">
                                            <a href="ausuariomoX.jsp?id=<%= usupack.getIdUsuarioPack()%>&name=2" class="btn-modificar" style="text-decoration: none; color: white;">Modificar</a>
                                            <form action="/Surf/AUsuarioX" method="post">
                                                <input type="hidden" name="id" value="<%= usupack.getIdUsuarioPack()%>">
                                                <button type="submit" class="btn btn-eliminar" name="eliminarpack">Eliminar</button>
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
                </div>
                <div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab3-tab">
                    <!-- Contenido de la Tabla 3 -->

                    <br>

                    <div class="row mx-auto col-md-11 justify-content-center mb-4">
                        <div class="col-md-5 col-sm-8">
                            <a href="ausuarioinX.jsp?name=3" style="text-decoration: none;">
                                <div class="card transparent-card text-center">
                                    <div class="card-body center-content">
                                        <h5 class="card-title text-white">INSERTAR</h5>
                                    </div>
                                </div>
                            </a>
                        </div>

                    </div>

                    <div class="row mx-auto col-md-11">
                        <% if (ualoj != null && !ualoj.isEmpty()) { %>
                        <table class="mx-auto">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>IdUsuario</th>
                                    <th style="width: 150px;">Fecha Entrada</th>
                                    <th style="width: 150px;">Fecha Salida</th>
                                    <th>IdAlojamiento</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
                                <% for (UsuarioAlojamiento usualo : ualoj) {%>
                                <tr>
                                    <td><%= usualo.getIdUsuarioAlojamiento()%></td>
                                    <td><%= usualo.getIdUsuario()%></td>
                                    <td style="width: 150px;"><%= sdf.format(usualo.getFechaEntrada())%></td>
                                    <td style="width: 150px;"><%= sdf.format(usualo.getFechaSalida())%></td>
                                    <td><%= usualo.getIdAlojamiento()%></td>
                                    <td>
                                        <div class="buttons-container">
                                            <a href="ausuariomoX.jsp?id=<%= usualo.getIdUsuarioAlojamiento()%>&name=3" class="btn-modificar" style="text-decoration: none; color: white;">Modificar</a>
                                            <form action="/Surf/AUsuarioX" method="post">
                                                <input type="hidden" name="id" value="<%= usualo.getIdUsuarioAlojamiento()%>">
                                                <button type="submit" class="btn btn-eliminar" name="eliminaralo">Eliminar</button>
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
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
