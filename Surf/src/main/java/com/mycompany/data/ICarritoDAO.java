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
public interface ICarritoDAO {

    public List<Carrito> findAllCarrito();

    public List<Carrito> rellenarCarrito();

    public Pack findCarritoId(Carrito carrito);

    public void insertarCarrito(Carrito carrito);

    public void actualizarCarrito(Carrito carrito);

    public void borrarCarrito(Carrito carrrito);

    public void deleteByIdCarrito(int id);

}
