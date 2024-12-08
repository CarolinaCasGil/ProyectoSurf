<%-- 
    Document   : listaractividades
    Created on : 17-nov-2023, 23:25:45
    Author     : CAROL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
            body {
                background-image: url('img/fondopag.jpeg');
                background-size: cover;
                background-position: center;
            }
        </style>
    </head>

    <body>

        <!-- ########################################## MENU ######################################################## -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid" style="background-color: rgb(58, 139, 210); height: 80px;">
                <div class="col-md-1 mx-auto">
                    <a class="navbar-brand" href="index.html"><img src="img/logo.png" style="width: 80%;"></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active fw-bold" aria-current="page" href="index.html">Inicio</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle fw-bold" href="actividades.html" id="navbarDropdown"
                               role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: black;">
                                Actividades
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item fw-bold" href="#" style="color: black;">Todas</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item fw-bold" href="#" style="color: black;">Surf</a></li>
                                <li><a class="dropdown-item fw-bold" href="#" style="color: black;">Yoga</a></li>
                                <li><a class="dropdown-item fw-bold" href="#" style="color: black;">Kayak</a></li>
                            </ul>
                        <li class="nav-item">
                            <a class="nav-link fw-bold" href="#" style="color: black;">Alojamiento</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fw-bold" href="#" style="color: black;">Producto</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fw-bold" href="loggin.html" style="color: black;">Loggin</a>
                        </li>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <br><br>
        <!-- ########################################## LISTAR COSAS ######################################################## -->
        <div class="container mt-5" style="background-color: white;">
            <br>
            <h3 class="mb-4">Tabla de Actividades</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID Actividad</th>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                        <th>Capacidad</th>
                        <th>Costo</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${actividades}" var="actividad">
                        <tr>
                            <td>${actividad.id_actividad}</td>
                            <td>${actividad.nombre}</td>
                            <td>${actividad.descripcion}</td>
                            <td>${actividad.capacidad}</td>
                            <td>${actividad.costo}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    </body>

</html>


