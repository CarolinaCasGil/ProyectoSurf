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
@WebServlet(name = "PagoAlojamiento", urlPatterns = {"/PagoAlojamiento"})
public class PagoAlojamiento extends HttpServlet {

    @Inject
    IUsuario_AlojamientoService isusualoservice;

    @Inject
    IAlojamientoService alojamientoService;

    @Inject
    IUsuarioService usuarioService;

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
        String f1 = request.getParameter("fechallegada");
        String f2 = request.getParameter("fechaida");

        int id = Integer.parseInt(p1);
        Date date1 = outputFormat.parse(f1);
        Date date2 = outputFormat.parse(f2);

        List<Usuario> usuarios = usuarioService.listarUsuarios();
        List<Alojamiento> alo = alojamientoService.listarAlojamientos();

        Alojamiento idalo = null;

        for (Alojamiento alojamiento : alo) {
            if (alojamiento.getIdAlojamiento() == id) {
                idalo = alojamiento;
            }
        }
        idalo.setCantComprada(idalo.getCantComprada() + 1);
        alojamientoService.actualizarAlojamiento(idalo);

        Usuario idusuario = null;
        Object idUsuarioObject = sesion.getAttribute("id_usuario");
        int idUsuario = Integer.parseInt(idUsuarioObject.toString());

        for (Usuario usuario : usuarios) {
            if (usuario.getIdUsuario() == idUsuario) {
                idusuario = usuario;
            }
        }

        UsuarioAlojamiento nuevo = new UsuarioAlojamiento(date1, date2, idalo, idusuario);
        isusualoservice.insertarUsuarioAlojamiento(nuevo);

        List<UsuarioAlojamiento> ualoj = isusualoservice.findByUsuarioId(idusuario);
        sesion.setAttribute("ualoj", ualoj);

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
            Logger.getLogger(PagoAlojamiento.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PagoAlojamiento.class.getName()).log(Level.SEVERE, null, ex);
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
