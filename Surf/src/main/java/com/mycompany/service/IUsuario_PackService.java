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
public interface IUsuario_PackService {

    public List<UsuarioPack> listarUsuarioPack();

    public void insertarUsuarioPack(UsuarioPack usuariopack);

    public void actualizarUsuarioPack(UsuarioPack usuariopack);

    public void eliminarUsuarioPack(int id);

    public List<UsuarioPack> findByUsuarioId(Usuario usu);

}
