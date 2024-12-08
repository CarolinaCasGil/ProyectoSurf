
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.mycompany.dominio.*"%>
<%@ page import="java.util.Random" %>
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
        <link rel="stylesheet" href="css/css_pago_tarjeta2.css">
        <link rel="stylesheet" href="css/css_pago.css">
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
            List<Pack> pro = (List<Pack>) sesion.getAttribute("packs");
            List<Alojamiento> alo = (List<Alojamiento>) sesion.getAttribute("alojamiento");
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
                                        <p class="card-text text-center mb-0"><%= producto.getCosto()%>?</p>
                                        <div class="container mx-auto d-flex justify-content-end mt-3" style="background-color: rgb(0,0,0,0); box-shadow: none;">

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
        <!-- ########################################## CARRUSEL ######################################################## -->
        <div id="carouselExample" class="carousel slide col-md-11 mx-auto">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/fotoindex.png" class="d-block w-100">
                </div>
                <div class="carousel-item">
                    <img src="img/fotoindex2.png" class="d-block w-100">
                </div>
                <div class="carousel-item">
                    <img src="img/fotoindex3.png" class="d-block w-100">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>




        <br>
        <!-- ########################################## INTRODUCCCION ######################################################## -->
        <div class="row col-md-11 mx-auto">

            <div class="col-sm-6 col-md-5 p-4 ml-5 mx-auto">
                <img src="img/ftintroduccion.png" class="img-fluid" style="width: 100%;">
            </div>

            <div class="col-sm-6 col-md-6 p-4 ml-5 mx-auto my-auto">
                <div class="card" style="width: 100%; background-color: rgba(255, 255, 255, 0.767);">
                    <div class="card-body">
                        <h5 class="card-title display-4 fw-bold text-center mb-">�Bienvenido al Surfcamp BLUE WAVES!</h5>
                        <p class="card-text">En nuestro surfcamp, te sumergir�s en una experiencia �nica que combina la
                            emoci�n del surf con la serenidad de la naturaleza. En Blue Waves, no solo ofrecemos lecciones
                            de surf de alta calidad para todos los niveles, sino que tambi�n creamos un ambiente relajado y
                            amigable donde los amantes del surf, tanto novatos como experimentados, pueden conectarse y
                            compartir su pasi�n por las olas.</p>
                    </div>
                </div>
            </div>

        </div>



        <br><br>

        <!-- ################################### OFERTAS ################################### -->
        <div class="row col-11 mx-auto p-4 px-auto"
             style="background-color: rgba(255, 255, 255, 0.651); margin-bottom: 5px; border-radius: 5px;">
            <h2 class="text-center mt-4 mb-4">
                <span class="display-4 fw-bold" style="color: #000000;">OFERTAS</span>
            </h2>

            <% Random rand = new Random();
                int packCount = pro.size();
                Set<Integer> randomIndices = new HashSet<Integer>();
                while (randomIndices.size() < 4 && packCount >= 4) {
                    randomIndices.add(rand.nextInt(packCount));
                }

                int i = 0; // Variable para contar los modales
                for (int index : randomIndices) {
                    Pack pack = pro.get(index);
            %>
            <div class="card mx-auto col-md-2 col-12" style="width: 350px; margin-bottom: 25px;">
                <div style="margin-top: 10px;">
                    <img src="<%= pack.getFoto()%>" class="card-img-top">
                </div>
                <div class="card-body">
                    <h5 class="fw-bold text-center"><%= pack.getTitulo()%></h5>
                    <p class="card-text"><%= pack.getDescripcion()%></p>
                    <div class="text-center">
                        <% if (sesion.getAttribute("nom_usuario") == null && sesion.getAttribute("clave") == null) { %>
                        <button type="button" class="btn btn-info"><a href="loggin.jsp" style="text-decoration: none; color: black;">�Reserva Ahora!</a></button>
                        <% } else {%>
                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#exampleModal<%= i%>">�Reserva Ahora!</button>
                        <% }%>
                    </div>
                </div>
            </div>

            <!-- Modal correspondiente -->
            <div class="modal fade" id="exampleModal<%= i%>" tabindex="-1" aria-labelledby="exampleModalLabel<%= i%>" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel<%= i%>">Confirmar Pago</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <section class="container">
                                <header>DATOS DE COMPRA</header>
                                <form class="form" action="/Surf/PagoPack" method="post">
                                    <div class="column">
                                        <div class="input-box">
                                            <label>Informacion usuario</label>
                                        </div>
                                    </div>
                                    <div class="column">
                                        <div class="input-box">
                                            <input required="" placeholder="Nombre" type="text" value="<%= sesion.getAttribute("nombre")%>">
                                        </div>
                                        <div class="input-box">
                                            <input required="" placeholder="Apellido" type="text" value="<%= sesion.getAttribute("apellido")%>">
                                        </div>
                                    </div>
                                    <div class="column">
                                        <div class="input-box">
                                            <label>Tarjeta</label>
                                            <input required="" placeholder="Numero de la tarjeta" type="number">
                                        </div>
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
                                            <label>Fecha de inicio</label>
                                            <input placeholder="Fecha de expiracion" type="date" name="fechainicio">
                                        </div>
                                    </div>
                                    <input type="hidden" name="id" value="<%= pack.getIdPack()%>">
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
            <%
                    i++;
                }
            %>
        </div>



        <br><br>

        <!-- ################################### ALOJAMIENTOS ################################### -->
        <div class="row col-11 mx-auto px-auto"
             style="background-color: rgba(255, 255, 255, 0.651); margin-bottom: 5px; border-radius: 5px;">
            <h2 class="text-center mt-4 mb-4">
                <span class="display-4 fw-bold" style="color: #000000;">ALOJAMIENTOS</span>
            </h2>

            <%
                rand = new Random();
                int alojamientoCount = alo.size();
                randomIndices = new HashSet<Integer>();
                while (randomIndices.size() < 3 && alojamientoCount >= 2) {
                    randomIndices.add(rand.nextInt(alojamientoCount));
                }
                for (int index : randomIndices) {
                    Alojamiento alojamiento = alo.get(index);
            %>
            <div class="card mx-auto col-md-3 col-12" style="width: 480px; margin-bottom: 25px;">
                <div style="margin-top: 10px;">
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="<%= alojamiento.getFoto1()%>" class="d-block w-100" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img src="<%= alojamiento.getFoto2()%>" class="d-block w-100" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img src="<%= alojamiento.getFoto3()%>" class="d-block w-100" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img src="<%= alojamiento.getFoto4()%>" class="d-block w-100" alt="Second slide">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <h5 class="fw-bold text-center" style="font-size: 35px;"><%= alojamiento.getNombre()%></h5>
                    <p class="card-text" style="margin-top: 15px;"><%= alojamiento.getDescripcion()%></p>
                    <div class="text-center">
                        <button type="button" class="btn btn-info"
                                onclick="<%
                                    String lugar = alojamiento.getLugar();
                                    if (lugar.equals("GALICIA")) {
                                        out.print("window.location.href='alojamiento.jsp'");
                                    } else if (lugar.equals("ASTURIAS")) {
                                        out.print("window.location.href='alojamiento2.jsp'");
                                    } else if (lugar.equals("CANTABRIA") || lugar.equals("PAIS VASCO")) {
                                        out.print("window.location.href='alojamiento3.jsp'");
                                    }
                                %>">
                            �Reserva Ahora!
                        </button>
                    </div>
                </div>
            </div>
            <% }%>
        </div>




    </div>
    <br><br><br>

    <br><br><br>
    <!-- ################################### FOOTER ################################### -->
    <%@ include file='Componentes/footer.jsp' %>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>
</body>

</html>