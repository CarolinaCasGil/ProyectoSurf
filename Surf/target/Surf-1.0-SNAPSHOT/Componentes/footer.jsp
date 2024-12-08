<%-- 
    Document   : navbar
    Created on : 25-ene-2024, 9:58:03
    Author     : CAROL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<body>


    <!-- ########################################## FOOTER ######################################################## -->
    <div class="row col-12 mx-auto mi-seccion-especial" style="background-color: rgb(58, 139, 210);">
        <footer class="main-footer me6-position-relative me6-z-index-1 me6-padding-top-xl">
            <div class="me6-container me6-max-width-lg">
                <div class="me6-grid me6-gap-y-lg me6-gap-lg@lg">
                    <div class="me6-col-3@lg me6-order-2@lg me6-text-right@lg">
                        <a class="main-footer__logo" href="#0" style="margin-top: -45px;">
                            <svg width="450" height="30" viewBox="0 0 104 30">
                                <title>Go to homepage</title>
                                <div id="carouselExample" class="carousel slide logo-text-container"
                                    data-bs-ride="carousel">
                                    <div class="carousel-inner" style="width: 50%;">
                                        <!-- Añade más elementos carousel-item para más imágenes -->
                                        <div class="carousel-item active">
                                            <img src="img/billabong.png" d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="img/quiksilver.png" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="img/vans.png" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="img/ripcurlwetsuit.png" class="d-block w-100" alt="...">
                                        </div>
                                    </div>
                                </div>
                                <circle cx="15" cy="15" r="15" fill="hsl(var(--me6-color-primary-hsl))" />
                            </svg>
                        </a>
                    </div>

                    <nav class="me6-col-9@lg me6-order-1@lg" style="margin-left: 150px;">
                        <ul class="me6-grid me6-gap-y-lg me6-gap-lg@xs">
                            <li class="me6-col-6@xs me6-col-3@md">
                                <h4 class="me6-margin-bottom-sm me6-text-base@md">Actividades</h4>
                                <ul class="me6-grid me6-gap-xs me6-text-sm@md">
                                    <li><a href="PagPacksServlet?llenar=surf" class="main-footer__link" style="color: white;">Surf</a></li>
                                    <li><a href="PagPacksServlet?llenar=paddlesurf" class="main-footer__link" style="color: white;">Paddle Sruf</a>
                                    </li>
                                    <li><a href="PagPacksServlet?llenar=yoga" class="main-footer__link" style="color: white;">Yoga</a></li>
                                    <li><a href="PagPacksServlet?llenar=kayak" class="main-footer__link" style="color: white;">Kayak</a></li>
                                </ul>
                            </li>

                            <li class="me6-col-6@xs me6-col-3@md">
                                <h4 class="me6-margin-bottom-sm me6-text-base@md">Alojamientos</h4>
                                <ul class="me6-grid me6-gap-xs me6-text-sm@md">
                                    <li><a href="alojamiento.jsp" class="main-footer__link" style="color: white;">Galicia</a></li>
                                    <li><a href="alojamiento2.jsp" class="main-footer__link" style="color: white;">Asturias</a></li>
                                    <li><a href="alojamiento3.jsp" class="main-footer__link" style="color: white;">Cantabria</a></li>
                                    <li><a href="alojamiento3.jsp" class="main-footer__link" style="color: white;">Pais Vasco</a></li>
                                </ul>
                            </li>

                        </ul>
                    </nav>
                </div>




                <div
                    class="me6-flex me6-flex-column me6-border-top me6-padding-y-xs me6-margin-top-lg me6-flex-row@md me6-justify-between@md me6-items-center@md">
                    <div class="me6-margin-bottom-sm me6-margin-bottom-0@md">
                        <div
                            class="me6-text-sm me6-text-xs@md me6-color-contrast-medium me6-flex me6-flex-wrap me6-gap-xs">
                            <span style="color: white;">&copy; BlueWaves</span>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>

</body>

