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
public interface IUsuario_PackDAO {

    public List<UsuarioPack> findAllUsuarioPack();

    public UsuarioPack findUsuarioPackId(UsuarioPack usuariopack);

    public void insertarUsuarioPack(UsuarioPack usuariopack);

    public void actualizarUsuarioPack(UsuarioPack usuariopack);

    public void borrarUsuarioPack(UsuarioPack usuariopack);

    public void deleteByIdUsuarioPack(int id);

    public List<UsuarioPack> findByUsuarioId(Usuario usu);

}
