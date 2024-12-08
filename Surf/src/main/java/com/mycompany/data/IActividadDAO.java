/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.data;

import com.mycompany.dominio.*;
import java.util.List;

/**
 *
 * @author CAROL
 */
public interface IActividadDAO {
    
    public List<Actividad> findAllActividad();
    
    public Actividad findActividadId(Actividad actividad);
    
    public void insertarActividad(Actividad actividad);
    
    public void actualizarActividad (Actividad actividad);
    
    public void borrarActividad(Actividad actividad);
    
    public void deleteByIdActividad (int id);
}
