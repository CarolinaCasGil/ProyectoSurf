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
public interface IAlojamientoService {

    public List<Alojamiento> listarAlojamientos();

    public List<Alojamiento> listarAlojamientosPorLugar(String lugar);

    public void insertarAlojamiento(Alojamiento alojamiento);

    public void actualizarAlojamiento(Alojamiento alojamiento);

    public void eliminarAlojamiento(int id);

}
