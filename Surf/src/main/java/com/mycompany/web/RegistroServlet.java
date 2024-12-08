/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.Carrito;
import com.mycompany.dominio.Producto;
import com.mycompany.dominio.Usuario;
import com.mycompany.service.ICarritoService;
import com.mycompany.service.IProductoService;
import com.mycompany.service.IUsuarioService;
import com.mycompany.service.UsuarioService;
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
@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

    @Inject
    IUsuarioService iusuarioservice;
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();

        List<Usuario> usuarios = null;
        if (request.getParameter("enviarR") != null) {

            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String nom_usuario = request.getParameter("nom_usuario");
            String telef = request.getParameter("telef");
            String email = request.getParameter("email");
            String clave1 = request.getParameter("clave");
            String clave2 = request.getParameter("clave2");

            
            if (clave2.equals(clave1)) {
                Usuario new_usuario = new Usuario(nom_usuario, nombre, apellido, clave2, email, telef);
                iusuarioservice.insertarUsuarios(new_usuario);
            } else {
                response.sendRedirect("login.jsp?errorc=true");
                return;
            }

            usuarios = iusuarioservice.listarUsuarios();
            if (usuarios.size() > 0) {
                for (Usuario usuario : usuarios) {
                    if (usuario.getNomUsuario().equals(nom_usuario) && usuario.getClave().equals(clave1)) {

                        sesion.setAttribute("id_usuario", usuario.getIdUsuario());
                        sesion.setAttribute("nombre", nombre);
                        sesion.setAttribute("apellido", apellido);
                        sesion.setAttribute("nom_usuario", nom_usuario);
                        sesion.setAttribute("telef", telef);
                        sesion.setAttribute("email", email);
                        sesion.setAttribute("clave", clave1);
                        sesion.setAttribute("usaurio", usuario);
                        response.sendRedirect("index.jsp");
                        return;

                    }
                }
            }
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
