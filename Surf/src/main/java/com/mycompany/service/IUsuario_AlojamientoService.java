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
public interface IUsuario_AlojamientoService {
    
    public List<UsuarioAlojamiento> listarUsuarioAlojamiento();

    public void insertarUsuarioAlojamiento(UsuarioAlojamiento usuarioalojamiento);

    public void actualizarUsuarioAlojamiento(UsuarioAlojamiento usuarioalojamiento);
    
    public void eliminarUsuarioAlojamiento(int id);
    
    public List<UsuarioAlojamiento> findByUsuarioId(Usuario usu);
    
}
