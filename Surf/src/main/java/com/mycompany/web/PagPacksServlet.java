/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.*;
import com.mycompany.service.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "PagPacksServlet", urlPatterns = {"/PagPacksServlet"})
public class PagPacksServlet extends HttpServlet {

    @Inject
    IPackService ipackservice;

    @Inject
    IProductoService iproductoservice;

    @Inject
    ICarritoService icarritoservice;

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession sesion = request.getSession();
            List<Pack> packs = ipackservice.listarPack();

            List<Producto> productos = iproductoservice.listarProducto();
            List<Carrito> carrito = icarritoservice.listarCArrito();

            List<Producto> productocarrito = new ArrayList<>();

            for (Carrito c : carrito) {
                if (c.getIdUsuario().getIdUsuario() == sesion.getAttribute("id_usuario")) {
                    for (Producto p : productos) {
                        if (p.getIdProducto() == c.getIdProducto().getIdProducto()) {
                            productocarrito.add(p);
                            break;
                        }
                    }
                }
            }
            
            sesion.setAttribute("carrito", productocarrito);

            String llenar = request.getParameter("llenar");

            if (llenar.equalsIgnoreCase("surf")) {
                sesion.setAttribute("packs", packs);
                response.sendRedirect("surf.jsp");
            } else if (llenar.equalsIgnoreCase("paddlesurf")) {
                sesion.setAttribute("packs", packs);
                response.sendRedirect("paddlesurf.jsp");
            } else if (llenar.equalsIgnoreCase("yoga")) {
                sesion.setAttribute("packs", packs);
                response.sendRedirect("yoga.jsp");
            } else if (llenar.equalsIgnoreCase("kayak")) {
                sesion.setAttribute("packs", packs);
                response.sendRedirect("kayak.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
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
