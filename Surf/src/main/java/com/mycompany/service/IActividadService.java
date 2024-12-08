/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.dominio.*;
import java.util.List;

/**
 *
 * @author CAROL
 */
public interface IActividadService {

    public List<Actividad> listarActividades();

    public void insertarActividad(Actividad actividad);

    public void actualizarActividad(Actividad actividad);

    public void eliminarActividad(int id);

}
