/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.data.*;
import com.mycompany.dominio.Alojamiento;
import java.util.List;
import javax.ejb.Stateless;
import javax.inject.Inject;

/**
 *
 * @author CAROL
 */
@Stateless
public class AlojamientoService implements IAlojamientoService {

    @Inject
    private IAlojamientoDAO ialojamientodao;

    @Override
    public List<Alojamiento> listarAlojamientos() {
        return ialojamientodao.findAllAlojamiento();
    }

    @Override
    public void insertarAlojamiento(Alojamiento alojamiento) {
        ialojamientodao.insertarAlojamiento(alojamiento);
    }

    @Override
    public void actualizarAlojamiento(Alojamiento alojamiento) {
        ialojamientodao.actualizarAlojamiento(alojamiento);
    }

    @Override
    public void eliminarAlojamiento(int id) {
        ialojamientodao.deleteByIdAlojamiento(id);
    }

    @Override
    public List<Alojamiento> listarAlojamientosPorLugar(String lugar) {
       return ialojamientodao.findAlojamientoByLugar(lugar);
    }

}
