<%-- 
    Document   : producto
    Created on : 28-ene-2024, 19:54:50
    Author     : CAROL
--%>

<%@page import="com.mycompany.service.ProductoService"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.service.IProductoService"%>
<%@page import="com.mycompany.dominio.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.HashSet" %>
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
        <link rel="stylesheet" href="css/css_foto_producto.css">
        <link rel="stylesheet" href="css/css_prueba.css">
        <link rel="stylesheet" href="js/js_prueba.js">
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

            function submitForm(action) {
                document.getElementById('carritoForm').action = action;
                document.getElementById('carritoForm').submit();
            }

            function checkStock(isOutOfStock) {
                if (isOutOfStock) {
                    alert('No hay más existencias');
                    return false; // Evitar que se envíe el formulario
                }
                return true;
            }

        </script>
    </head>


    <!-- ########################################## MENU ######################################################## -->
    <%
        HttpSession sesion = request.getSession();
        List<Producto> productos = (List<Producto>) sesion.getAttribute("productos");

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
                                <%
                                    boolean isOutOfStock = producto.getCantidad() == 0;
                                    String formAction = (sesion.getAttribute("nom_usuario") == null && sesion.getAttribute("clave") == null) ? "/Surf/CarritoSinSesion" : "/Surf/CarritoServlet";
                                %>
                                <form action="<%= formAction%>" method="post" onsubmit="return checkStock(<%= isOutOfStock%>);">
                                    <input type="hidden" name="p" value="<%= producto.getIdProducto()%>">
                                    <button type="submit" class="btn btn-dark" <%= isOutOfStock ? "disabled" : ""%>>
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-shopping-cart" width="40" height="40" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ffffff" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                        <path d="M6 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                        <path d="M17 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                        <path d="M17 17h-11v-14h-2" />
                                        <path d="M6 5l14 1l-1 7h-13" />
                                        </svg>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <% if (count % 4 == 3 || count == productos.size() - 1) { %>
            </div>
            <% } %>

            <% count++; %>
            <% }%>

        </div>
    </div>






    <br><br><br>
    <!-- ################################### FOOTER ################################### -->
    <%@ include file='Componentes/footer.jsp' %>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>
</body>

</html>
