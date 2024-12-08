/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.data.*;
import com.mycompany.dominio.Usuario;
import com.mycompany.dominio.UsuarioPack;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author CAROL
 */
public class Usuario_PackService implements IUsuario_PackService {

    @Inject
    private IUsuario_PackDAO iusuariopackdao;

    @Override
    public List<UsuarioPack> listarUsuarioPack() {
        return iusuariopackdao.findAllUsuarioPack();
    }

    @Override
    public void insertarUsuarioPack(UsuarioPack usuariopack) {
        iusuariopackdao.insertarUsuarioPack(usuariopack);
    }

    @Override
    public void actualizarUsuarioPack(UsuarioPack usuariopack) {
        iusuariopackdao.actualizarUsuarioPack(usuariopack);
    }

    @Override
    public void eliminarUsuarioPack(int id) {
        iusuariopackdao.deleteByIdUsuarioPack(id);
    }

    @Override
    public List<UsuarioPack> findByUsuarioId(Usuario usu) {
        return iusuariopackdao.findByUsuarioId(usu);
    }

}
