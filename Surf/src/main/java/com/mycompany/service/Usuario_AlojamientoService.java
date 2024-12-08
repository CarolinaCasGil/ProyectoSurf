/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.data.*;
import com.mycompany.dominio.Usuario;
import com.mycompany.dominio.UsuarioAlojamiento;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author CAROL
 */
public class Usuario_AlojamientoService implements IUsuario_AlojamientoService{

    @Inject
    private IUsuario_AlojamientoDAO iusuarioalojamientodao;
    
    @Override
    public List<UsuarioAlojamiento> listarUsuarioAlojamiento() {
        return iusuarioalojamientodao.findAllUsuarioAlojamiento();
    }

    @Override
    public void insertarUsuarioAlojamiento(UsuarioAlojamiento usuarioalojamiento) {
        iusuarioalojamientodao.insertarUsuarioAlojamiento(usuarioalojamiento);
    }

    @Override
    public void actualizarUsuarioAlojamiento(UsuarioAlojamiento usuarioalojamiento) {
        iusuarioalojamientodao.actualizarUsuarioAlojamiento(usuarioalojamiento);
    }

    @Override
    public void eliminarUsuarioAlojamiento(int id) {
        iusuarioalojamientodao.deleteByIdUsuarioAlojamiento(id);
    }
    @Override
    public List<UsuarioAlojamiento> findByUsuarioId(Usuario usu) {
        return iusuarioalojamientodao.findByUsuarioId(usu);
    }
    
}
