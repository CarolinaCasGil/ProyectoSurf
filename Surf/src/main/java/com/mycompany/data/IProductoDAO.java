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
public interface IProductoDAO {

    public List<Producto> findAllProducto();

    public List<Producto> findAllProductoByName(String nombre);

    public List<Producto> rellenarProductoCarrito();

    public Producto findProductoId(Producto producto);

    public void insertarProducto(Producto producto);

    public void actualizarProducto(Producto producto);

    public void borrarProducto(Producto producto);

    public void deleteByIdProducto(int id);

}
