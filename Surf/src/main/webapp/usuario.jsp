<%-- 
    Document   : usuario
    Created on : 30-ene-2024, 17:40:48
    Author     : CAROL
--%>

<%@page import="com.mycompany.dominio.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/css_footer.css">
        <link rel="stylesheet" href="css/css_usuario.css">
        <style>
            body {
                background-image: url('img/fondopag.jpeg');
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
            String nom = "root";
            String clave = "1234";
            List<UsuarioProducto> upro = (List<UsuarioProducto>) sesion.getAttribute("upro");
            List<UsuarioPack> upac = (List<UsuarioPack>) sesion.getAttribute("upac");
            List<UsuarioAlojamiento> ualoj = (List<UsuarioAlojamiento>) sesion.getAttribute("ualoj");
            List<Producto> pro = (List<Producto>) sesion.getAttribute("producto");
            List<Pack> packs = (List<Pack>) sesion.getAttribute("packs");
            List<Alojamiento> alojamiento = (List<Alojamiento>) sesion.getAttribute("alojamiento");

            if (sesion.getAttribute("nom_usuario") == null && sesion.getAttribute("clave") == null) {%>
        <%@ include file='Componentes/navbar.jsp' %>
        <% } else if (nom.equals(sesion.getAttribute("nom_usuario")) && clave.equals(sesion.getAttribute("clave"))) {%>
        <%@ include file='Componentes/navbar3.jsp' %>
        <% } else {%>
        <%@ include file='Componentes/navbar2.jsp' %>
        <%  List<Producto> carrito = (List<Producto>) sesion.getAttribute("carrito");
            List<Carrito> cantproducto = (List<Carrito>) sesion.getAttribute("cantcarrito");%>
        <!-- Modal Carrito -->
        <div class="modal fade" id="carritoModal" tabindex="-1" aria-labelledby="carritoModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="carritoModalLabel">Carrito de Compras</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row row-cols-1 row-cols-md-3 g-4">
                            <%
                                for (Producto producto : carrito) {
                            %>
                            <div class="col">
                                <div class="card h-100">
                                    <div style="aspect-ratio: 1; overflow: hidden; background-color: #f8f9fa;">
                                        <img src="<%= producto.getFoto()%>" class="card-img-top img-fluid" style="width: 100%; height: 100%; object-fit: contain;">
                                    </div>
                                    <div class="card-body d-flex flex-column">
                                        <h5 class="card-title text-center"><%= producto.getNombre()%></h5>
                                        <p class="card-text text-center mb-0"><%= producto.getCosto()%>€</p>
                                        <div class="container mx-auto d-flex justify-content-end mt-3">

                                            <%
                                                for (Carrito carr : cantproducto) {
                                                    if (producto.getIdProducto().equals(carr.getIdProducto().getIdProducto()) && carr.getIdUsuario().getIdUsuario().equals(sesion.getAttribute("id_usuario"))) {

                                            %>
                                            <form action="/Surf/MasMenosProducto" method="post">
                                                <input type="hidden" id="id" name="id" value="<%= carr.getIdCarrito()%>">
                                                <div class="d-flex align-items-center">
                                                    <button type="submit" class="btn btn-light border" style="padding: 5px 10px; margin-right: 5px;" id="menoscon" name="menoscon">-</button>
                                                    <span class="border p-2"><%= carr.getCantidad()%></span>
                                                    <button type="submit" class="btn btn-light border" style="padding: 5px 10px; margin-left: 5px;" id="mascon" name="mascon">+</button>
                                                </div>
                                            </form>
                                            <form action="/Surf/BorrarCarrito" method="post" class="d-flex align-items-center">
                                                <input type="hidden" id="id" name="id" value="<%= carr.getIdCarrito()%>">
                                                <button type="submit" class="btn btn-dark" style="background-color: transparent; border: none; margin-left: 10px;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-trash" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ff0000" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                    <path d="M4 7l16 0" />
                                                    <path d="M10 11l0 6" />
                                                    <path d="M14 11l0 6" />
                                                    <path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                                                    <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                                                    </svg>
                                                </button>
                                            </form>
                                            <% }
                                                } %>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary"><a href="pago_producto.jsp" style="text-decoration: none; color: #ffffff;">Proceder al Pago</a></button>
                    </div>
                </div>
            </div>
        </div>
        <%}%>

        <br><br>


        <div class="container" style="margin-left: 250px;">
            <div class="row justify-content-center">
                <div class="col-sm-6 col-md-6 p-4 ml-5">
                    <div class="card" style="width: 400px; height: 480px;">
                        <div class="card-body">
                            <h3 class="card-title" style="margin-top: 30px">Perfil de Usuario</h3>
                            <div class="text-center">
                                <h4 class="mt-3"><%= sesion.getAttribute("nom_usuario")%></h4>
                                <p class="text-muted"><%= sesion.getAttribute("email")%></p>
                            </div>
                            <div class="mt-4">
                                <h5><strong>Información Personal</strong></h5>
                                <br>
                                <p><strong>Nombre:</strong> <%= sesion.getAttribute("nombre")%></p>
                                <p><strong>Apellido:</strong> <%= sesion.getAttribute("apellido")%></p>
                                <p><strong>Telefono:</strong> <%= sesion.getAttribute("telef")%></p>
                            </div>
                            <div class="mt-4 d-flex justify-content-between">
                                <form action="" method="post">
                                    <button class="btn btn-primary btn-modificar">
                                        <a href="modificarusuario.jsp" style="text-decoration: none; color: white;">Modificar</a>
                                    </button>
                                </form>
                                <form action="/Surf/CerrarSesion" method="post">
                                    <button class="btn btn-danger btn-modificar">Cerrar Sesión</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-6 p-4 ml-5">
                    <div class="card" style="width: 600px; height: 480px;">
                        <div class="card-body">
                            <h5 class="card-title">Información</h5>

                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="productos-tab" data-toggle="tab" href="#tab-productos" role="tab" aria-controls="tab-productos" aria-selected="true">Pedidos</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="compras-tab" data-toggle="tab" href="#tab-compras" role="tab" aria-controls="tab-compras" aria-selected="false">Actividades</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="perfil-tab" data-toggle="tab" href="#tab-perfil" role="tab" aria-controls="tab-perfil" aria-selected="false">Alojamiento</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content mt-3" id="myTabContent">
                                <!-- Tab contenido de Productos -->
                                <div class="tab-pane fade show active" id="tab-productos" role="tabpanel" aria-labelledby="productos-tab">
                                    <div style="max-height: 300px; overflow-y: auto;">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Foto</th>
                                                    <th>Producto</th>
                                                    <th>Cantidad</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% if (upro != null) {
                                                        for (UsuarioProducto up : upro) {
                                                            for (Producto p : pro) {
                                                                if (up.getIdProducto().equals(p)) {%>
                                                <tr>
                                                    <td>
                                                        <img src="<%= p.getFoto()%>" alt="Foto del Producto" style="width: 50px; height: 50px; object-fit: cover;">
                                                    </td>
                                                    <td><%= p.getNombre()%></td>
                                                    <td><%= up.getCantidad()%></td>
                                                </tr>
                                                <% }
                                                        }
                                                    }
                                                } else { %>
                                                <tr>
                                                    <td colspan="3">No hay productos para mostrar.</td>
                                                </tr>
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!-- Tab contenido de Compras -->
                                <div class="tab-pane fade" id="tab-compras" role="tabpanel" aria-labelledby="compras-tab">
                                    <div style="max-height: 300px; overflow-y: auto;">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Foto</th>
                                                    <th>Producto</th>
                                                    <th>Fecha inicio</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% if (upac != null) {
                                                        for (UsuarioPack upa : upac) {
                                                            for (Pack p : packs) {
                                                                if (upa.getIdPack().equals(p)) {%>
                                                <tr>
                                                    <td>
                                                        <img src="<%= p.getFoto()%>" alt="Foto del Producto" style="width: 50px; height: 50px; object-fit: cover;">
                                                    </td>
                                                    <td><%= p.getTitulo()%></td>
                                                    <td><fmt:formatDate value="<%= upa.getFechaInicio()%>" pattern="yyyy/MM/dd" /></td>
                                            </tr>
                                            <% }
                                                    }
                                                }
                                            } else { %>
                                            <tr>
                                                <td colspan="3">No hay productos para mostrar.</td>
                                            </tr>
                                            <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!-- Tab contenido de Perfil -->
                                <div class="tab-pane fade" id="tab-perfil" role="tabpanel" aria-labelledby="perfil-tab">
                                    <div style="max-height: 300px; overflow-y: auto;">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Foto</th>
                                                    <th>Producto</th>
                                                    <th>Fecha Entrada</th>
                                                    <th>Fecha Salida</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% if (ualoj != null) {
                                                        for (UsuarioAlojamiento upalo : ualoj) {
                                                            for (Alojamiento alo : alojamiento) {
                                                                if (upalo.getIdAlojamiento().equals(alo)) {%>
                                                <tr>
                                                    <td>
                                                        <img src="<%= alo.getFoto1()%>" alt="Foto del Producto" style="width: 50px; height: 50px; object-fit: cover;">
                                                    </td>
                                                    <td><%= alo.getNombre()%></td>
                                                    <td><fmt:formatDate value="<%= upalo.getFechaEntrada()%>" pattern="yyyy/MM/dd" /></td>
                                            <td><fmt:formatDate value="<%= upalo.getFechaSalida()%>" pattern="yyyy/MM/dd" /></td>
                                            </tr>
                                            <% }
                                                    }
                                                }
                                            } else { %>
                                            <tr>
                                                <td colspan="4">No hay productos para mostrar.</td>
                                            </tr>
                                            <% }%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


    </div>
</div>


<br><br><br><br>

<!-- ################################### FOOTER ################################### -->
<br><br><br>
<%@ include file='Componentes/footer.jsp' %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>


</body>
</html>


