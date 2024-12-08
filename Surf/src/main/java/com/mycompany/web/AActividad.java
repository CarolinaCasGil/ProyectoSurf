/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.*;
import com.mycompany.service.*;
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

/**
 *
 * @author CAROL
 */
@WebServlet(name = "AActividad", urlPatterns = {"/AActividad"})
public class AActividad extends HttpServlet {

    @Inject
    IActividadService iactividadservice;

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

            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String capacidad = request.getParameter("capacidad");
            int cap = Integer.parseInt(capacidad);
            String costo = request.getParameter("costo");
            int cos = Integer.parseInt(costo);

            Actividad new_act = new Actividad(nombre, descripcion, cap, cos);
            iactividadservice.insertarActividad(new_act);

            List<Actividad> act = iactividadservice.listarActividades();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("actividad", null);

            sesion.setAttribute("actividad", act);
            response.sendRedirect("aactividades.jsp");

        } else if (request.getParameter("modificar") != null) {

            String id = request.getParameter("id");
            int idu = Integer.parseInt(id);
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String capacidad = request.getParameter("capacidad");
            int cap = Integer.parseInt(capacidad);
            String costo = request.getParameter("costo");
            int cos = Integer.parseInt(costo);

            Actividad new_act = new Actividad();
            new_act.setIdActividad(idu);
            new_act.setNombre(nombre);
            new_act.setDescripcion(descripcion);
            new_act.setCapacidad(cap);
            new_act.setCosto(cos);
            System.out.println(new_act);
            iactividadservice.actualizarActividad(new_act);

            List<Actividad> act = iactividadservice.listarActividades();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("actividad", null);

            sesion.setAttribute("actividad", act);
            response.sendRedirect("aactividades.jsp");
        } else if (request.getParameter("eliminar") != null) {

            String id = request.getParameter("id");
            int idu = Integer.parseInt(id);
            iactividadservice.eliminarActividad(idu);

            List<Actividad> act = iactividadservice.listarActividades();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("actividad", null);

            sesion.setAttribute("actividad", act);
            response.sendRedirect("aactividades.jsp");
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
