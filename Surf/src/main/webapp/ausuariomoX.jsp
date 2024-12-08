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
            List<Usuario> ausuario = (List<Usuario>) sesion.getAttribute("ausuario");
            List<UsuarioProducto> upro = (List<UsuarioProducto>) sesion.getAttribute("aupro");
            List<UsuarioPack> upac = (List<UsuarioPack>) sesion.getAttribute("aupac");
            List<UsuarioAlojamiento> ualoj = (List<UsuarioAlojamiento>) sesion.getAttribute("aualoj");
            List<Alojamiento> ialoja = (List<Alojamiento>) sesion.getAttribute("aalojamiento");
            List<Pack> ipack = (List<Pack>) sesion.getAttribute("apacks");
            List<Producto> producto = (List<Producto>) sesion.getAttribute("aproducto");
            String nom = "root";
            String clave = "1234";

            String nombre = request.getParameter("name");
            int n = Integer.parseInt(nombre);

        %>

        <%@ include file='Componentes/navbar3.jsp' %>

        <br><br>


        <%if (n == 1) {%>
        <!--######################################## UPRODUCTO ################################################3-->
        <% String idUsuarioStr = request.getParameter("id");
            int idUsuario = Integer.parseInt(idUsuarioStr);

            UsuarioProducto usuarioProductoModificar = null;
            for (UsuarioProducto usupro : upro) {
                if (usupro.getIdUsuarioProducto() == idUsuario) {
                    usuarioProductoModificar = usupro;
                    break;
                }
            }

            if (usuarioProductoModificar != null) {
                // Formatear la fecha de pedido en formato yyyy-MM-dd
                String fechaPedidoFormatted = new java.text.SimpleDateFormat("yyyy-MM-dd").format(usuarioProductoModificar.getFechaPedido());
        %>
        <div class="row mx-auto col-md-11">
            <div class="mb-4">
                <div class="card transparent-card">
                    <div class="card-body center-content">
                        <h1>Modificar el UsuarioProducto con ID <%= idUsuario%></h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="row col-12 mx-auto">
            <div class="col-sm-3 col-md-6 p-4 mx-auto">
                <div class="card" style="width: 600px; height: 350px">
                    <div class="card-body">
                        <h3 class="card-title" style="margin-top: 30px">Perfil de UsuarioProducto</h3>
                        <div class="text-center"></div>
                        <div class="mt-4">
                            <form action="/Surf/AUsuarioX" method="post">
                                <input type="hidden" name="id" value="<%= usuarioProductoModificar.getIdUsuarioProducto()%>">
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="nombre" class="form-label">Id Usuario</label>
                                        <select class="form-control" id="id_usuario" name="id_usuario">
                                            <% for (Usuario usuario : ausuario) {%>
                                            <option value="<%= usuario.getIdUsuario()%>" <%= usuario.getIdUsuario() == usuarioProductoModificar.getIdUsuario().getIdUsuario() ? "selected" : ""%>>
                                                <%= usuario.getIdUsuario()%> <%= usuario.getNomUsuario()%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="email" class="form-label">Id Producto</label>
                                        <select class="form-control" id="id_producto" name="id_producto">
                                            <% for (Producto prod : producto) {%>
                                            <option value="<%= prod.getIdProducto()%>" <%= prod.getIdProducto() == usuarioProductoModificar.getIdProducto().getIdProducto() ? "selected" : ""%>>
                                                <%= prod.getIdProducto()%> <%= prod.getNombre()%>
                                            </option>
                                            <% }%>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="FechaPedido" class="form-label">Fecha Pedido</label>
                                        <input type="hidden" name="FechaPedido2" value="<%= fechaPedidoFormatted%>">
                                        <input type="date" class="form-control" id="FechaPedido" name="FechaPedido" value="<%= fechaPedidoFormatted%>">
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="Cantidad" class="form-label">Cantidad</label>
                                        <input type="text" class="form-control" id="Cantidad" name="Cantidad" value="<%= usuarioProductoModificar.getCantidad()%>">
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-modificar" name="modificarproducto">Guardar Cambios</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <% } else if (n == 2) {%>
        <!--######################################## UPACK ################################################3-->
        <% String idp = request.getParameter("id");
            int isUP = Integer.parseInt(idp);

            UsuarioPack usuarioPackModificar = null;
            for (UsuarioPack upack : upac) {
                if (upack.getIdUsuarioPack() == isUP) {
                    usuarioPackModificar = upack;
                    break;
                }
            }

            if (usuarioPackModificar != null) {
                // Formatear la fecha de inicio en formato yyyy-MM-dd
                String fechaInicioFormatted = new java.text.SimpleDateFormat("yyyy-MM-dd").format(usuarioPackModificar.getFechaInicio());
        %>
        <div class="row mx-auto col-md-11">
            <div class="mb-4">
                <div class="card transparent-card">
                    <div class="card-body center-content">
                        <h1>Modificar el UsuarioPack con ID <%= isUP%></h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="row col-12 mx-auto">
            <div class="col-sm-3 col-md-6 p-4 mx-auto">
                <div class="card" style="width: 600px; height: 350px">
                    <div class="card-body">
                        <h3 class="card-title" style="margin-top: 30px">Perfil de UsuarioPack</h3>
                        <div class="text-center"></div>
                        <div class="mt-4">
                            <form action="/Surf/AUsuarioX" method="post">
                                <input type="hidden" name="id" value="<%= usuarioPackModificar.getIdUsuarioPack()%>">
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="FechaInicio" class="form-label">Fecha Inicio</label>
                                        <input type="hidden" name="FechaInicio2" value="<%= fechaInicioFormatted%>">
                                        <input type="date" class="form-control" id="FechaInicio" name="FechaInicio" value="<%= fechaInicioFormatted%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="id_usuario" class="form-label">Id Usuario</label>
                                        <select class="form-control" id="id_usuario" name="id_usuario">
                                            <% for (Usuario usuario : ausuario) {%>
                                            <option value="<%= usuario.getIdUsuario()%>" <%= usuario.getIdUsuario() == usuarioPackModificar.getIdUsuario().getIdUsuario() ? "selected" : ""%>>
                                                <%= usuario.getIdUsuario()%> <%= usuario.getNombre()%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="id_producto" class="form-label">Id Producto</label>
                                        <select class="form-control" id="id_pack" name="id_pack">
                                            <% for (Pack p : ipack) {%>
                                            <option value="<%= p.getIdPack()%>" <%= p.getIdPack() == usuarioPackModificar.getIdPack().getIdPack() ? "selected" : ""%>>
                                                <%= p.getIdPack()%> <%= p.getTitulo()%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-modificar" name="modificarpack">Guardar Cambios</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <% } else if (n == 3) {%>
        <!--######################################## UALO ################################################3-->
        <% String idalo = request.getParameter("id");
            int idA = Integer.parseInt(idalo);

            UsuarioAlojamiento usuarioAlojamiento = null;
            for (UsuarioAlojamiento upack : ualoj) {
                if (upack.getIdUsuarioAlojamiento() == idA) {
                    usuarioAlojamiento = upack;
                    break;
                }
            }

            if (usuarioAlojamiento != null) {
                // Formatear las fechas de entrada y salida en formato yyyy-MM-dd
                String fechaEntradaFormatted = new java.text.SimpleDateFormat("yyyy-MM-dd").format(usuarioAlojamiento.getFechaEntrada());
                String fechaSalidaFormatted = new java.text.SimpleDateFormat("yyyy-MM-dd").format(usuarioAlojamiento.getFechaSalida());
        %>
        <div class="row mx-auto col-md-11">
            <div class="mb-4">
                <div class="card transparent-card">
                    <div class="card-body center-content">
                        <h1>Modificar el UsuAlojamiento con ID <%= idA%></h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="row col-12 mx-auto">
            <div class="col-sm-3 col-md-6 p-4 mx-auto">
                <div class="card" style="width: 600px; height: 380px">
                    <div class="card-body">
                        <h3 class="card-title" style="margin-top: 30px">Perfil de UsuarioAlojamiento</h3>
                        <div class="text-center"></div>
                        <div class="mt-4">
                            <form action="/Surf/AUsuarioX" method="post">
                                <input type="hidden" name="id" value="<%= usuarioAlojamiento.getIdUsuarioAlojamiento()%>">
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="FechaEntrada" class="form-label">Fecha Entrada</label>
                                        <input type="hidden" name="FechaEntrada2" value="<%= fechaEntradaFormatted%>">
                                        <input type="date" class="form-control" id="FechaEntrada" name="FechaEntrada" value="<%= fechaEntradaFormatted%>">
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="FechaSalida" class="form-label">Fecha Salida</label>
                                        <input type="hidden" name="FechaSalida2" value="<%= fechaSalidaFormatted%>">
                                        <input type="date" class="form-control" id="FechaSalida" name="FechaSalida" value="<%= fechaSalidaFormatted%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3 col">
                                        <label for="id_usuario" class="form-label">Id Usuario</label>
                                        <select class="form-control" id="id_usuario" name="id_usuario">
                                            <% for (Usuario usuario : ausuario) {%>
                                            <option value="<%= usuario.getIdUsuario()%>" <%= usuario.getIdUsuario() == usuarioAlojamiento.getIdUsuario().getIdUsuario() ? "selected" : ""%>>
                                                <%= usuario.getIdUsuario()%> <%= usuario.getNomUsuario()%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="mb-3 col">
                                        <label for="id_producto" class="form-label">Id Alojamiento</label>
                                        <select class="form-control" id="id_alo" name="id_alo">
                                            <% for (Alojamiento alo : ialoja) {%>
                                            <option value="<%= alo.getIdAlojamiento()%>" <%= alo.getIdAlojamiento() == usuarioAlojamiento.getIdAlojamiento().getIdAlojamiento() ? "selected" : ""%>>
                                                <%= alo.getIdAlojamiento()%> <%= alo.getNombre()%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-modificar" name="modificaralo">Guardar Cambios</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <% }%>


    </body>
</html>
