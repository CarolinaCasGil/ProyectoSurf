/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.data;

import com.mycompany.dominio.*;
import java.util.List;

/**
 *
 * @author CAROL
 */
public interface IUsuarioDAO {

    public List<Usuario> findAllUsuario();

    public Usuario findUsuarioId(Usuario usuario);

    public void insertarUsuario(Usuario usuario);

    public void actualizarUsuario(Usuario usuario);

    public void borrarUsuario(Usuario usuario);

    public void deleteByIdUsuario(int id);
}
