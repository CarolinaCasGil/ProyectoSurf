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
@WebServlet(name = "PagPagoProducto", urlPatterns = {"/PagPagoProducto"})
public class PagPagoProducto extends HttpServlet {

    @Inject
    IProductoService iproductoservice;

    @Inject
    IUsuarioService isuarioservice;

    @Inject
    ICarritoService icarritoservice;

    @Inject
    IUsusario_ProductoService iusupro;

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
        List<Producto> producto = iproductoservice.listarProducto();
        List<Usuario> usuario = isuarioservice.listarUsuarios();
        int count = 0;

        if (sesion.getAttribute("nom_usuario") == null && sesion.getAttribute("clave") == null) {
            Map<Producto, Integer> productCountMap = (Map<Producto, Integer>) sesion.getAttribute("productCountMap");

            for (Map.Entry<Producto, Integer> entry : productCountMap.entrySet()) {
                Producto pr = entry.getKey();
                Integer cant = entry.getValue();

                java.util.Date currentDate = new java.util.Date();
                java.sql.Date fechaPedido = new java.sql.Date(currentDate.getTime());

                UsuarioProducto nuevo = new UsuarioProducto(cant, fechaPedido, pr);
                iusupro.insertarProducto(nuevo);

                for (int j = 0; j < producto.size(); j++) {
                    if (producto.get(j).equals(pr)) {
                        Producto act = new Producto();
                        act.setId_producto(producto.get(j).getId_producto());
                        act.setNombre(producto.get(j).getNombre());
                        int res = producto.get(j).getCantidad() - cant;
                        act.setCantidad(res);
                        act.setCosto(producto.get(j).getCosto());
                        int can = producto.get(j).getCantComprada() + cant;
                        act.setCantComprada(can);
                        act.setFoto(producto.get(j).getFoto());

                        iproductoservice.actualizarProducto(act);
                        count++;
                    }

                }

                Usuario u = null;
                for (Usuario usuario1 : usuario) {
                    if (usuario1.getIdUsuario() == (Integer) sesion.getAttribute("id_usuario")) {
                        u = usuario1;
                    }
                }
                List<UsuarioProducto> upro = iusupro.usuarioporducto(u);
                List<Producto> pprod = iproductoservice.listarProducto();

                sesion.setAttribute("carritosinsesion", null);
                sesion.setAttribute("productCountMap", null);

            }

            response.sendRedirect("index.jsp");
        } else {
            List<Producto> carrito = (List<Producto>) sesion.getAttribute("carrito");
            List<Carrito> cantidadcarrito = (List<Carrito>) sesion.getAttribute("cantcarrito");

            Usuario idusuario = null;

            for (Usuario u : usuario) {
                if (u.getIdUsuario() == (Integer) sesion.getAttribute("id_usuario")) {
                    idusuario = u;
                    break;
                }
            }

            if (carrito != null && cantidadcarrito != null && idusuario != null) {
                for (Producto product : carrito) {
                    for (Carrito carr : cantidadcarrito) {
                        if (carr.getIdProducto().equals(product) && carr.getIdUsuario().equals(idusuario)) {
                            Producto act = new Producto();
                            act.setId_producto(product.getId_producto());
                            act.setNombre(product.getNombre());
                            int res = product.getCantidad() - carr.getCantidad();
                            act.setCantidad(res);
                            act.setCosto(product.getCosto());
                            int cant = product.getCantComprada() + carr.getCantidad();
                            act.setCantComprada(cant);
                            act.setFoto(product.getFoto());

                            java.util.Date currentDate = new java.util.Date();
                            java.sql.Date fechaPedido = new java.sql.Date(currentDate.getTime());

                            UsuarioProducto nuevo = new UsuarioProducto(carr.getCantidad(), fechaPedido, product, idusuario);
                            iusupro.insertarProducto(nuevo);
                            icarritoservice.eliminarCarrito(carr.getIdCarrito());
                            iproductoservice.actualizarProducto(act);
                            count++;
                        }
                    }
                }

                Usuario u = null;
                for (Usuario usuario1 : usuario) {
                    if (usuario1.getIdUsuario() == (Integer) sesion.getAttribute("id_usuario")) {
                        u = usuario1;
                    }
                }
                List<UsuarioProducto> upro = iusupro.usuarioporducto(u);
                List<Producto> pprod = iproductoservice.listarProducto();
                sesion.setAttribute("producto", pprod);
                sesion.setAttribute("upro", upro);

            }
             response.sendRedirect("usuario.jsp");
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
