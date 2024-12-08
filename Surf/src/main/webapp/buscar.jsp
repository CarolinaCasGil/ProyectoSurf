<%-- 
    Document   : alojamiento
    Created on : 28-ene-2024, 19:41:57
    Author     : CAROL
--%>

<%@page import="com.mycompany.dominio.Alojamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/css_footer.css">
        <link rel="stylesheet" href="css/css_pago_tarjeta.css">
        <link rel="stylesheet" href="css/css_flechitas.css">
        <link rel="stylesheet" href="css/css_video.css">
        <link rel="stylesheet" href="css/css_pago.css">
        <link rel="stylesheet" href="css/css_foto_producto.css">
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
            List<Alojamiento> alojamiento = (List<Alojamiento>) sesion.getAttribute("balojamiento");
            List<Producto> productos = (List<Producto>) sesion.getAttribute("bproducto");
            String op = (String) sesion.getAttribute("op");
            int i;

            String nom = "root";
            String clave = "1234";

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


        <br>

        <% if (op == "alo") { %>
        <% for (i = 0; i < alojamiento.size(); i++) {%>
        <div class="row col-md-11 mx-auto" style="background-color: rgba(255, 255, 255, 0.612);   margin-bottom: 30px;">
            <div class="col-sm-5 col-md-5 p-4 ml-5 mx-auto">
                <div style=" margin-top: 40px;">
                    <div id="carouselExampleIndicators<%= i%>" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="<%= alojamiento.get(i).getFoto1()%>" class="d-block w-100" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img src="<%= alojamiento.get(i).getFoto2()%>" class="d-block w-100" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img src="<%= alojamiento.get(i).getFoto3()%>" class="d-block w-100" alt="Third slide">
                            </div>
                            <div class="carousel-item">
                                <img src="<%= alojamiento.get(i).getFoto4()%>" class="d-block w-100" alt="Fourth slide">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators<%= i%>"
                                data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators<%= i%>"
                                data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>

            <div class="col-sm-3 col-md-3 p-4 ml-5 mx-auto my-auto">
                <div class="card" style="width: 100%; background-color: rgb(255, 255, 255);">
                    <div class="card-body">
                        <h5 class="card-title display-5 fw-bold text-center mb-"><%= alojamiento.get(i).getNombre()%></h5>
                        <p class="card-text" style="font-size: 18px"><%= alojamiento.get(i).getDescripcion()%></p>
                    </div>
                </div>
            </div>

            <div class="col-sm-3 col-md-3 p-4 ml-5 mx-auto my-auto">
                <div class="row">
                    <div class="col-sm-12 col-md-12 p-4 ml-5 mx-auto my-auto">
                        <iframe src="<%= alojamiento.get(i).getMaps()%>"
                                width="340" height="250" style="border:0;" allowfullscreen="" loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-12 p-4 ml-5 mx-auto my-auto">
                        <% if (sesion.getAttribute("nom_usuario") == null && sesion.getAttribute("clave") == null) {%>
                        <a href="loggin.jsp"  style="text-decoration: none; color: #000000;">
                            <% } else {%>
                            <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"style="text-decoration: none; color: #000000;">
                                <% }%>
                                <div class="pago">
                                    <div class="container">
                                        <div class="left-side">
                                            <div class="card">
                                                <div class="card-line"></div>
                                                <div class="buttons"></div>
                                            </div>
                                            <div class="post">
                                                <div class="post-line"></div>
                                                <div class="screen">
                                                    <div class="dollar"><%= alojamiento.get(i).getCosto()%>€</div>
                                                </div>
                                                <div class="numbers"></div>
                                                <div class="numbers-line2"></div>
                                            </div>
                                        </div>
                                        <div class="right-side">
                                            <div class="new"><%= alojamiento.get(i).getCosto()%>€</div>

                                            <svg viewBox="0 0 451.846 451.847" height="150" width="150"
                                                 xmlns="http://www.w3.org/2000/svg" class="arrow">
                                            <path fill="#cfcfcf" data-old_color="#000000" class="active-path"
                                                  data-original="#000000"
                                                  d="M345.441 248.292L151.154 442.573c-12.359 12.365-32.397 12.365-44.75 0-12.354-12.354-12.354-32.391 0-44.744L278.318 225.92 106.409 54.017c-12.354-12.359-12.354-32.394 0-44.748 12.354-12.359 32.391-12.359 44.75 0l194.287 194.284c6.177 6.18 9.262 14.271 9.262 22.366 0 8.099-3.091 16.196-9.267 22.373z">
                                            </path>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                            </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- ################################### MODAL PAGO ################################### -->

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Confirmar Pago</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <section class="container">
                            <header>DATOS DE COMPRA</header>
                            <form class="form" action="/Surf/PagPagoPacks" method="post">
                                <div class="column">
                                    <div class="input-box">
                                        <input required="" placeholder="Primer apellido" type="text">
                                    </div>
                                    <div class="input-box">
                                        <input required="" placeholder="Segundo apellido" type="text">
                                    </div>
                                </div>
                                <div class="input-box">
                                    <label>Tarjeta</label>
                                    <input required="" placeholder="Numero de la tarjeta" type="number">
                                </div>
                                <div class="column">
                                    <div class="input-box">
                                        <input required="" placeholder="Numero de seguridad" type="number">
                                    </div>
                                    <div class="input-box">
                                        <input required="" placeholder="Fecha de expiracion" type="date">
                                    </div>
                                </div>

                                <div class="column">
                                    <div class="input-box">
                                        <label>Fecha de llegada</label>
                                        <input required="" placeholder="Fecha de expiracion" type="date">
                                    </div>
                                    <div class="input-box">
                                        <label>Fecha de ida</label>
                                        <input required="" placeholder="Fecha de expiracion" type="date">
                                    </div>
                                </div>
                                <input type="hidden" name="id" value="<%= alojamiento.get(i).getIdAlojamiento()%>">
                                <button type="submit" class="btn btn-primary">Confirmar</button>
                            </form>
                        </section>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
        <% }%>
        <% } else if (op == "pro") { %>

        <div class="row col-sm-12 col-md-12">
            <div class="col-sm-11 col-md-11 p-4 ml-5 mx-auto">


                <% int count = 0; %>

                <% for (Producto producto : productos) { %>
                <% if (count % 4 == 0) { %>
                <div class="row ftproducto">
                    <% }%>

                    <div class="col-sm-4 col-md-4 p-4 ml-5 mx-auto" style="width: 20%;">
                        <div class="prod-card">
                            <a class="prod-card__img-link" href="#0" aria-label="Description of the link">
                                <figure class="prod-card__img">
                                    <img src="<%= producto.getFoto()%>" alt="Product preview image">
                                </figure>
                            </a>

                            <div class="ps2-padding-sm ps2-text-center">
                                <h3><a class="ps2-color-inherit" href="#0"><%= producto.getNombre()%></a></h3>

                                <div class="ps2-margin-top-xs">
                                    <span class="prod-card__price" style="color: white;"><%= producto.getCosto()%>€</span>
                                </div>
                                <div class="d-flex justify-content-center ps2-margin-top-xs">
                                    <form action="<%= (sesion.getAttribute("nom_usuario") == null && sesion.getAttribute("clave") == null) ? "/Surf/CarritoSinSesion" : "/Surf/CarritoServlet"%>" method="post">
                                        <input type="hidden" name="p" value="<%= producto.getIdProducto()%>">
                                        <button type="submit" class="btn btn-dark">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-shopping-cart" width="40" height="40" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ffffff" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M6 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M17 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path d="M17 17h-11v-14h-2" />
                                            <path d="M6 5l14 1l-1 7h-13" />
                                            </svg>
                                        </button>
                                    </form>
                                    <!--
                                        <button type="button" class="btn btn-dark">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-credit-card" width="40" height="40" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ffffff" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                        <path d="M3 5m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v8a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z" />
                                        <path d="M3 10l18 0" />
                                        <path d="M7 15l.01 0" />
                                        <path d="M11 15l2 0" />
                                        </svg>
                                    </button>-->
                                </div>
                            </div>
                        </div>
                    </div>

                    <% if (count % 4 == 3 || count == productos.size() - 1) { %>
                </div>
                <% } %>

                <% count++; %>
                <% }%>

            </div></div>
            <% } else {%>
        <div class="container mt-5">
            <div class="alert alert-danger my-auto text-center" role="alert">
                No se ha podido encontrar lo que ha escrito <%= op%>
            </div>
        </div>
        <% }%>



        <br><br><br>


        <!-- ################################### FOOTER ################################### -->
        <%@ include file='Componentes/footer.jsp' %>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    </body>

</html>
