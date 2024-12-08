/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.data.*;
import com.mycompany.dominio.Usuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.inject.Inject;

/**
 *
 * @author CAROL
 */
@Stateless
public class UsuarioService implements IUsuarioService{
    
    @Inject
    private IUsuarioDAO iusuariodao;

    @Override
    public List<Usuario> listarUsuarios() {
        return iusuariodao.findAllUsuario();
    }
    
    @Override
    public void  insertarUsuarios(Usuario usuario) {
        iusuariodao.insertarUsuario(usuario);
    }

    @Override
    public void actualizarUsuarios(Usuario usuario) {
        iusuariodao.actualizarUsuario(usuario);
    }

    @Override
    public void eliminarUsuarios(int id ) {
       iusuariodao.deleteByIdUsuario(id);
    }
  
}
