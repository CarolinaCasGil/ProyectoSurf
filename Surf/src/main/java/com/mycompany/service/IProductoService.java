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
public interface IProductoService {

    public List<Producto> listarProducto();

    public List<Producto> listarProductoPorNombre(String nombre);

    public List<Producto> rellenarProductoCarrito();

    public void insertarProducto(Producto producto);

    public void actualizarProducto(Producto producto);

    public void eliminarProducto(int id);


}
