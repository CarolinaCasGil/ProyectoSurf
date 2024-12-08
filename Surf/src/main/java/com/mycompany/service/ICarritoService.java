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
public interface ICarritoService {

    public List<Carrito> listarCArrito();
    
    public List<Carrito> rellenarCarrito();

    public void insertarCarrito(Carrito carrito);

    public void actualizarCarrito(Carrito carrito);

    public void eliminarCarrito(int id);
    
}
