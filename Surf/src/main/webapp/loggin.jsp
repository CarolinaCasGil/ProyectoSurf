<%@page import="com.mycompany.dominio.Producto"%>
<%@page import="java.util.List"%>
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
        <link rel="stylesheet" href="css/css_loggin.css">
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
            List<Producto> carrito = (List<Producto>) sesion.getAttribute("carrito");
        %>

        <%@ include file='Componentes/navbar.jsp' %>



        <div class="row col-12 mx-auto">
            <div class="wrapper">
                <div class="card-switch">
                    <label class="switch">
                        <input type="checkbox" class="toggle">
                        <span class="slider"></span>
                        <span class="card-side"></span>
                        <div class="flip-card__inner">
                            <div class="flip-card__front">
                                <div class="title">Log in</div>
                                <!-- ############### LOGIN ############### -->
                                <form class="flip-card__form" action="/Surf/InicioSesionServlet" method="post">
                                    <input class="flip-card__input" name="nom_usuario" placeholder="Nombre usuario" type="text">
                                    <input class="flip-card__input" name="clave" placeholder="Contraseña" type="password">
                                    <button class="flip-card__btn" name="enviarL"> Enviar</button>
                                </form>
                            </div>
                            <div class="flip-card__back">
                                <div class="title">Sign up</div>
                                <!-- ############### REGISTER ############### -->
                                <form class="flip-card__form double-row" action="/Surf/RegistroServlet" method="post">
                                    <div class="input-grup" >
                                        <input class="flip-card__input espacio" placeholder="Nombre" type="name" name="nombre">
                                        <input class="flip-card__input" placeholder="Apellido" type="name" name="apellido">
                                    </div>
                                    <div class="input-grup">
                                        <input class="flip-card__input espacio" placeholder="Nombre Usuario" type="name" name="nom_usuario">
                                        <input class="flip-card__input" placeholder="Telefono" type="name" name="telef">
                                    </div>
                                    <div class="input-grup">
                                        <input class="flip-card__input espacio" name="email" placeholder="Email" type="email">
                                        <input class="flip-card__input espacio" name="clave" placeholder="Password" type="password">
                                        <input class="flip-card__input" name="clave2" placeholder="Password" type="password">
                                    </div>


                                    <button class="flip-card__btn" name="enviarR">Enviar</button>
                                </form>
                            </div>
                        </div>
                    </label>
                </div>
            </div>
        </div>


        <br><br><br><br><br><br><br><br><br><br><br><br>

        <!-- ################################### FOOTER ################################### -->
        <%@ include file='Componentes/footer.jsp' %>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    </body>

</html>