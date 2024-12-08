/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.*;
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

/**
 *
 * @author CAROL
 */
@WebServlet(name = "AAlojamiento", urlPatterns = {"/AAlojamiento"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class AAlojamiento extends HttpServlet {

    @Inject
    IAlojamientoService ialojamiento;

    @Inject
    IPackService ipackservice;

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
            String descripcion = request.getParameter("descripcion");
            String direccion = request.getParameter("direccion");
            String maps = request.getParameter("maps");
            String capacidad = request.getParameter("capacidad");
            int cap = Integer.parseInt(capacidad);
            if (capacidad != null && !capacidad.isEmpty()) {
                cap = Integer.parseInt(capacidad);
            }
            String costo = request.getParameter("costo");
            int cos = Integer.parseInt(costo);
            String lugar = request.getParameter("lugar");
            String CantComprada = request.getParameter("CantComprada");
            int cantcom = 0;
            if (CantComprada != null && !CantComprada.isEmpty()) {
                cantcom = Integer.parseInt(CantComprada);
            }
            Part ft1 = request.getPart("ft1");
            String nombreArchivo1 = ft1.getSubmittedFileName();
            guardarFotoEnRuta(ft1, rutaImagen);
            Part ft2 = request.getPart("ft2");
            String nombreArchivo2 = ft2.getSubmittedFileName();
            guardarFotoEnRuta(ft2, rutaImagen);
            Part ft3 = request.getPart("ft3");
            String nombreArchivo3 = ft3.getSubmittedFileName();
            guardarFotoEnRuta(ft3, rutaImagen);
            Part ft4 = request.getPart("ft4");
            String nombreArchivo4 = ft4.getSubmittedFileName();
            guardarFotoEnRuta(ft4, rutaImagen);
            String packId = request.getParameter("packId");
            int idpack = Integer.parseInt(packId);

            List<Pack> packs = ipackservice.listarPack();
            Pack idp = null;
            for (Pack pack : packs) {
                if (pack.getIdPack().equals(idpack)) {
                    idp = pack;
                }
            }

            Alojamiento new_alo = new Alojamiento(nombre, descripcion, direccion, maps, cap, cos, lugar, cantcom, "img/" + nombreArchivo1, "img/" + nombreArchivo2, "img/" + nombreArchivo3, "img/" + nombreArchivo4, idp);
            ialojamiento.insertarAlojamiento(new_alo);

            List<Alojamiento> alojamiento = ialojamiento.listarAlojamientos();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("alojamiento", null);

            sesion.setAttribute("aalojamiento", alojamiento);
            response.sendRedirect("aalojamiento.jsp");

        } else if (request.getParameter("modificar") != null) {

            String rutaImagen = "C:\\Users\\Carolina\\Desktop\\Surf_CAROLINA CASTILLO\\Surf\\src\\main\\webapp\\img";

            String idp = request.getParameter("id");
            int id = Integer.parseInt(idp);
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String direccion = request.getParameter("direccion");
            String maps = request.getParameter("maps");
            String capacidad = request.getParameter("capacidad");
            int cap = 0;
            if (capacidad != null && !capacidad.isEmpty()) {
                cap = Integer.parseInt(capacidad);
            }
            String costo = request.getParameter("costo");
            int cos = Integer.parseInt(costo);
            String lugar = request.getParameter("lugar");
            String CantComprada = request.getParameter("CantComprada");
            int cantcom = 0;
            if (CantComprada != null && !CantComprada.isEmpty()) {
                cantcom = Integer.parseInt(CantComprada);
            }
            Part ft1 = request.getPart("ft1");
            String nombreArchivo1 = null;
            if (ft1 != null && ft1.getSize() > 0) {
                nombreArchivo1 = "img/" + ft1.getSubmittedFileName();
            } else {
                String ft12 = request.getParameter("ft12");
                nombreArchivo1 = ft12;
            }
            guardarFotoEnRuta(ft1, rutaImagen);

            Part ft2 = request.getPart("ft2");
            String nombreArchivo2 = null;
            if (ft2 != null && ft2.getSize() > 0) {
                nombreArchivo2 = "img/" + ft2.getSubmittedFileName();
            } else {
                String ft22 = request.getParameter("ft22");
                nombreArchivo2 = ft22;
            }
            guardarFotoEnRuta(ft2, rutaImagen);

            Part ft3 = request.getPart("ft3");
            String nombreArchivo3 = null;
            if (ft3 != null && ft3.getSize() > 0) {
                nombreArchivo3 = "img/" + ft3.getSubmittedFileName();
            } else {
                String ft32 = request.getParameter("ft32");
                nombreArchivo3 = ft32;
            }
            guardarFotoEnRuta(ft3, rutaImagen);

            Part ft4 = request.getPart("ft4");
            String nombreArchivo4 = null;
            if (ft4 != null && ft4.getSize() > 0) {
                nombreArchivo4 = "img/" + ft4.getSubmittedFileName();
            } else {
                String ft42 = request.getParameter("ft42");
                nombreArchivo4 = ft42;
            }
            guardarFotoEnRuta(ft4, rutaImagen);

            String packId = request.getParameter("packId");
            int idpack = Integer.parseInt(packId);

            List<Pack> packs = ipackservice.listarPack();
            Pack idppr = null;
            for (Pack pack : packs) {
                if (pack.getIdPack().equals(idpack)) {
                    idppr = pack;
                }
            }

            Alojamiento new_alo = new Alojamiento(id, nombre, descripcion, direccion, maps, cap, cos, lugar, cantcom, nombreArchivo1, nombreArchivo2, nombreArchivo3, nombreArchivo4, idppr);
            ialojamiento.actualizarAlojamiento(new_alo);

            List<Alojamiento> alojamiento = ialojamiento.listarAlojamientos();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("alojamiento", null);

            sesion.setAttribute("aalojamiento", alojamiento);
            response.sendRedirect("aalojamiento.jsp");
        } else if (request.getParameter("eliminar") != null) {

            String idp = request.getParameter("id");
            int id = Integer.parseInt(idp);

            ialojamiento.eliminarAlojamiento(id);

            List<Alojamiento> alojamiento = ialojamiento.listarAlojamientos();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("alojamiento", null);

            sesion.setAttribute("aalojamiento", alojamiento);
            response.sendRedirect("aalojamiento.jsp");

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
