<%-- 
    Document   : navbar
    Created on : 25-ene-2024, 9:58:03
    Author     : CAROL
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.dominio.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.HashMap, java.util.List, com.mycompany.dominio.Producto" %>
<!DOCTYPE html>


<body>


    <!-- ########################################## MENU ######################################################## -->
    <nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: rgb(58, 139, 210);">
        <div class="container-fluid">
            <a class="navbar-brand mx-auto" href="index.jsp"><img src="img/logo.png" alt="" style="width: 70%; margin-left: 10%;"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation" style="background-color: rgba(255, 255, 255, 0.653); width: 15%;">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-menu-2" width="44"
                     height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none"
                     stroke-linecap="round" stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                <path d="M4 6l16 0" />
                <path d="M4 12l16 0" />
                <path d="M4 18l16 0" />
                </svg></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp"
                           style="color: black; font-size: 18px; font-weight: bold;">Inicio</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false" style="color: black; font-size: 18px; font-weight: bold;">
                            Actividades
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="todas.jsp"
                                   style="color: black; font-size: 16px; font-weight: bold;">Todas</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="PagPacksServlet?llenar=surf" style="color: black; font-size: 16px; font-weight: bold;">Surf</a></li>
                            <li><a class="dropdown-item" href="PagPacksServlet?llenar=paddlesurf" style="color: black; font-size: 16px; font-weight: bold;">Paddle Surf</a></li>
                            <li><a class="dropdown-item" href="PagPacksServlet?llenar=yoga" style="color: black; font-size: 16px; font-weight: bold;">Yoga</a></li>
                            <li><a class="dropdown-item" href="PagPacksServlet?llenar=kayak"style="color: black; font-size: 16px; font-weight: bold;">Kayak</a></li>

                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="PagAlojamiento?llenar=true"
                           style="color: black; font-size: 18px; font-weight: bold;">Alojamiento</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="PagProductoservlet?llenar=true"
                           style="color: black; font-size: 18px; font-weight: bold;">Producto</a>
                    </li>
                </ul>
                <div class="d-flex">
                    <form class="d-flex" role="search" action="/Surf/BuscarSevlet" method="post">
                        <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search"
                               style="width: 65%;" name="Buscar">
                        <button class="btn btn-outline-success" type="submit"
                                style="background-color: #0e3b8f; color: #fff; border: 2px solid #0e3b8f; padding: 10px 20px; font-size: 16px; width: 30%;">Buscar</button>
                    </form>
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"
                               style="color: white;" data-bs-toggle="modal" data-bs-target="#carritoModal">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="icon icon-tabler icon-tabler-shopping-cart" width="44" height="44"
                                     viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none"
                                     stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <path d="M6 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                <path d="M17 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                <path d="M17 17h-11v-14h-2" />
                                <path d="M6 5l14 1l-1 7h-13" />
                                </svg>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="loggin.jsp" style="color: white;">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user"
                                     width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000"
                                     fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0" />
                                <path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" />
                                </svg>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</body>




<!--Modal Carrito--> 
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
                        Map<Producto, Integer> productCountMap = (Map<Producto, Integer>) session.getAttribute("productCountMap");

                        if (productCountMap != null && !productCountMap.isEmpty()) {
                            for (Map.Entry<Producto, Integer> entry : productCountMap.entrySet()) {
                                Producto producto = entry.getKey();
                                Integer cantidad = entry.getValue();
                    %>
                    <div class="col">
                        <div class="card h-100">
                            <div style="aspect-ratio: 1; overflow: hidden; background-color: #f8f9fa;">
                                <img src="<%= producto.getFoto()%>" class="card-img-top img-fluid" alt="<%= producto.getNombre()%>" style="width: 100%; height: 100%; object-fit: contain;">
                            </div>
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title text-center"><%= producto.getNombre()%></h5>
                                <p class="card-text text-center mb-0"><%= producto.getCosto()%>€</p>
                                <div class="container mx-auto d-flex justify-content-between mt-3">
                                    <form action="/Surf/MasMenosProducto" method="post">
                                        <input type="hidden" id="id" name="id" value="<%= producto.getIdProducto()%>">
                                        <div class="d-flex align-items-center">
                                            <button type="submit" class="btn btn-light border" style="padding: 5px 10px; margin-right: 5px;" id="menossin" name="menossin">-</button>
                                            <span class="border p-2"><%= cantidad%></span>
                                            <button type="submit" class="btn btn-light border" style="padding: 5px 10px; margin-left: 5px;" id="massin" name="massin">+</button>
                                        </div>
                                    </form>
                                    <form action="/Surf/BorrarProductoSinSesion" method="post">
                                        <input type="hidden" name="id" value="<%= producto.getId_producto()%>">
                                        <button type="submit" class="btn btn-dark" style="background-color: transparent; border: none;">
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
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                            }
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