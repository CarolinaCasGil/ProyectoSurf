/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.Producto;
import com.mycompany.service.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.ws.rs.Path;

/**
 *
 * @author CAROL
 */
@WebServlet(name = "AProductos", urlPatterns = {"/AProductos"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class AProductos extends HttpServlet {

    @Inject
    IProductoService iproducto;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getParameter("insertar") != null) {

            String rutaImagen = "C:\\Users\\Carolina\\Desktop\\Surf_CAROLINA CASTILLO\\Surf\\src\\main\\webapp\\img";

            String nombre = request.getParameter("nombre");
            String cantidad = request.getParameter("cantidad");
            int cant = Integer.parseInt(cantidad);
            String costo = request.getParameter("costo");
            int cos = Integer.parseInt(costo);
            String CantComprada = request.getParameter("CantComprada");
            int cantcom = Integer.parseInt(CantComprada);
            Part foto = request.getPart("foto");
            String nombreArchivo = "img/" + foto.getSubmittedFileName();
            System.out.println(nombreArchivo);
            guardarFotoEnRuta(foto, rutaImagen);

            Producto new_pro = new Producto(nombre, cant, cos, nombreArchivo, cantcom);
            iproducto.insertarProducto(new_pro);

            List<Producto> producto = iproducto.listarProducto();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("aproducto", null);

            sesion.setAttribute("aproducto", producto);
            response.sendRedirect("aproducto.jsp");

        } else if (request.getParameter("modificar") != null) {

            String rutaImagen = "C:\\Users\\Carolina\\Desktop\\Surf_CAROLINA CASTILLO\\Surf\\src\\main\\webapp\\img";

            String idp = request.getParameter("id");
            int id = Integer.parseInt(idp);
            String nombre = request.getParameter("nombre");
            String cantidad = request.getParameter("cantidad");
            int cant = Integer.parseInt(cantidad);
            String costo = request.getParameter("costo");
            int cos = Integer.parseInt(costo);
            String CantComprada = request.getParameter("CantComprada");
            int cantcom = Integer.parseInt(CantComprada);
            Part foto = request.getPart("foto");
            String nombreArchivo = null;
            if (foto != null && foto.getSize() > 0) {
                nombreArchivo = "img/" + foto.getSubmittedFileName();
            } else {
                String foto2 = request.getParameter("foto2");
                if (foto2 != null && !foto2.isEmpty()) {
                    nombreArchivo = foto2;
                }
            }

            System.out.println(nombreArchivo);
            guardarFotoEnRuta(foto, rutaImagen);

            Producto new_pro = new Producto(nombre, cant, cos, nombreArchivo, id, cantcom);
            iproducto.actualizarProducto(new_pro);

            List<Producto> producto = iproducto.listarProducto();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("aproducto", null);

            sesion.setAttribute("aproducto", producto);
            response.sendRedirect("aproducto.jsp");
        } else if (request.getParameter("eliminar") != null) {

            String idp = request.getParameter("id");
            int id = Integer.parseInt(idp);

            iproducto.eliminarProducto(id);

            List<Producto> producto = iproducto.listarProducto();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("aproducto", null);

            sesion.setAttribute("aproducto", producto);
            response.sendRedirect("aproducto.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void guardarFotoEnRuta(Part fotoPart, String rutaImagen) throws IOException {
        if (fotoPart != null && fotoPart.getSize() > 0) {

            // Construir la ruta completa del archivo
            String filePath = rutaImagen + File.separator + fotoPart.getSubmittedFileName();

            // Guardar la foto en la carpeta de img
            try (InputStream is = fotoPart.getInputStream()) {
                Files.copy(is, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
            }
        }
    }

}
