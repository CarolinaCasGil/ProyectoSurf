/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.Alojamiento;
import com.mycompany.dominio.Producto;
import com.mycompany.service.IAlojamientoService;
import com.mycompany.service.IProductoService;
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
@WebServlet(name = "BuscarSevlet", urlPatterns = {"/BuscarSevlet"})
public class BuscarSevlet extends HttpServlet {

    @Inject
    IAlojamientoService ialojamientoservice;

    @Inject
    IProductoService iproductoservice;

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

        HttpSession sesion = request.getSession();

        String b = request.getParameter("Buscar");

        if (b.equalsIgnoreCase("GALICIA") || b.equalsIgnoreCase("ASTURIAS") || b.equalsIgnoreCase("CANTABRIA") || b.equalsIgnoreCase("PAIS VASCO")) {

            List<Alojamiento> alojamiento = ialojamientoservice.listarAlojamientosPorLugar(b);
            String op = "alo";
            sesion.setAttribute("op", op);
            sesion.setAttribute("balojamiento", alojamiento);
            response.sendRedirect("buscar.jsp");
        } else if (b.equalsIgnoreCase("TABLA") || b.equalsIgnoreCase("QUILLA") || b.equalsIgnoreCase("INVENTO") || b.equalsIgnoreCase("NEOPRENO")) {

            List<Producto> producto = iproductoservice.listarProductoPorNombre(b);
            String op = "pro";
            sesion.setAttribute("op", op);
            sesion.setAttribute("bproducto", producto);
            response.sendRedirect("buscar.jsp");

        } else {

            String op = "nd";
            sesion.setAttribute("op", op);
            response.sendRedirect("buscar.jsp");
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
