/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.data.*;
import com.mycompany.dominio.Carrito;
import com.mycompany.dominio.Producto;
import java.util.List;
import javax.ejb.Stateless;
import javax.inject.Inject;

/**
 *
 * @author CAROL
 */
@Stateless
public class ProductoService implements IProductoService {

    @Inject
    private IProductoDAO iproductodao;

    @Override
    public List<Producto> listarProducto() {
        return iproductodao.findAllProducto();
    }

    @Override
    public List<Producto> rellenarProductoCarrito() {
         return iproductodao.rellenarProductoCarrito();
    }
    
    @Override
    public void insertarProducto(Producto producto) {
        iproductodao.insertarProducto(producto);
    }

    @Override
    public void actualizarProducto(Producto producto) {
        iproductodao.actualizarProducto(producto);
    }

    @Override
    public void eliminarProducto(int id) {
        iproductodao.deleteByIdProducto(id);
    }
    
    @Override
    public List<Producto> listarProductoPorNombre(String nombre) {
        return iproductodao.findAllProductoByName(nombre);
    }


}
