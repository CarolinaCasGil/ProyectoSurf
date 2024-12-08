/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.data.*;
import com.mycompany.dominio.*;
import java.io.Serializable;
import java.util.List;
import javax.inject.Inject;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author CAROL
 */
public class Usuario_ProductoService implements IUsusario_ProductoService {

    @Inject
    private IUsuario_ProductoDAO iusuarioproductodao;

    @Override
    public List<UsuarioProducto> listarProducto() {
        return iusuarioproductodao.findAllUsuarioProducto();
    }
    @Override
    public List<UsuarioProducto> totalproductoscompradosporporusuario() {
        return iusuarioproductodao.totalproductoscompradosporporusuario();
    }

    @Override
    public void insertarProducto(UsuarioProducto producto) {
        iusuarioproductodao.insertarUsuarioProducto(producto);
    }

    @Override
    public void actualizarProducto(UsuarioProducto producto) {
        iusuarioproductodao.actualizarUsuarioProducto(producto);
    }

    @Override
    public void eliminarProducto(int id) {
        iusuarioproductodao.deleteByIdUsuarioProducto(id);
    }

    @Override
    public List<UsuarioProducto> usuarioporducto(Usuario usu) {
        return iusuarioproductodao.usuarioproducto(usu);
    }

}
