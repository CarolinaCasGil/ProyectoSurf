/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.data.*;
import com.mycompany.dominio.Carrito;
import java.util.List;
import javax.ejb.Stateless;
import javax.inject.Inject;

/**
 *
 * @author CAROL
 */
@Stateless
public class CarritoService implements ICarritoService {

    @Inject
    private ICarritoDAO icarritodao;

    @Override
    public List<Carrito> listarCArrito() {
        return icarritodao.findAllCarrito();
    }

    @Override
    public List<Carrito> rellenarCarrito() {
         return icarritodao.rellenarCarrito();
    }
    
    @Override
    public void insertarCarrito(Carrito carrito) {
        icarritodao.insertarCarrito(carrito);
    }

    @Override
    public void actualizarCarrito(Carrito carrito) {
        icarritodao.actualizarCarrito(carrito);
    }

    @Override
    public void eliminarCarrito(int id) {
        icarritodao.deleteByIdCarrito(id);
    }

    

}
