/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.*;
import com.mycompany.service.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "PagoPack", urlPatterns = {"/PagoPack"})
public class PagoPack extends HttpServlet {

    @Inject
    IUsuario_PackService iusuariopack;

    @Inject
    IUsuarioService isuarioservice;

    @Inject
    IPackService ipackService;

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession sesion = request.getSession();
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

        String p1 = request.getParameter("id");
        String f1 = request.getParameter("fechainicio");

        int id = Integer.parseInt(p1);
        Date date1 = outputFormat.parse(f1);

        List<Usuario> usuarios = isuarioservice.listarUsuarios();
        List<Pack> packs = ipackService.listarPack();

        Pack idpack = null;

        for (int i = 0; i < packs.size(); i++) {
            if (id == packs.get(i).getIdPack()) {
                idpack = packs.get(i);
                break;
            }
        }

        idpack.setCantComprada(idpack.getCantComprada() + 1);
        ipackService.actualizarPack(idpack);

        Usuario idusuario = null;

        for (int i = 0; i < usuarios.size(); i++) {
            if (sesion.getAttribute("id_usuario").equals(usuarios.get(i).getIdUsuario())) {
                idusuario = usuarios.get(i);
                break;
            }
        }

        UsuarioPack nuevo = new UsuarioPack(date1, idpack, idusuario);
        iusuariopack.insertarUsuarioPack(nuevo);

        List<UsuarioPack> upac = iusuariopack.findByUsuarioId(idusuario);
        sesion.setAttribute("upac", upac);

        response.sendRedirect("usuario.jsp");

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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(PagoPack.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(PagoPack.class.getName()).log(Level.SEVERE, null, ex);
        }
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
