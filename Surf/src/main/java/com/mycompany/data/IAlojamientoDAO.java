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
public interface IAlojamientoDAO {
    
    public List<Alojamiento> findAllAlojamiento();
    
    public List<Alojamiento> findAlojamientoByLugar(String lugar);
    
    public Alojamiento findAlojamientoId(Alojamiento alojamiento);
    
    public void insertarAlojamiento(Alojamiento alojamiento);
    
    public void actualizarAlojamiento (Alojamiento alojamiento);
    
    public void borrarAlojamiento(Alojamiento alojamiento);
    
    public void deleteByIdAlojamiento(int id);
}
