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
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

/**
 *
 * @author CAROL
 */
@Stateless
public class ProductoDAO implements IProductoDAO {

    @PersistenceContext(unitName = "SurfPU")
    EntityManager em;

    @Override
    public List<Producto> findAllProducto() {
        return em.createNamedQuery("Producto.findAll").getResultList();
    }

    @Override
    public List<Producto> rellenarProductoCarrito() {
        Query query = em.createQuery("SELECT DISTINCT p "
                + "FROM Producto p "
                + "JOIN p.Carrito c "
                + "JOIN c.Usuario u "
                + "WHERE p.id_producto = c.id_producto AND c.id_usuario = u.id_usuario");
        return query.getResultList();
    }

    @Override
    public Producto findProductoId(Producto producto) {
        return em.find(Producto.class, producto.getId_producto());
    }

    @Override
    @Transactional
    public void insertarProducto(Producto producto) {
        em.persist(producto);
    }

    @Override
    @Transactional
    public void actualizarProducto(Producto producto) {
        em.merge(producto);
    }

    @Override
    public void borrarProducto(Producto producto) {
        em.remove(producto);
    }

    @Override
    public List<Producto> findAllProductoByName(String nombre) {
        Query query = em.createNamedQuery("Producto.findAllByName", Producto.class)
                .setParameter("nombre", "%" + nombre + "%");
        return query.getResultList();
    }
    
    @Transactional
    @Override
    public void deleteByIdProducto(int id) {
        int deletedCount = em.createNamedQuery("Producto.deleteById").setParameter("id", id).executeUpdate();
    }
    

}
