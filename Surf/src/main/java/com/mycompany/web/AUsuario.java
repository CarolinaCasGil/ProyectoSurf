/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.Usuario;
import com.mycompany.service.IUsuarioService;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AUsuario", urlPatterns = {"/AUsuario"})
public class AUsuario extends HttpServlet {

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

        String n =  request.getParameter("insertar");
        System.out.println("insertar-> " + n);
        
        if (request.getParameter("insertar") != null) {

            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String nom_usuario = request.getParameter("nom_usuario");
            String telef = request.getParameter("telef");
            String email = request.getParameter("email");
            String clave1 = request.getParameter("clave");

            Usuario new_usuario = new Usuario(nom_usuario, nombre, apellido, clave1, email, telef);
            iusuarioservice.insertarUsuarios(new_usuario);

            List<Usuario> usuarios = iusuarioservice.listarUsuarios();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("ausuario", null);

            sesion.setAttribute("ausuario", usuarios);
            response.sendRedirect("ausuario.jsp");

        } else if (request.getParameter("modificar") != null) {

            String id = request.getParameter("id");
            int idu = Integer.parseInt(id);
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String nom_usuario = request.getParameter("nom_usuario");
            String telef = request.getParameter("telef");
            String email = request.getParameter("email");
            String clave = request.getParameter("clave");

            Usuario new_usuario = new Usuario();
            new_usuario.setIdUsuario(idu);
            new_usuario.setNomUsuario(nom_usuario);
            new_usuario.setNombre(nombre);
            new_usuario.setApellido(apellido);
            new_usuario.setEmail(email);
            new_usuario.setTelefono(telef);
            new_usuario.setClave(clave);
            System.out.println(new_usuario);
            iusuarioservice.actualizarUsuarios(new_usuario);

            List<Usuario> usuarios = iusuarioservice.listarUsuarios();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("ausuario", null);

            sesion.setAttribute("ausuario", usuarios);
            response.sendRedirect("ausuario.jsp");
        } else if (request.getParameter("eliminar") != null) {
            
            String id = request.getParameter("id");
            int idu = Integer.parseInt(id);
            
            iusuarioservice.eliminarUsuarios(idu);
            
            List<Usuario> usuarios = iusuarioservice.listarUsuarios();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("ausuario", null);

            sesion.setAttribute("ausuario", usuarios);
            response.sendRedirect("ausuario.jsp");

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
