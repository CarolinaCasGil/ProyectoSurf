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
public interface IUsusario_ProductoService {

    public List<UsuarioProducto> listarProducto();
    
    public List<UsuarioProducto> totalproductoscompradosporporusuario();

    public void insertarProducto(UsuarioProducto producto);

    public void actualizarProducto(UsuarioProducto producto);

    public void eliminarProducto(int id);

    public List<UsuarioProducto> usuarioporducto(Usuario usu);

}
