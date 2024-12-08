/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.Usuario;
import com.mycompany.service.IUsuarioService;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ModificarUsuario", urlPatterns = {"/ModificarUsuario"})
public class ModificarUsuario extends HttpServlet {

    @Inject
    IUsuarioService iusuarioservice;

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

        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String nom_usuario = request.getParameter("nom_usuario");
        String telef = request.getParameter("telef");
        String email = request.getParameter("email");
        String clave = request.getParameter("clave");

        Usuario new_usuario = (Usuario) sesion.getAttribute("usaurio");
        new_usuario.setIdUsuario(id);
        new_usuario.setNomUsuario(nom_usuario);
        new_usuario.setNombre(nombre);
        new_usuario.setApellido(apellido);
        new_usuario.setEmail(email);
        new_usuario.setTelefono(telef);
        new_usuario.setClave(clave);
        System.out.println(new_usuario);
        iusuarioservice.actualizarUsuarios(new_usuario);

        sesion.setAttribute("id_usuario", new_usuario.getIdUsuario());
        sesion.setAttribute("nom_usuario", new_usuario.getNomUsuario());
        sesion.setAttribute("nombre", new_usuario.getNombre());
        sesion.setAttribute("apellido", new_usuario.getApellido());
        sesion.setAttribute("telef", new_usuario.getTelefono());
        sesion.setAttribute("email", new_usuario.getEmail());
        sesion.setAttribute("clave", new_usuario.getClave());
        sesion.setAttribute("usaurio", new_usuario);

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
