<%-- 
    Document   : navbar
    Created on : 25-ene-2024, 9:58:03
    Author     : CAROL
--%>

<%@page import="com.mycompany.dominio.Producto"%>
<%@page import="com.mycompany.dominio.Carrito"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                            <li><a class="dropdown-item" href="PagPacksServlet?llenar=kayak"style="color: black; font-size: 16px; font-weight: bold;">Kayak</a>
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
                            <a class="nav-link active" aria-current="page" href="Estadisticas" style="color: black;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="44" height="44" fill="currentColor" class="bi bi-file-bar-graph" viewBox="0 0 16 16">
                                <path d="M4.5 12a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5zm3 0a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5zm3 0a.5.5 0 0 1-.5-.5v-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-.5.5z"/>
                                <path d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1"/>
                                </svg>
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="admin.jsp" style="color: black;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="44" height="44" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
                                <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492M5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0"/>
                                <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115z"/>
                                </svg>
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="usuario.jsp" style="color: white;">
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

