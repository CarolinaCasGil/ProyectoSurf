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
public interface IUsuario_ProductoDAO {

    public List<UsuarioProducto> findAllUsuarioProducto();

    public void insertarUsuarioProducto(UsuarioProducto producto);

    public void actualizarUsuarioProducto(UsuarioProducto producto);

    public void deleteByIdUsuarioProducto(int id);

    public List<UsuarioProducto> usuarioproducto(Usuario usu);

    public List<UsuarioProducto> totalproductoscompradosporporusuario();

}
