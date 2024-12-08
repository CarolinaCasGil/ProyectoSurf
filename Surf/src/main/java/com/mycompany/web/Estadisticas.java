/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.*;
import com.mycompany.service.*;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Estadisticas", urlPatterns = {"/Estadisticas"})
public class Estadisticas extends HttpServlet {

    @Inject
    IProductoService iproductoservice;

    @Inject
    IAlojamientoService ialojamienoservice;

    @Inject
    IPackService ipackservice;

    @Inject
    IUsuarioService isuarioservice;

    @Inject
    IUsusario_ProductoService iusuarioproducto;

    @Inject
    IUsuario_AlojamientoService iusuarioalo;

    @Inject
    IUsuario_PackService iusuariopack;
    
    @Inject
    IActividadService iactividadesservice;

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

        List<UsuarioProducto> upro = iusuarioproducto.listarProducto();

        Map<Usuario, Integer> totalProductosPorUsuario = new HashMap<>();

        for (UsuarioProducto up : upro) {
            Usuario idUsuario = up.getIdUsuario(); 
            Integer cantidad = up.getCantidad();

            totalProductosPorUsuario.merge(idUsuario, cantidad, Integer::sum);
        }
        System.out.println(totalProductosPorUsuario);
        sesion.setAttribute("totalProductosPorUsuario", totalProductosPorUsuario);
        sesion.setAttribute("aupro", upro);

        List<UsuarioPack> upac = iusuariopack.listarUsuarioPack();
        sesion.setAttribute("aupac", upac);

        List<UsuarioAlojamiento> ualoj = iusuarioalo.listarUsuarioAlojamiento();
        sesion.setAttribute("aualoj", ualoj);

        List<Alojamiento> ialoja = ialojamienoservice.listarAlojamientos();
        List<Pack> ipack = ipackservice.listarPack();
        List<Producto> producto = iproductoservice.listarProducto();
        List<Actividad> act = iactividadesservice.listarActividades();

        sesion.setAttribute("aactividades", act);
        sesion.setAttribute("aalojamiento", ialoja);
        sesion.setAttribute("apacks", ipack);
        sesion.setAttribute("aproducto", producto);

        response.sendRedirect("estadisticas.jsp");
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
