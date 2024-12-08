/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.dominio.Usuario;
import java.util.List;

/**
 *
 * @author CAROL
 */
public interface IUsuarioService {

    public List<Usuario> listarUsuarios();

    public void insertarUsuarios(Usuario usuario);

    public void actualizarUsuarios(Usuario usuario);
    
    public void eliminarUsuarios(int id);

}
