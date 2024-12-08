/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.Carrito;
import com.mycompany.dominio.Producto;
import com.mycompany.dominio.Usuario;
import com.mycompany.service.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
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
@WebServlet(name = "CarritoServlet", urlPatterns = {"/CarritoServlet"})
public class CarritoServlet extends HttpServlet {

    @Inject
    IProductoService iproductoservice;

    @Inject
    IUsuarioService isuarioservice;

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

        HttpSession sesion = request.getSession();
        sesion.setAttribute("carrito", null);
        List<Producto> productos = (List<Producto>) sesion.getAttribute("productos");

        List<Usuario> usuario = isuarioservice.listarUsuarios();
        List<Producto> producto = iproductoservice.listarProducto();
        Producto idproducto = null;
        String p1 = request.getParameter("p");

        if (p1 != null) {
            int id = Integer.parseInt(p1);
            for (int i = 0; i < productos.size(); i++) {
                if (id == productos.get(i).getIdProducto()) {
                    idproducto = productos.get(i);
                }
            }

            Usuario idusuario = null;

            for (int i = 0; i < usuario.size(); i++) {
                if (sesion.getAttribute("id_usuario") == usuario.get(i).getIdUsuario()) {
                    idusuario = usuario.get(i);
                }
            }

            Carrito new_carrito = new Carrito(idproducto, idusuario);

            List<Carrito> carrito = icarritoservice.listarCArrito();

            if (carrito.size() == 0) {
                new_carrito = new Carrito(1, idproducto, idusuario);
                System.out.println(new_carrito.toString());
                icarritoservice.insertarCarrito(new_carrito);
            } else {
                boolean productAdded = false;
                for (int i = 0; i < carrito.size(); i++) {
                    if (carrito.get(i).getIdProducto().equals(idproducto) && carrito.get(i).getIdUsuario().equals(idusuario)) {
                        int cantidad = carrito.get(i).getCantidad() + 1;
                        new_carrito.setCantidad(cantidad);
                        new_carrito.setIdCarrito(carrito.get(i).getIdCarrito());
                        icarritoservice.actualizarCarrito(new_carrito);
                        productAdded = true;
                        break;
                    }
                }
                if (!productAdded) {
                    new_carrito = new Carrito(1, idproducto, idusuario);
                    icarritoservice.insertarCarrito(new_carrito);
                }
            }

            carrito = icarritoservice.listarCArrito();

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

            System.out.println(sesion.getAttribute("carrito"));
            System.out.println(sesion.getAttribute("cantcarrito"));
            response.sendRedirect("producto.jsp");

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
