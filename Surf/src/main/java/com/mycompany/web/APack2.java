/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.Actividad;
import com.mycompany.dominio.Pack;
import com.mycompany.service.IActividadService;
import com.mycompany.service.IPackService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
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
@WebServlet(name = "APack2", urlPatterns = {"/APack2"})
public class APack2 extends HttpServlet {

     @Inject
    IActividadService iactividadservice;

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

            System.out.println("entra");
            String cantidad = request.getParameter("cant_act");
            int cant = Integer.parseInt(cantidad);
            String costo = request.getParameter("costo");
            int cos = Integer.parseInt(costo);
            String titulo = request.getParameter("titulo");
            String descripcion = request.getParameter("descripcion");
            String CantComprada = request.getParameter("cant_comp");
            int cantcom = Integer.parseInt(CantComprada);
            Part foto = request.getPart("Foto");
            String nombreArchivo = "img/" + foto.getSubmittedFileName();
            String idact = request.getParameter("idActividad");
            int ida = Integer.parseInt(idact);

            List<Actividad> act = iactividadservice.listarActividades();
            Actividad idacti = null;

            for (Actividad actividad : act) {
                if (actividad.getIdActividad().equals(ida)) {
                    idacti = actividad;
                }
            }

            Pack insertar = new Pack(cantcom, cos, titulo, descripcion, nombreArchivo, cantcom, idacti);
            ipackservice.insertarPack(insertar);

            List<Pack> pac = ipackservice.listarPack();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("apack", null);

            sesion.setAttribute("apack", pac);
            response.sendRedirect("apack.jsp");

        } else if (request.getParameter("modificar") != null) {

            String id1 = request.getParameter("id");
            int id = Integer.parseInt(id1);
            String cantidad = request.getParameter("cant_act");
            int cant = Integer.parseInt(cantidad);
            String costo = request.getParameter("costo");
            int cos = Integer.parseInt(costo);
            String titulo = request.getParameter("titulo");
            String descripcion = request.getParameter("descripcion");
            String CantComprada = request.getParameter("cant_comp");
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
            String idact = request.getParameter("idActividad");
            int ida = Integer.parseInt(idact);

            List<Actividad> act = iactividadservice.listarActividades();
            Actividad idacti = null;

            for (Actividad actividad : act) {
                if (actividad.getIdActividad().equals(ida)) {
                    idacti = actividad;
                }
            }

            Pack insertar = new Pack(cantcom, cos, titulo, descripcion, nombreArchivo, id, cantcom, idacti);
            ipackservice.actualizarPack(insertar);

            List<Pack> pac = ipackservice.listarPack();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("apack", null);

            sesion.setAttribute("apack", pac);
            response.sendRedirect("apack.jsp");

        } else if (request.getParameter("eliminar") != null) {
            
            String id1 = request.getParameter("id");
            int id = Integer.parseInt(id1);

            ipackservice.eliminarPack(id);

            List<Pack> pac = ipackservice.listarPack();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("apack", null);

            sesion.setAttribute("apack", pac);
            response.sendRedirect("apack.jsp");
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

}
