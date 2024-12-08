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
public interface IUsuario_AlojamientoDAO {

    public List<UsuarioAlojamiento> findAllUsuarioAlojamiento();

    public UsuarioAlojamiento findUsuarioAlojamientoId(UsuarioAlojamiento usuarioalojamiento);

    public void insertarUsuarioAlojamiento(UsuarioAlojamiento usuarioalojamiento);

    public void actualizarUsuarioAlojamiento(UsuarioAlojamiento usuarioalojamiento);

    public void borrarUsuarioAlojamiento(UsuarioAlojamiento usuarioalojamiento);

    public void deleteByIdUsuarioAlojamiento(int id);

    public List<UsuarioAlojamiento> findByUsuarioId(Usuario usu);

}
