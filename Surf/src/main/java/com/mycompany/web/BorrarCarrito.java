/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.Carrito;
import com.mycompany.dominio.Producto;
import com.mycompany.service.ICarritoService;
import com.mycompany.service.IProductoService;
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
@WebServlet(name = "BorrarCarrito", urlPatterns = {"/BorrarCarrito"})
public class BorrarCarrito extends HttpServlet {

    @Inject
    ICarritoService icarritoservice;

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

        String idc = request.getParameter("id");
        System.out.println(idc);
        int id = Integer.parseInt(idc);

        icarritoservice.eliminarCarrito(id);
        List<Producto> producto = iproductoservice.listarProducto();
        List<Carrito> carrito = icarritoservice.listarCArrito();

        List<Producto> productocarrito = new ArrayList();

        for (Carrito c : carrito) {
            if (c.getIdUsuario().getIdUsuario() == sesion.getAttribute("id_usuario")) {
                for (Producto p : producto) {
                    if (p.getIdProducto() == c.getIdProducto().getIdProducto()) {
                        productocarrito.add(p);
                        break;
                    }
                }
            }
        }

        sesion.setAttribute("carrito", productocarrito);
        sesion.setAttribute("cantcarrito", carrito);

        response.sendRedirect("producto.jsp");

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
