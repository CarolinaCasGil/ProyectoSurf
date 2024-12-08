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
@WebServlet(name = "AInstructor", urlPatterns = {"/AInstructor"})
public class AInstructor extends HttpServlet {

    @Inject
    IInstructorService iinstructorservice;

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

            String nombre = request.getParameter("Nombre");
            String apellido = request.getParameter("Apellido");
            String telef = request.getParameter("telef");
            String email = request.getParameter("email");
            String idActividad = request.getParameter("idActividad");

            List<Actividad> actividad = iactividadservice.listarActividades();
            Actividad acti = new Actividad();
            
            for (Actividad act : actividad) {
                if (idActividad.equals(act.getId_actividad())) {
                    acti = act;
                }
            }

            Instructor new_act  = new Instructor(apellido, email, telef, Integer.MIN_VALUE, acti);
            iinstructorservice.insertarInstructor(new_act);

            List<Instructor> instructor = iinstructorservice.listarInstructor();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("instructor", null);

            sesion.setAttribute("instructor", instructor);
            response.sendRedirect("ainstructor.jsp");

        } else if (request.getParameter("modificar") != null) {

            String id = request.getParameter("id");
            int idu = Integer.parseInt(id);
            String nombre = request.getParameter("Nombre");
            String apellido = request.getParameter("Apellido");
            String telef = request.getParameter("telef");
            String email = request.getParameter("email");
            String idActividad = request.getParameter("idActividad");
            
            List<Actividad> actividad = iactividadservice.listarActividades();
            Actividad acti = new Actividad();
            
            for (Actividad act : actividad) {
                if (idActividad.equals(act.getId_actividad())) {
                    acti = act;
                }
            }

            Instructor new_act  = new Instructor();
            new_act.setIdInstructor(idu);
            new_act.setNombre(nombre);
            new_act.setApellido(apellido);
            new_act.setTelefono(telef);
            new_act.setEmail(email);
            new_act.setIdActividad(acti);
            iinstructorservice.actualizarInstructor(new_act);

             List<Instructor> instructor = iinstructorservice.listarInstructor();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("instructor", null);

            sesion.setAttribute("instructor", instructor);
            response.sendRedirect("ainstructor.jsp");
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
