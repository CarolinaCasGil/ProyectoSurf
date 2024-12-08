/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.Producto;
import com.mycompany.service.IProductoService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "BorrarProductoSinSesion", urlPatterns = {"/BorrarProductoSinSesion"})
public class BorrarProductoSinSesion extends HttpServlet {

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

        String parameterP = request.getParameter("p");
        int p1;

        if (parameterP != null && !parameterP.isEmpty()) {
            p1 = Integer.parseInt(parameterP);
        } else {
            p1 = 0;
        }

        HttpSession sesion = request.getSession();

        sesion.setAttribute("carritosinsesion", null);

        List<Producto> productocarrito = (List<Producto>) sesion.getAttribute("carritosinsesion");

        if (productocarrito == null) {
            productocarrito = new ArrayList<>();
        } else {
            for (int i = productocarrito.size() - 1; i >= 0; i--) {
                Producto producto = productocarrito.get(i);
                if (producto.getIdProducto() == p1) {
                    productocarrito.remove(i);
                }
            }
        }

        Map<Producto, Integer> productCountMap = new HashMap<>();

        for (Producto p : productocarrito) {
            productCountMap.put(p, productCountMap.getOrDefault(p, 0) + 1);
        }

        sesion.setAttribute("productCountMap", productCountMap);
        sesion.setAttribute("carritosinsesion", productocarrito);

        System.out.println(productocarrito);

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
