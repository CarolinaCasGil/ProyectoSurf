/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.data.*;
import com.mycompany.dominio.Actividad;
import java.util.List;
import javax.ejb.Stateless;
import javax.inject.Inject;

/**
 *
 * @author CAROL
 */
@Stateless
public class ActividadService implements IActividadService{

    @Inject
    private IActividadDAO iactividaddao;
    
    @Override
    public List<Actividad> listarActividades() {
        return iactividaddao.findAllActividad();
    }

    @Override
    public void insertarActividad(Actividad actividad) {
        iactividaddao.insertarActividad(actividad);
    }

    @Override
    public void actualizarActividad(Actividad actividad) {
        iactividaddao.actualizarActividad(actividad);
    }

    @Override
    public void eliminarActividad(int id) {
        iactividaddao.deleteByIdActividad(id);
    }
    
}
