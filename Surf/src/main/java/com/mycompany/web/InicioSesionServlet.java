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
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.registry.infomodel.User;

/**
 *
 * @author CAROL
 */
@WebServlet(name = "InicioSesionServlet", urlPatterns = {"/InicioSesionServlet"})
public class InicioSesionServlet extends HttpServlet {

    @Inject
    IUsuarioService iusuarioservice;

    @Inject
    IProductoService iproductoservice;

    @Inject
    IAlojamientoService ialojamienoservice;
    
    @Inject
    IPackService ipackservice;

    @Inject
    IUsuarioService isuarioservice;

    @Inject
    ICarritoService icarritoservice;

    @Inject
    IUsusario_ProductoService iusuarioproducto;

    @Inject
    IUsuario_AlojamientoService iusuarioalo;

    @Inject
    IUsuario_PackService iusuariopack;

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

        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();

        List<Usuario> usuarios = iusuarioservice.listarUsuarios();

        if (request.getParameter("enviarL") != null) {

            String user = request.getParameter("nom_usuario");
            String clave = request.getParameter("clave");

            boolean usuarioCorrecto = false;

            for (Usuario usuario : usuarios) {
                if (usuario.getNomUsuario().equals(user) && usuario.getClave().equals(clave)) {

                    sesion.setAttribute("id_usuario", usuario.getIdUsuario());
                    sesion.setAttribute("nom_usuario", user);
                    sesion.setAttribute("nombre", usuario.getNombre());
                    sesion.setAttribute("apellido", usuario.getApellido());
                    sesion.setAttribute("telef", usuario.getTelefono());
                    sesion.setAttribute("email", usuario.getEmail());
                    sesion.setAttribute("clave", clave);
                    sesion.setAttribute("usaurio", usuario);

                    List<UsuarioProducto> upro = iusuarioproducto.usuarioporducto(usuario);
                    sesion.setAttribute("upro", upro);

                    List<UsuarioPack> upac = iusuariopack.findByUsuarioId(usuario);
                    sesion.setAttribute("upac", upac);

                    List<UsuarioAlojamiento> ualoj = iusuarioalo.findByUsuarioId(usuario);
                    sesion.setAttribute("ualoj", ualoj);

                    List<Alojamiento> ialoja = ialojamienoservice.listarAlojamientos();
                    List<Pack> ipack = ipackservice.listarPack();
                    List<Producto> producto = iproductoservice.listarProducto();
                    List<Carrito> carrito = icarritoservice.listarCArrito();

                    List<Producto> productocarrito = new ArrayList();

                    for (Carrito c : carrito) {
                        if (c.getIdUsuario().getIdUsuario() == usuario.getIdUsuario()) {
                            for (Producto p : producto) {
                                if (p.getIdProducto() == c.getIdProducto().getIdProducto()) {
                                    productocarrito.add(p);
                                    break;
                                }
                            }
                        }
                    }

                    sesion.setAttribute("alojamiento", ialoja);
                    sesion.setAttribute("packs", ipack);
                    sesion.setAttribute("producto", producto);
                    sesion.setAttribute("carrito", productocarrito);
                    sesion.setAttribute("cantcarrito", carrito);
                    response.sendRedirect("index.jsp");
                    usuarioCorrecto = true;
                    break;
                }
            }

            if (!usuarioCorrecto) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Usuario o contraseña incorrectos');");
                out.println("</script>");
                response.sendRedirect("loogin.jsp");
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
