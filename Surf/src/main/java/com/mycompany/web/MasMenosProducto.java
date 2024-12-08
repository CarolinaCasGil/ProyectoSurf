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
@WebServlet(name = "MasMenosProducto", urlPatterns = {"/MasMenosProducto"})
public class MasMenosProducto extends HttpServlet {

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

        if (request.getParameter("menoscon") != null) {

            List<Carrito> cantidadcarrito = (List<Carrito>) sesion.getAttribute("cantcarrito");
            String idc = request.getParameter("id");
            int id = Integer.parseInt(idc);

            for (int j = 0; j < cantidadcarrito.size(); j++) {
                if (cantidadcarrito.get(j).getIdCarrito().equals(id)) {

                    Carrito act = new Carrito();
                    act.setIdCarrito(id);
                    act.setCantidad(cantidadcarrito.get(j).getCantidad() - 1);
                    act.setIdProducto(cantidadcarrito.get(j).getIdProducto());
                    act.setIdUsuario(cantidadcarrito.get(j).getIdUsuario());

                    icarritoservice.actualizarCarrito(act);
                    System.out.println(act + " correcto");
                }
            }

            List<Carrito> carrito = icarritoservice.listarCArrito();
            List<Producto> producto = iproductoservice.listarProducto();
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
            String referer = request.getHeader("Referer");
            response.sendRedirect(referer);

        } else if (request.getParameter("mascon") != null) {

            List<Carrito> cantidadcarrito = (List<Carrito>) sesion.getAttribute("cantcarrito");
            String idc = request.getParameter("id");
            int id = Integer.parseInt(idc);

            for (int j = 0; j < cantidadcarrito.size(); j++) {
                if (cantidadcarrito.get(j).getIdCarrito().equals(id)) {

                    Carrito act = new Carrito();
                    act.setIdCarrito(id);
                    act.setCantidad(cantidadcarrito.get(j).getCantidad() + 1);
                    act.setIdProducto(cantidadcarrito.get(j).getIdProducto());
                    act.setIdUsuario(cantidadcarrito.get(j).getIdUsuario());

                    icarritoservice.actualizarCarrito(act);
                    System.out.println(act + " correcto");
                }
            }

            List<Carrito> carrito = icarritoservice.listarCArrito();
            List<Producto> producto = iproductoservice.listarProducto();
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
            String referer = request.getHeader("Referer");
            response.sendRedirect(referer);

        } else if (request.getParameter("menossin") != null) {

            int p1 = Integer.parseInt(request.getParameter("id"));

            List<Producto> productocarrito = (List<Producto>) sesion.getAttribute("carritosinsesion");

            if (productocarrito == null) {
                productocarrito = new ArrayList<>();
            }

            List<Producto> producto = iproductoservice.listarProducto();

            for (Producto p : producto) {
                if (p.getIdProducto() == p1) {
                    productocarrito.remove(p);
                    break;
                }
            }

            sesion.setAttribute("carritosinsesion", productocarrito);

            Map<Producto, Integer> productCountMap = new HashMap<>();

            for (Producto p : productocarrito) {
                productCountMap.put(p, productCountMap.getOrDefault(p, 0) - 1);
            }

            sesion.setAttribute("productCountMap", productCountMap);
            sesion.setAttribute("carritosinsesion", productocarrito);

            System.out.println(productocarrito);

            String referer = request.getHeader("Referer");
            response.sendRedirect(referer);

        } else if (request.getParameter("massin") != null) {

            int p1 = Integer.parseInt(request.getParameter("id"));

            List<Producto> productocarrito = (List<Producto>) sesion.getAttribute("carritosinsesion");

            if (productocarrito == null) {
                productocarrito = new ArrayList<>();
            }

            List<Producto> producto = iproductoservice.listarProducto();

            for (Producto p : producto) {
                if (p.getIdProducto() == p1) {
                    productocarrito.add(p);
                    break;
                }
            }

            sesion.setAttribute("carritosinsesion", productocarrito);

            Map<Producto, Integer> productCountMap = new HashMap<>();

            for (Producto p : productocarrito) {
                productCountMap.put(p, productCountMap.getOrDefault(p, 0) + 1);
            }

            sesion.setAttribute("productCountMap", productCountMap);
            sesion.setAttribute("carritosinsesion", productocarrito);

            System.out.println(productocarrito);

            String referer = request.getHeader("Referer");
            response.sendRedirect(referer);

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
