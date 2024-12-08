<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.dominio.*"%>
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

            .chart-container {
                width: 100%;
                max-width: 1200px;
                margin: auto;
                background-color: rgba(255, 255, 255, 0.7);
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
                background-color: rgba(255, 255, 255, 0.4) !important;
                border-color: transparent !important; 
            }

            .nav-link-white-text {
                color: #fff !important;
            }
        </style>
    </script>

</head>

<body>

    <!-- ########################################## MENU ######################################################## -->
    <%
        HttpSession sesion = request.getSession();
        List<Usuario> ausuario = (List<Usuario>) sesion.getAttribute("ausuario");
        List<UsuarioProducto> upro = (List<UsuarioProducto>) sesion.getAttribute("aupro");
        List<UsuarioPack> upac = (List<UsuarioPack>) sesion.getAttribute("aupac");
        List<UsuarioAlojamiento> ualoj = (List<UsuarioAlojamiento>) sesion.getAttribute("aualoj");
        List<Alojamiento> ialoja = (List<Alojamiento>) sesion.getAttribute("aalojamiento");
        List<Pack> ipack = (List<Pack>) sesion.getAttribute("apacks");
        List<Producto> producto = (List<Producto>) sesion.getAttribute("aproducto");
        List<Actividad> act = (List<Actividad>) sesion.getAttribute("aactividades");
        String nom = "root";
        String clave = "1234";
    %>
    <%@ include file='Componentes/navbar3.jsp' %>

    <br>

    <div class="container">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active nav-link-white-text" id="tab1-tab" data-bs-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">PRODUCTOS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-link-white-text" id="tab2-tab" data-bs-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">PACK</a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-link-white-text" id="tab3-tab" data-bs-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false">ALOJAMIENTOS</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab1-tab">
                <!-- Contenido de la Tabla 1 -->
                <div class="container mt-3">
                    <!-- Nav tabs for nested tabs -->
                    <ul class="nav nav-tabs" id="nestedTab1" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active nav-link-white-text" id="nested-tab1a-tab" data-bs-toggle="tab" href="#nested-tab1a" role="tab" aria-controls="nested-tab1a" aria-selected="true">TOTAL PRODUCTOS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-white-text" id="nested-tab1b-tab" data-bs-toggle="tab" href="#nested-tab1b" role="tab" aria-controls="nested-tab1b" aria-selected="false">TOTAL POR USUARIO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-white-text" id="nested-tab1c-tab" data-bs-toggle="tab" href="#nested-tab1c" role="tab" aria-controls="nested-tab1c" aria-selected="false">TOTAL POR MES </a>
                        </li>
                    </ul>
                    <!-- Nested Tab panes -->
                    <div class="tab-content" id="nestedTab1Content">
                        <div class="tab-pane fade show active" id="nested-tab1a" role="tabpanel" aria-labelledby="nested-tab1a-tab">
                            <!-- Contenido de la Sub-Tabla 1A -->
                            <div class="container mt-5">
                                <div class="row">
                                    <div class="col-12 chart-container">
                                        <canvas id="myChart" width="400" height="200"></canvas>
                                    </div>
                                </div>
                            </div>

                            <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                const productos = [
                                <% for (Producto prod : producto) {%>
                                {
                                nombre: '<%= prod.getNombre()%>',
                                        cantidad: <%= prod.getCantComprada()%>
                                },
                                <% }%>
                                ];
                                        const nombres = productos.map(prod => prod.nombre);
                                        const cantidades = productos.map(prod => prod.cantidad);
                                        // Configurar el gráfico
                                        const ctx = document.getElementById('myChart').getContext('2d');
                                        const myChart = new Chart(ctx, {
                                        type: 'bar',
                                                data: {
                                                labels: nombres,
                                                        datasets: [{
                                                        label: 'Cantidad Comprada',
                                                                data: cantidades,
                                                                backgroundColor: 'rgba(16, 102, 218, 0.7)',
                                                                borderColor: 'rgba(16, 102, 218, 1)',
                                                                borderWidth: 1
                                                        }]
                                                },
                                                options: {
                                                scales: {
                                                y: {
                                                beginAtZero: true
                                                }
                                                }
                                                }
                                        });
                                });
                            </script>
                        </div>
                        <div class="tab-pane fade" id="nested-tab1b" role="tabpanel" aria-labelledby="nested-tab1b-tab">
                            <!-- Contenido de la Sub-Tabla 1B -->
                            <%
                                Map<String, Integer> cantidadesPorUsuario = new HashMap<String, Integer>();

                                if (upro != null) {
                                    for (UsuarioProducto usuarioProducto : upro) {
                                        Usuario usuario = usuarioProducto.getIdUsuario(); // Asumiendo que getUsuario() devuelve el objeto Usuario o null
                                        String usuarioNombre;
                                        if (usuario != null) {
                                            usuarioNombre = usuario.getNombre(); // Asumiendo que Usuario tiene un método getNombre()
                                        } else {
                                            usuarioNombre = "Null";
                                        }
                                        int cantComprada = usuarioProducto.getCantidad();
                                        if (cantidadesPorUsuario.containsKey(usuarioNombre)) {
                                            int cantidadActual = cantidadesPorUsuario.get(usuarioNombre);
                                            cantidadesPorUsuario.put(usuarioNombre, cantidadActual + cantComprada);
                                        } else {
                                            cantidadesPorUsuario.put(usuarioNombre, cantComprada);
                                        }
                                    }
                                }
                            %>

                            <div class="container mt-5">
                                <div class="row">
                                    <div class="chart-container" style="max-width: 700px;">
                                        <canvas id="graficoCircular"></canvas>
                                    </div>
                                </div>
                            </div>

                            <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                        var ctx = document.getElementById('graficoCircular').getContext('2d');
                                                // Obtener etiquetas y datos desde el JSP
                                                var labels = [<% for (String usuarioNombre : cantidadesPorUsuario.keySet()) {%>
                                                '<%= usuarioNombre%>',
                                <% } %>
                                                ];
                                                var data = [<% for (Integer cantidad : cantidadesPorUsuario.values()) {%>
                                <%= cantidad%>,
                                <% }%>
                                                ];
                                                // Mostrar etiquetas y datos en la consola para depuración
                                                console.log("Etiquetas: ", labels);
                                                console.log("Datos: ", data);
                                                // Crear el gráfico
                                                var myChart = new Chart(ctx, {
                                                type: 'doughnut',
                                                        data: {
                                                        labels: labels,
                                                                datasets: [{
                                                                label: 'Cantidad de productos por usuario',
                                                                        data: data,
                                                                        backgroundColor: [
                                                                                'rgba(255, 99, 132, 0.6)',
                                                                                'rgba(54, 162, 235, 0.6)',
                                                                                'rgba(255, 206, 86, 0.6)',
                                                                                'rgba(75, 192, 192, 0.6)',
                                                                                'rgba(153, 102, 255, 0.6)',
                                                                                'rgba(255, 159, 64, 0.6)'
                                                                        ],
                                                                        borderColor: [
                                                                                'rgba(255, 99, 132, 1)',
                                                                                'rgba(54, 162, 235, 1)',
                                                                                'rgba(255, 206, 86, 1)',
                                                                                'rgba(75, 192, 192, 1)',
                                                                                'rgba(153, 102, 255, 1)',
                                                                                'rgba(255, 159, 64, 1)'
                                                                        ],
                                                                        borderWidth: 1
                                                                }]
                                                        },
                                                        options: {
                                                        responsive: true,
                                                                plugins: {
                                                                legend: {
                                                                position: 'top',
                                                                },
                                                                        tooltip: {
                                                                        callbacks: {
                                                                        label: function (tooltipItem) {
                                                                        return tooltipItem.label + ': ' + tooltipItem.raw.toFixed(0);
                                                                        }
                                                                        }
                                                                        }
                                                                }
                                                        }
                                                });
                                        });
                            </script>

                        </div>
                        <div class="tab-pane fade" id="nested-tab1c" role="tabpanel" aria-labelledby="nested-tab1c-tab">
                            <!-- Contenido de la Sub-Tabla 1C -->
                            <br>
                            <br>
                            <% Map<String, Integer> comprasPorMes = new HashMap<String, Integer>();
                                if (upro != null) {
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    for (UsuarioProducto usuarioProducto : upro) {
                                        Date fecha = usuarioProducto.getFechaPedido(); // Obtener la fecha

                                        // Obtener el mes y año
                                        Calendar cal = Calendar.getInstance();
                                        cal.setTime(fecha);
                                        int year = cal.get(Calendar.YEAR);
                                        int month = cal.get(Calendar.MONTH) + 1; // El mes es base 0, sumar 1 para obtener el mes real
                                        String mesAnio = year + "-" + String.format("%02d", month); // Formato "yyyy-MM"

                                        // Sumar la cantidad comprada al mes correspondiente en el mapa
                                        int cantidad = usuarioProducto.getCantidad();
                                        if (comprasPorMes.containsKey(mesAnio)) {
                                            int total = comprasPorMes.get(mesAnio);
                                            comprasPorMes.put(mesAnio, total + cantidad);
                                        } else {
                                            comprasPorMes.put(mesAnio, cantidad);
                                        }
                                    }
                                }%>


                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-8 mx-auto">
                                        <div class="chart-container" style="width: 900px;">
                                            <canvas id="graficoLineal"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                        var ctx = document.getElementById('graficoLineal').getContext('2d');
                                                // Obtener datos del JSP
                                                var meses = [<% for (String mes : comprasPorMes.keySet()) {%>
                                                '<%= mes%>',
                                <% } %>
                                                ];
                                                var cantidades = [<% for (Integer cantidad : comprasPorMes.values()) {%>
                                <%= cantidad%>,
                                <% }%>
                                                ];
                                                // Crear el gráfico
                                                var myChart = new Chart(ctx, {
                                                type: 'line',
                                                        data: {
                                                        labels: meses,
                                                                datasets: [{
                                                                label: 'Compras por Mes',
                                                                        data: cantidades,
                                                                        fill: false,
                                                                        borderColor: 'rgba(255, 99, 132, 1)',
                                                                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                                                        tension: 0.1
                                                                }]
                                                        },
                                                        options: {
                                                        scales: {
                                                        y: {
                                                        beginAtZero: true
                                                        }
                                                        }
                                                        }
                                                });
                                        });
                            </script>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab2-tab">
                <!-- Contenido de la Tabla 2 -->
                <div class="container mt-3">
                    <!-- Nav tabs for nested tabs -->
                    <ul class="nav nav-tabs" id="nestedTab2" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active nav-link-white-text" id="nested-tab2a-tab" data-bs-toggle="tab" href="#nested-tab2a" role="tab" aria-controls="nested-tab2a" aria-selected="true">TOTAL COMPRA PACK</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-white-text" id="nested-tab2b-tab" data-bs-toggle="tab" href="#nested-tab2b" role="tab" aria-controls="nested-tab2b" aria-selected="false">TOTAL POR ACTIVIDAD</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-white-text" id="nested-tab2c-tab" data-bs-toggle="tab" href="#nested-tab2c" role="tab" aria-controls="nested-tab2c" aria-selected="false">TOTAL COMPRA MES</a>
                        </li>
                    </ul>
                    <!-- Nested Tab panes -->
                    <div class="tab-content" id="nestedTab2Content">
                        <div class="tab-pane fade show active" id="nested-tab2a" role="tabpanel" aria-labelledby="nested-tab2a-tab">
                            <!-- Contenido de la Sub-Tabla 2A -->
                            <br>
                            <br>
                            <%
                                StringBuilder nombresPacks = new StringBuilder("[");
                                StringBuilder cantidades = new StringBuilder("[");

                                for (Pack pack : ipack) {
                                    nombresPacks.append("'" + pack.getTitulo() + "',");
                                    cantidades.append(pack.getCantComprada() + ",");
                                }

                                if (!ipack.isEmpty()) {
                                    nombresPacks.setCharAt(nombresPacks.length() - 1, ']');
                                    cantidades.setCharAt(cantidades.length() - 1, ']');
                                } else {
                                    nombresPacks.append("]");
                                    cantidades.append("]");
                                }
                            %>

                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-8 mx-auto">
                                        <div class="chart-container" style="width: 1200px; margin-left: -180px;">
                                            <canvas id="graficoPacks"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                        var ctx = document.getElementById('graficoPacks').getContext('2d');
                                                // Datos del JSP
                                                var nombresPacks = <%= nombresPacks%>;
                                                var cantidades = <%= cantidades%>;
                                                // Crear el gráfico
                                                var myChart = new Chart(ctx, {
                                                type: 'bar',
                                                        data: {
                                                        labels: nombresPacks,
                                                                datasets: [{
                                                                label: 'Cantidad Comprada por Pack',
                                                                        data: cantidades,
                                                                        backgroundColor: 'rgba(16, 102, 218, 0.7)',
                                                                        borderColor: 'rgba(16, 102, 218, 1)',
                                                                        borderWidth: 1
                                                                }]
                                                        },
                                                        options: {
                                                        scales: {
                                                        y: {
                                                        beginAtZero: true
                                                        }
                                                        }
                                                        }
                                                });
                                        });
                            </script>
                        </div>
                        <div class="tab-pane fade" id="nested-tab2b" role="tabpanel" aria-labelledby="nested-tab2b-tab">
                            <!-- Contenido de la Sub-Tabla 2B -->
                            <%
                                Map<Integer, String> actividadNombres = new HashMap<Integer, String>();
                                actividadNombres.put(1, "SURF");
                                actividadNombres.put(2, "PADDLE SURF");
                                actividadNombres.put(3, "YOGA");
                                actividadNombres.put(4, "KAYAK");

                                Map<Integer, Integer> sumCantCompradaPorActividad = new HashMap<Integer, Integer>();

                                for (Pack pack : ipack) {
                                    int idActividad = pack.getIdActividad().getIdActividad();
                                    int cantComprada = pack.getCantComprada();

                                    if (sumCantCompradaPorActividad.containsKey(idActividad)) {
                                        int sumaActual = sumCantCompradaPorActividad.get(idActividad);
                                        sumCantCompradaPorActividad.put(idActividad, sumaActual + cantComprada);
                                    } else {
                                        sumCantCompradaPorActividad.put(idActividad, cantComprada);
                                    }
                                }

                                StringBuilder idsActividades = new StringBuilder("[");
                                cantidades = new StringBuilder("[");

                                for (Map.Entry<Integer, Integer> entry : sumCantCompradaPorActividad.entrySet()) {
                                    String nombreActividad = actividadNombres.get(entry.getKey());
                                    idsActividades.append("'" + nombreActividad + "',");
                                    cantidades.append(entry.getValue() + ",");
                                }

                                if (!ipack.isEmpty()) {
                                    idsActividades.setCharAt(idsActividades.length() - 1, ']');
                                    cantidades.setCharAt(cantidades.length() - 1, ']');
                                } else {
                                    idsActividades.append("]");
                                    cantidades.append("]");
                                }
                            %>

                            <br>
                            <br>
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-8 mx-auto">
                                        <div class="chart-container" style="max-width: 700px;">
                                            <canvas id="graficoActividades"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                        var ctx = document.getElementById('graficoActividades').getContext('2d');
                                                // Datos del JSP
                                                var idsActividades = <%= idsActividades%>;
                                                var cantidades = <%= cantidades%>;
                                                // Crear el gráfico de tipo donut
                                                var myChart = new Chart(ctx, {
                                                type: 'doughnut',
                                                        data: {
                                                        labels: idsActividades,
                                                                datasets: [{
                                                                label: 'Cantidad Comprada por Actividad',
                                                                        data: cantidades,
                                                                        backgroundColor: [
                                                                                'rgba(255, 99, 132, 0.6)',
                                                                                'rgba(54, 162, 235, 0.6)',
                                                                                'rgba(255, 206, 86, 0.6)',
                                                                                'rgba(75, 192, 192, 0.6)',
                                                                        ],
                                                                        borderWidth: 0
                                                                }]
                                                        },
                                                        options: {
                                                        plugins: {
                                                        legend: {
                                                        display: true,
                                                                position: 'top',
                                                        }
                                                        }
                                                        }
                                                });
                                        });
                            </script>
                        </div>
                        <div class="tab-pane fade" id="nested-tab2c" role="tabpanel" aria-labelledby="nested-tab2c-tab">
                            <!-- Contenido de la Sub-Tabla 2C -->
                            <br>
                            <br>
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-8 mx-auto">
                                        <div class="chart-container" style="width: 900px;">
                                            <canvas id="graficoUsuariosPack"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                        var ctx = document.getElementById('graficoUsuariosPack').getContext('2d');
                                                // Datos del JSP
                                                var meses = [<%
                                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
                                                    Map<String, Integer> cantidadPorMes = new HashMap<String, Integer>();
                                                    if (upro != null) {
                                                        for (UsuarioPack usuarioPack : upac) {
                                                            Date fecha = usuarioPack.getFechaInicio(); // Obtener la fecha del UsuarioPack

                                                            // Obtener el mes y año
                                                            Calendar cal = Calendar.getInstance();
                                                            cal.setTime(fecha);
                                                            String mesAnio = sdf.format(fecha); // Formato "yyyy-MM"

                                                            // Incrementar la cantidad de UsuarioPack para ese mes
                                                            if (cantidadPorMes.containsKey(mesAnio)) {
                                                                cantidadPorMes.put(mesAnio, cantidadPorMes.get(mesAnio) + 1);
                                                            } else {
                                                                cantidadPorMes.put(mesAnio, 1);
                                                            }
                                                        }
                                                    }

                                                    for (Map.Entry<String, Integer> entry : cantidadPorMes.entrySet()) {
                                                        out.print("'" + entry.getKey() + "',");
                                                    }
                                %>];
                                                var cantidades = [<%
                                                    for (Map.Entry<String, Integer> entry : cantidadPorMes.entrySet()) {
                                                        out.print(entry.getValue() + ",");
                                                    }
                                %>];
                                                // Crear el gráfico
                                                var myChart = new Chart(ctx, {
                                                type: 'line', // Cambiar 'bar' a 'line' para gráfico de líneas
                                                        data: {
                                                        labels: meses,
                                                                datasets: [{
                                                                label: 'Cantidad de UsuarioPack por Mes',
                                                                        data: cantidades,
                                                                        fill: false, // Cambiar a true si deseas un gráfico de área
                                                                        borderColor: 'rgba(255, 99, 132, 1)',
                                                                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                                                        tension: 0.1,
                                                                        borderWidth: 2
                                                                }]
                                                        },
                                                        options: {
                                                        scales: {
                                                        y: {
                                                        beginAtZero: true
                                                        }
                                                        }
                                                        }
                                                });
                                        });
                            </script>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab3-tab">
                <!-- Contenido de la Tabla 3 -->
                <div class="container mt-3">
                    <!-- Nav tabs for nested tabs -->
                    <ul class="nav nav-tabs" id="nestedTab3" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active nav-link-white-text" id="nested-tab3a-tab" data-bs-toggle="tab" href="#nested-tab3a" role="tab" aria-controls="nested-tab3a" aria-selected="true">TOTAL ALOJAMIENTOS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-white-text" id="nested-tab3b-tab" data-bs-toggle="tab" href="#nested-tab3b" role="tab" aria-controls="nested-tab3b" aria-selected="false">TOTAL LUGAR</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-white-text" id="nested-tab3c-tab" data-bs-toggle="tab" href="#nested-tab3c" role="tab" aria-controls="nested-tab3c" aria-selected="false">TOTAL POR MES</a>
                        </li>
                    </ul>
                    <!-- Nested Tab panes -->
                    <div class="tab-content" id="nestedTab3Content">
                        <div class="tab-pane fade show active" id="nested-tab3a" role="tabpanel" aria-labelledby="nested-tab3a-tab">
                            <!-- Contenido de la Sub-Tabla 3A -->
                            <div class="container mt-5">
                                <div class="row">
                                    <div class="chart-container">
                                        <canvas id="alojamientosChart"></canvas>
                                    </div>
                                </div>
                            </div>


                            <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                        const alojamientos = [
                                <% for (Alojamiento alojamiento : ialoja) {%>
                                        {
                                        nombre: '<%= alojamiento.getNombre()%>',
                                                cantidad: <%= alojamiento.getCantComprada()%>
                                        },
                                <% }%>
                                        ];
                                                const nombres = alojamientos.map(a => a.nombre);
                                                const cantidades = alojamientos.map(a => a.cantidad);
                                                // Configurar el gráfico
                                                const ctx = document.getElementById('alojamientosChart').getContext('2d');
                                                const alojamientosChart = new Chart(ctx, {
                                                type: 'bar',
                                                        data: {
                                                        labels: nombres,
                                                                datasets: [{
                                                                label: 'Cantidad Comprada',
                                                                        data: cantidades,
                                                                        backgroundColor: 'rgba(16, 102, 218, 0.7)',
                                                                        borderColor: 'rgba(16, 102, 218, 1)',
                                                                        borderWidth: 1
                                                                }]
                                                        },
                                                        options: {
                                                        scales: {
                                                        y: {
                                                        beginAtZero: true
                                                        }
                                                        }
                                                        }
                                                });
                                        });
                            </script>

                        </div>
                        <div class="tab-pane fade" id="nested-tab3b" role="tabpanel" aria-labelledby="nested-tab3b-tab">
                            <!-- Contenido de la Sub-Tabla 3B -->
                            <br>
                            <br>
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-8 mx-auto">
                                        <div class="chart-container" style="width: 700px;">
                                            <canvas id="graficoLugares"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                    var ctx = document.getElementById('graficoLugares').getContext('2d');

                                    // Obtener los datos desde el servidor (JSP)
                                    var lugares = [<%
                                        Map<String, Integer> cantidadesPorLugar = new HashMap<String, Integer>();
                                        if (ialoja != null) {
                                            for (Alojamiento alojamiento : ialoja) {
                                                String lugar = alojamiento.getLugar();
                                                int cantComprada = alojamiento.getCantComprada();
                                                if (cantidadesPorLugar.containsKey(lugar)) {
                                                    int cantidadActual = cantidadesPorLugar.get(lugar);
                                                    cantidadesPorLugar.put(lugar, cantidadActual + cantComprada);
                                                } else {
                                                    cantidadesPorLugar.put(lugar, cantComprada);
                                                }
                                            }
                                        }

                                        for (Map.Entry<String, Integer> entry : cantidadesPorLugar.entrySet()) {
                                            out.print("'" + entry.getKey() + "',");
                                        }
                                %>];
                                    var cantidades = [<%
                                        for (Map.Entry<String, Integer> entry : cantidadesPorLugar.entrySet()) {
                                            out.print(entry.getValue() + ",");
                                        }
                                %>];

                                    // Crear el gráfico circular
                                    var myChart = new Chart(ctx, {
                                        type: 'doughnut',
                                        data: {
                                            labels: lugares,
                                            datasets: [{
                                                    label: 'Cantidad de productos comprados por lugar',
                                                    data: cantidades,
                                                    backgroundColor: [
                                                        'rgba(255, 99, 132, 0.6)',
                                                        'rgba(54, 162, 235, 0.6)',
                                                        'rgba(255, 206, 86, 0.6)',
                                                        'rgba(75, 192, 192, 0.6)',
                                                    ],
                                                    borderColor: [
                                                        'rgba(255, 99, 132, 1)',
                                                        'rgba(54, 162, 235, 1)',
                                                        'rgba(255, 206, 86, 1)',
                                                        'rgba(75, 192, 192, 1)',
                                                    ],
                                                    borderWidth: 1
                                                }]
                                        },
                                        options: {
                                            responsive: true,
                                            plugins: {
                                                legend: {
                                                    position: 'top',
                                                }
                                            }
                                        }
                                    });
                                });
                            </script>
                        </div>
                        <div class="tab-pane fade" id="nested-tab3c" role="tabpanel" aria-labelledby="nested-tab3c-tab">
                            <!-- Contenido de la Sub-Tabla 3C -->
                            <br>
                            <br>
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-8 mx-auto">
                                        <div class="chart-container" style="width: 900px;"> 
                                            <canvas id="graficoUsuariosAlojamiento"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                    var ctx = document.getElementById('graficoUsuariosAlojamiento').getContext('2d');
                                    // Datos del JSP
                                    var meses = [<%
                                        sdf = new SimpleDateFormat("yyyy-MM");
                                        cantidadPorMes = new HashMap<String, Integer>();
                                        if (ualoj != null) {
                                            for (UsuarioAlojamiento usuarioAlojamiento : ualoj) {
                                                Date fecha = usuarioAlojamiento.getFechaEntrada();

                                                Calendar cal = Calendar.getInstance();
                                                cal.setTime(fecha);
                                                String mesAnio = sdf.format(fecha);

                                                if (cantidadPorMes.containsKey(mesAnio)) {
                                                    cantidadPorMes.put(mesAnio, cantidadPorMes.get(mesAnio) + 1);
                                                } else {
                                                    cantidadPorMes.put(mesAnio, 1);
                                                }
                                            }
                                        }

                                        for (Map.Entry<String, Integer> entry : cantidadPorMes.entrySet()) {
                                            out.print("'" + entry.getKey() + "',");
                                        }
                                %>];
                                    var cantidades = [<%
                                        for (Map.Entry<String, Integer> entry : cantidadPorMes.entrySet()) {
                                            out.print(entry.getValue() + ",");
                                        }
                                %>];
                                    // Crear el gráfico
                                    var myChart = new Chart(ctx, {
                                        type: 'line',
                                        data: {
                                            labels: meses,
                                            datasets: [{
                                                    label: 'Cantidad de UsuarioAlojamiento por Mes',
                                                    data: cantidades,
                                                    fill: false,
                                                    borderColor: 'rgba(255, 99, 132, 1)',
                                                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                                    tension: 0.1,
                                                    borderWidth: 2
                                                }]
                                        },
                                        options: {
                                                        scales: {
                                                        y: {
                                                        beginAtZero: true
                                                        }
                                                        }
                                                        }
                                    });
                                });
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>





    <script src="https://d3js.org/d3.v7.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>
</html> 