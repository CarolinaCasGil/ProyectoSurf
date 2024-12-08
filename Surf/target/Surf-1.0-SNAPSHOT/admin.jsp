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
            .transparent-card {
                width: 600px;
                height: 400px;
                background-color: rgba(255, 255, 255, 0.2);
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
            List<Producto> carrito = (List<Producto>) sesion.getAttribute("carrito");
            String nom = "root";
            String clave = "1234";

            if (sesion.getAttribute("nom_usuario") == null && sesion.getAttribute("clave") == null) {%>
        <%@ include file='Componentes/navbar.jsp' %>
        <% } else if (nom.equals(sesion.getAttribute("nom_usuario")) && clave.equals(sesion.getAttribute("clave"))) {%>
        <%@ include file='Componentes/navbar3.jsp' %>
        <% } else {%>
        <%@ include file='Componentes/navbar2.jsp' %>
        <% }%>

        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-12 mb-4">
                            <a href="usuarios" style="text-decoration: none;">
                                <div class="card transparent-card">
                                    <div class="card-body center-content">
                                        <p><svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user"
                                                width="300" height="300" viewBox="0 0 24 24" stroke-width="1.5"
                                                stroke="#ffffff" fill="none" stroke-linecap="round"
                                                stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path
                                                d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0" />
                                            <path
                                                d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" />
                                            </svg></p>
                                        <h5 class="card-title text-white">USUARIOS</h5>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-12 mb-4">
                            <a href="alojamientos" style="text-decoration: none;">
                                <div class="card transparent-card">
                                    <div class="card-body center-content">
                                        <p><svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-home"
                                                width="300" height="300" viewBox="0 0 24 24" stroke-width="1.5"
                                                stroke="#ffffff" fill="none" stroke-linecap="round"
                                                stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path
                                                d="M5 12l-2 0l9 -9l9 9l-2 0" />
                                            <path
                                                d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" />
                                            <path
                                                d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" />
                                            </svg></p>
                                        <h5 class="card-title text-white">ALOJAMIENTOS</h5>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-12 mb-4">
                            <a href="actividades" style="text-decoration: none;">
                                <div class="card transparent-card">
                                    <div class="card-body center-content">
                                        <p><svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-kayak"
                                                width="300" height="300" viewBox="0 0 24 24" stroke-width="1.5"
                                                stroke="#ffffff" fill="none" stroke-linecap="round"
                                                stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path
                                                d="M6.414 6.414a2 2 0 0 0 0 -2.828l-1.414 -1.414l-2.828 2.828l1.414 1.414a2 2 0 0 0 2.828 0z" />
                                            <path
                                                d="M17.586 17.586a2 2 0 0 0 0 2.828l1.414 1.414l2.828 -2.828l-1.414 -1.414a2 2 0 0 0 -2.828 0z" />
                                            <path
                                                d="M6.5 6.5l11 11" />
                                            <path
                                                d="M22 2.5c-9.983 2.601 -17.627 7.952 -20 19.5c9.983 -2.601 17.627 -7.952 20 -19.5z" />
                                            <path
                                                d="M6.5 12.5l5 5" />
                                            <path
                                                d="M12.5 6.5l5 5" />
                                            </svg></p>
                                        <h5 class="card-title text-white">ACTIVIDADES</h5>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-12 mb-4">
                            <a href="productos" style="text-decoration: none;">
                                <div class="card transparent-card">
                                    <div class="card-body center-content">
                                        <p><svg xmlns="http://www.w3.org/2000/svg"
                                                class="icon icon-tabler icon-tabler-shopping-cart" width="300" height="300"
                                                viewBox="0 0 24 24" stroke-width="1.5" stroke="#ffffff" fill="none"
                                                stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path
                                                d="M6 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path
                                                d="M17 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                            <path
                                                d="M17 17h-11v-14h-2" />
                                            <path
                                                d="M6 5l14 1l-1 7h-13" />
                                            </svg></p>
                                        <h5 class="card-title text-white">PRODUCTOS</h5>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

    </body>

</html>