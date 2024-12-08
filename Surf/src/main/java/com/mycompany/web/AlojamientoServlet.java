/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.web;

import com.mycompany.dominio.*;
import com.mycompany.service.*;
import java.io.IOException;
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
@WebServlet(name = "AlojamientoServlet", urlPatterns = {"/alojamientos"})
public class AlojamientoServlet extends HttpServlet {

    @Inject
    IAlojamientoService ialojamientoservice;

    @Inject
    IPackService ipack;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Alojamiento> alojamiento = ialojamientoservice.listarAlojamientos();
        List<Pack> p = ipack.listarPack();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("alojamiento", null);
        sesion.setAttribute("apack", null);

        sesion.setAttribute("apack", p);
        sesion.setAttribute("aalojamiento", alojamiento);
        response.sendRedirect("aalojamiento.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
