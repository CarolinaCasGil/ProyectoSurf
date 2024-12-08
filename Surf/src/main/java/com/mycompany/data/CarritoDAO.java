/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.data;

import com.mycompany.dominio.*;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

/**
 *
 * @author CAROL
 */
@Stateless
public class CarritoDAO implements ICarritoDAO {

    @PersistenceContext(unitName = "SurfPU")
    EntityManager em;

    @Override
    public List<Carrito> findAllCarrito() {
        return em.createNamedQuery("Carrito.findAll").getResultList();
    }

    @Override
    public List<Carrito> rellenarCarrito() {
        Query query = em.createQuery("SELECT DISTINCT p.id_producto, p.nombre, p.cantidad, p.costo, p.foto FROM Carrito c JOIN c.idProducto p JOIN c.idUsuario u");
        return query.getResultList();
    }

    @Override
    public Pack findCarritoId(Carrito carrito) {
        return em.find(Pack.class, carrito.getIdCarrito());
    }

    @Transactional
    @Override
    public void insertarCarrito(Carrito carrito) {
        em.persist(carrito);
    }

    @Transactional
    @Override
    public void actualizarCarrito(Carrito carrito) {
        em.merge(carrito);
    }

    @Transactional
    @Override
    public void deleteByIdCarrito(int id) {
        int deletedCount = em.createNamedQuery("Carrito.deleteById").setParameter("id", id).executeUpdate();
    }

    @Override
    public void borrarCarrito(Carrito carrrito) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
