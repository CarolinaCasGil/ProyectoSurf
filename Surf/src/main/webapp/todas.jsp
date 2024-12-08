<%-- 
    Document   : todas
    Created on : 28-ene-2024, 19:33:15
    Author     : CAROL
--%>

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
    <link rel="stylesheet" href="css/css_video.css">
    <style>
        body {
            background-image: url('img/fondopag.jpeg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
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


    <!-- ########################################## VIDEO ######################################################## -->
    <section class="video-bg va6-position-relative">
        <div class="video-bg__media" aria-hidden="true">
            <img src="../../assets/img/video-background-hero-img-1.jpg" alt="Video Preview">
            <video autoplay loop muted playsInline src="video/todas.mp4"></video>
        </div>

        <div class="va6-container va6-max-width-lg va6-position-relative va6-z-index-2">
            <div class="va6-flex va6-flex-center va6-padding-y-3xl">
                <div class="va6-text-component va6-text-center">
                    <h1 style="color: #fff;">¡¡UNETE A NOSOTROS!!</h1>
                </div>
            </div>
        </div>
    </section>

    <!-- ########################################## ACTIVIDADES ######################################################## -->
    <div class="row col-md-11 mx-auto">

        <div class="col-sm-6 col-md-5 p-4 ml-5 mx-auto">
            <img src="img/surf.png" class="img-fluid" style="width: 100%;">
        </div>

        <div class="col-sm-6 col-md-6 p-4 ml-5 mx-auto my-auto">
            <div class="card" style="width: 100%; background-color: rgba(255, 255, 255, 0.947);">
                <div class="card-body">
                    <h5 class="card-title display-4 fw-bold text-center mb-">¡CLASES DE SURF!</h5>
                    <p class="card-text"
                        style="margin-left: 15px; margin-right: 15px; margin-top: 15px; font-size: 20px">¡Descubre el
                        arte de domar las olas con nuestras clases de surf! Sumérgete en la emoción del océano mientras
                        nuestros instructores expertos te guían en la conquista de las olas. Desde principiantes hasta
                        surfistas avanzados, nuestras lecciones están diseñadas para todos. Vive la adrenalina,
                        perfecciona tu técnica y crea recuerdos inolvidables en cada rompiente. Únete a nosotros para
                        una experiencia única en el mundo del surf. ¡Surfea con pasión y haz que cada ola cuente!</p>
                </div>
                <div class="text-center">
                    <button type="button" class="btn btn-info"><a href="PagPacksServlet?llenar=surf"
                            style="text-decoration: none; color: rgb(0, 0, 0);"> ¡Reserva Ahora!</a></button>
                </div>
                <br>
            </div>
        </div>

    </div>

    <div class="row col-md-11 mx-auto">

        <div class="col-sm-6 col-md-6 p-4 ml-5 mx-auto my-auto">
            <div class="card" style="width: 100%; background-color: rgba(255, 255, 255, 0.947);">
                <div class="card-body">
                    <h5 class="card-title display-4 fw-bold text-center mb-">¡CLASES DE PADDLE SURF!</h5>
                    <p class="card-text"
                        style="margin-left: 15px; margin-right: 15px; margin-top: 15px; font-size: 20px">¡Embárcate en
                        una aventura acuática única con nuestras clases de Paddle Surf! Descubre la magia de deslizarte
                        sobre las aguas mientras fortaleces tu equilibrio y conectas con la naturaleza. Nuestros
                        instructores especializados te guiarán para dominar las técnicas y disfrutar de la serenidad del
                        remo. Ya seas un principiante o un entusiasta del paddle surf, nuestras clases ofrecen diversión
                        y desafío. Únete a nosotros y vive la emoción de remar sobre las olas mientras creas momentos
                        inolvidables. </p>
                </div>
                <div class="text-center">
                    <button type="button" class="btn btn-info"><a href="PagPacksServlet?llenar=paddlesurf"
                            style="text-decoration: none; color: rgb(0, 0, 0);"> ¡Reserva Ahora!</a></button>
                </div>
                <br>
            </div>
        </div>

        <div class="col-sm-6 col-md-5 p-4 ml-5 mx-auto">
            <img src="img/paddel.png" class="img-fluid" style="width: 100%;">
        </div>

    </div>

    <div class="row col-md-11 mx-auto">

        <div class="col-sm-6 col-md-5 p-4 ml-5 mx-auto">
            <img src="img/yoga.png" class="img-fluid" style="width: 100%;">
        </div>
        <div class="col-sm-6 col-md-6 p-4 ml-5 mx-auto my-auto">
            <div class="card" style="width: 100%; background-color: rgba(255, 255, 255, 0.947);">
                <div class="card-body">
                    <h5 class="card-title display-4 fw-bold text-center mb-">¡CLASES DE YOGA!</h5>
                    <p class="card-text"
                        style="margin-left: 15px; margin-right: 15px; margin-top: 15px; font-size: 20px">¡Descubre la
                        armonía entre cuerpo y mente con nuestras clases de Yoga! Sumérgete en un oasis de tranquilidad
                        mientras exploras posturas revitalizantes y técnicas de respiración que te llevarán a un estado
                        de serenidad. Nuestros instructores certificados te guiarán en un viaje de bienestar,
                        flexibilidad y equilibrio. Ya seas un principiante o un yogui experimentado, nuestras clases
                        ofrecen un espacio donde puedes rejuvenecer y encontrar paz interior. Únete a nosotros para
                        nutrir tu bienestar y disfrutar de una experiencia de yoga transformadora.</p>
                </div>
                <div class="text-center">
                    <button type="button" class="btn btn-info"><a href="PagPacksServlet?llenar=yoga"
                            style="text-decoration: none; color: rgb(0, 0, 0);"> ¡Reserva Ahora!</a></button>
                </div>
                <br>
            </div>
        </div>

    </div>

    <div class="row col-md-11 mx-auto">

        <div class="col-sm-6 col-md-6 p-4 ml-5 mx-auto my-auto">
            <div class="card" style="width: 100%; background-color: rgba(255, 255, 255, 0.947);">
                <div class="card-body">
                    <h5 class="card-title display-4 fw-bold text-center mb-">¡CLASES DE KAYAK!</h5>
                    <p class="card-text"
                        style="margin-left: 15px; margin-right: 15px; margin-top: 15px; font-size: 20px">¡Explora las
                        maravillas acuáticas con nuestras clases de Kayak! Sumérgete en la aventura mientras remas a
                        través de escenarios pintorescos y descubres la emoción de explorar cuevas marinas. Nuestros
                        instructores expertos te brindarán las habilidades necesarias para dominar las aguas y disfrutar
                        de una experiencia única. Ya seas un principiante o un aficionado, nuestras clases de kayak
                        ofrecen diversión y descubrimiento. Únete a nosotros y vive la emoción de remar en aguas
                        tranquilas mientras creas recuerdos inolvidables. </p>
                </div>
                <div class="text-center">
                    <button type="button" class="btn btn-info"><a href="PagPacksServlet?llenar=kayak"
                            style="text-decoration: none; color: rgb(0, 0, 0);"> ¡Reserva Ahora!</a></button>
                </div>
                <br>
            </div>
        </div>
        <div class="col-sm-6 col-md-5 p-4 ml-5 mx-auto">
            <img src="img/kayak.png" class="img-fluid" style="width: 100%;">
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