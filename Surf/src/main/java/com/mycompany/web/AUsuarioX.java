/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.Alojamiento;
import com.mycompany.dominio.Pack;
import com.mycompany.dominio.Producto;
import com.mycompany.dominio.Usuario;
import com.mycompany.dominio.UsuarioAlojamiento;
import com.mycompany.dominio.UsuarioPack;
import com.mycompany.dominio.UsuarioProducto;
import com.mycompany.service.IAlojamientoService;
import com.mycompany.service.IPackService;
import com.mycompany.service.IProductoService;
import com.mycompany.service.IUsuarioService;
import com.mycompany.service.IUsuario_AlojamientoService;
import com.mycompany.service.IUsuario_PackService;
import com.mycompany.service.IUsusario_ProductoService;
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
@WebServlet(name = "AUsuarioX", urlPatterns = {"/AUsuarioX"})
public class AUsuarioX extends HttpServlet {

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

        if (request.getParameter("usuariox") != null) {

            List<UsuarioProducto> upro = iusuarioproducto.listarProducto();
            sesion.setAttribute("aupro", upro);

            List<UsuarioPack> upac = iusuariopack.listarUsuarioPack();
            sesion.setAttribute("aupac", upac);

            List<UsuarioAlojamiento> ualoj = iusuarioalo.listarUsuarioAlojamiento();
            sesion.setAttribute("aualoj", ualoj);

            List<Alojamiento> ialoja = ialojamienoservice.listarAlojamientos();
            List<Pack> ipack = ipackservice.listarPack();
            List<Producto> producto = iproductoservice.listarProducto();

            sesion.setAttribute("aalojamiento", ialoja);
            sesion.setAttribute("apacks", ipack);
            sesion.setAttribute("aproducto", producto);

            response.sendRedirect("ausuarioX.jsp");
        } else if (request.getParameter("insertarproducto") != null) {

            String id1 = request.getParameter("id_usuario");
            int idu = Integer.parseInt(id1);
            String id2 = request.getParameter("id_producto");
            int idp = Integer.parseInt(id2);
            String fecha = request.getParameter("FechaPedido");
            Date date1 = outputFormat.parse(fecha);

            String cantidad = request.getParameter("Cantidad");
            int cant = Integer.parseInt(cantidad);

            List<Usuario> usuarios = isuarioservice.listarUsuarios();
            Usuario idusu = null;
            for (Usuario usuario : usuarios) {
                if (usuario.getIdUsuario().equals(idu)) {
                    idusu = usuario;
                }
            }

            List<Producto> productos = iproductoservice.listarProducto();
            Producto idpro = null;
            for (Producto producto : productos) {
                if (producto.getIdProducto().equals(idp)) {
                    idpro = producto;
                }
            }

            UsuarioProducto insertar = new UsuarioProducto(cant, date1, idpro, idusu);
            iusuarioproducto.insertarProducto(insertar);

            List<UsuarioProducto> upro = iusuarioproducto.listarProducto();
            sesion.setAttribute("aupro", upro);

            response.sendRedirect("ausuarioX.jsp");

        } else if (request.getParameter("insertarpack") != null) {

            String id1 = request.getParameter("id_usuario");
            int idu = Integer.parseInt(id1);
            String id2 = request.getParameter("id_pack");
            int idp = Integer.parseInt(id2);
            String fecha = request.getParameter("FechaInicio");
            Date date1 = outputFormat.parse(fecha);

            List<Usuario> usuarios = isuarioservice.listarUsuarios();
            Usuario idusu = null;
            for (Usuario usuario : usuarios) {
                if (usuario.getIdUsuario().equals(idu)) {
                    idusu = usuario;
                }
            }

            List<Pack> productos = ipackservice.listarPack();
            Pack idpac = null;
            for (Pack producto : productos) {
                if (producto.getIdPack().equals(idp)) {
                    idpac = producto;
                }
            }

            UsuarioPack insertar = new UsuarioPack(date1, idpac, idusu);
            iusuariopack.insertarUsuarioPack(insertar);

            List<UsuarioPack> upac = iusuariopack.listarUsuarioPack();
            sesion.setAttribute("aupac", upac);

            response.sendRedirect("ausuarioX.jsp");

        } else if (request.getParameter("insertaralo") != null) {

            String id1 = request.getParameter("id_usuario");
            int idu = Integer.parseInt(id1);
            String id2 = request.getParameter("id_alo");
            int idalo = Integer.parseInt(id2);
            String fecha = request.getParameter("FechaEntrada");
            Date date1 = outputFormat.parse(fecha);
            String fech = request.getParameter("FechaSalida");
            Date date2 = outputFormat.parse(fecha);

            List<Usuario> usuarios = isuarioservice.listarUsuarios();
            Usuario idusu = null;
            for (Usuario usuario : usuarios) {
                if (usuario.getIdUsuario().equals(idu)) {
                    idusu = usuario;
                }
            }

            List<Alojamiento> productos = ialojamienoservice.listarAlojamientos();
            Alojamiento idpac = null;
            for (Alojamiento producto : productos) {
                if (producto.getIdAlojamiento().equals(idalo)) {
                    idpac = producto;
                }
            }

            UsuarioAlojamiento insertar = new UsuarioAlojamiento(date1, date2, idpac, idusu);
            iusuarioalo.insertarUsuarioAlojamiento(insertar);

            List<UsuarioAlojamiento> ualoj = iusuarioalo.listarUsuarioAlojamiento();
            sesion.setAttribute("aualoj", ualoj);

            response.sendRedirect("ausuarioX.jsp");

        } else if (request.getParameter("modificarproducto") != null) {

            String id3 = request.getParameter("id");
            int id = Integer.parseInt(id3);
            String id1 = request.getParameter("id_usuario");
            int idu = Integer.parseInt(id1);
            String id2 = request.getParameter("id_producto");
            int idp = Integer.parseInt(id2);
            String fecha = request.getParameter("FechaPedido");
            Date date1;
            if (fecha == null) {
                String fecha2 = request.getParameter("FechaPedido2");
                date1 = outputFormat.parse(fecha2);
            } else {
                date1 = outputFormat.parse(fecha);
            }

            String cantidad = request.getParameter("Cantidad");
            int cant = Integer.parseInt(cantidad);

            List<Usuario> usuarios = isuarioservice.listarUsuarios();
            Usuario idusu = null;
            for (Usuario usuario : usuarios) {
                if (usuario.getIdUsuario().equals(idu)) {
                    idusu = usuario;
                }
            }

            List<Producto> productos = iproductoservice.listarProducto();
            Producto idpro = null;
            for (Producto producto : productos) {
                if (producto.getIdProducto().equals(idp)) {
                    idpro = producto;
                }
            }

            UsuarioProducto insertar = new UsuarioProducto(cant, id, date1, idpro, idusu);
            iusuarioproducto.actualizarProducto(insertar);

            List<UsuarioProducto> upro = iusuarioproducto.listarProducto();
            sesion.setAttribute("aupro", upro);

            response.sendRedirect("ausuarioX.jsp");

        } else if (request.getParameter("modificarpack") != null) {

            String id3 = request.getParameter("id");
            int id = Integer.parseInt(id3);
            String id1 = request.getParameter("id_usuario");
            int idu = Integer.parseInt(id1);
            String id2 = request.getParameter("id_pack");
            int idp = Integer.parseInt(id2);
            String fecha = request.getParameter("FechaInicio");
            Date date1;
            if (fecha == null) {
                String fecha2 = request.getParameter("FechaInicio2");
                date1 = outputFormat.parse(fecha2);
            } else {
                date1 = outputFormat.parse(fecha);
            }

            List<Usuario> usuarios = isuarioservice.listarUsuarios();
            Usuario idusu = null;
            for (Usuario usuario : usuarios) {
                if (usuario.getIdUsuario().equals(idu)) {
                    idusu = usuario;
                }
            }

            List<Pack> productos = ipackservice.listarPack();
            Pack idpac = null;
            for (Pack producto : productos) {
                if (producto.getIdPack().equals(idp)) {
                    idpac = producto;
                }
            }

            UsuarioPack insertar = new UsuarioPack(date1, id, idpac, idusu);
            iusuariopack.actualizarUsuarioPack(insertar);

            List<UsuarioPack> upac = iusuariopack.listarUsuarioPack();
            sesion.setAttribute("aupac", upac);

            response.sendRedirect("ausuarioX.jsp");

        } else if (request.getParameter("modificaralo") != null) {

            String id3 = request.getParameter("id");
            int id = Integer.parseInt(id3);
            String id1 = request.getParameter("id_usuario");
            int idu = Integer.parseInt(id1);
            String id2 = request.getParameter("id_alo");
            int idalo = Integer.parseInt(id2);
            String fecha = request.getParameter("FechaEntrada");
            Date date1;
            if (fecha == null) {
                String fecha2 = request.getParameter("FechaEntrada2");
                 date1 = outputFormat.parse(fecha2);
            } else {
                 date1 = outputFormat.parse(fecha);
            }
            String fech = request.getParameter("FechaSalida");
            Date date2;
            if (fecha == null) {
                String fecha2 = request.getParameter("FechaSalida2");
                 date2 = outputFormat.parse(fecha2);
            } else {
                 date2 = outputFormat.parse(fecha);
            }

            List<Usuario> usuarios = isuarioservice.listarUsuarios();
            Usuario idusu = null;
            for (Usuario usuario : usuarios) {
                if (usuario.getIdUsuario().equals(idu)) {
                    idusu = usuario;
                }
            }

            List<Alojamiento> productos = ialojamienoservice.listarAlojamientos();
            Alojamiento idpac = null;
            for (Alojamiento producto : productos) {
                if (producto.getIdAlojamiento().equals(idalo)) {
                    idpac = producto;
                }
            }

            UsuarioAlojamiento insertar = new UsuarioAlojamiento(date1, date2, id, idpac, idusu);
            iusuarioalo.actualizarUsuarioAlojamiento(insertar);

            List<UsuarioAlojamiento> ualoj = iusuarioalo.listarUsuarioAlojamiento();
            sesion.setAttribute("aualoj", ualoj);

            response.sendRedirect("ausuarioX.jsp");
        } else if (request.getParameter("eliminarpro") != null) {

            String id3 = request.getParameter("id");
            int id = Integer.parseInt(id3);

            iusuarioproducto.eliminarProducto(id);

            List<UsuarioProducto> upro = iusuarioproducto.listarProducto();
            sesion.setAttribute("aupro", upro);

            response.sendRedirect("ausuarioX.jsp");

        } else if (request.getParameter("eliminarpack") != null) {

            String id3 = request.getParameter("id");
            int id = Integer.parseInt(id3);

            iusuariopack.eliminarUsuarioPack(id);

            List<UsuarioPack> upac = iusuariopack.listarUsuarioPack();
            sesion.setAttribute("aupac", upac);

            response.sendRedirect("ausuarioX.jsp");

        } else if (request.getParameter("eliminaralo") != null) {

            String id3 = request.getParameter("id");
            int id = Integer.parseInt(id3);
            iusuarioalo.eliminarUsuarioAlojamiento(id);

            List<UsuarioAlojamiento> ualoj = iusuarioalo.listarUsuarioAlojamiento();
            sesion.setAttribute("aualoj", ualoj);

            response.sendRedirect("ausuarioX.jsp");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AUsuarioX.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AUsuarioX.class.getName()).log(Level.SEVERE, null, ex);
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
