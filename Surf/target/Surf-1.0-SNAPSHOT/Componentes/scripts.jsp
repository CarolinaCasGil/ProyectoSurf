<%-- 
    Document   : scripts
    Created on : 03-feb-2024, 0:11:00
    Author     : CAROL
--%>

<body>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/vfs_fonts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
//        function pdf() {
//            // Obtener datos del formulario
//            var nombre = document.getElementById("nombre").value;
//            var primerApellido = document.getElementById("primerApellido").value;
//            // ...otros campos
//
//            // Configurar la estructura del documento PDF
//            var docDefinition = {
//                content: [
//                    {text: 'Factura', style: 'header'},
//                    {text: 'Nombre: ' + nombre},
//                    {text: 'Primer Apellido: ' + primerApellido},
//                            // ...otros campos
//                ],
//                styles: {
//                    header: {
//                        fontSize: 18,
//                        bold: true,
//                        margin: [0, 0, 0, 10]
//                    }
//                }
//            };
//
//            // Generar el PDF
//            pdfmake.createPdf(docDefinition).download('factura.pdf');
//        }

        function generar_pdf() {
            const jsPDF = jspdf.default;
            const doc = new jsPDF();

            // Obtener los valores del formulario
            const nombre = document.getElementById('nombre').value;
            const primerApellido = document.getElementById('primerApellido').value;
            const segundoApellido = document.getElementById('segundoApellido').value;

            // Agregar la información al documento PDF
            doc.text(`Nombre: ${nombre}`, 20, 20);
            doc.text(`Primer Apellido: ${primerApellido}`, 20, 30);
            doc.text(`Segundo Apellido: ${segundoApellido}`, 20, 40);

            // Guardar el documento
            doc.save("factura.pdf");
        }
        
        
        
        
    </script>


</body>
