/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.data;

import com.mycompany.dominio.Producto;
import com.mycompany.dominio.Usuario;
import com.mycompany.dominio.UsuarioProducto;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

/**
 *
 * @author CAROL
 */
public class Usuario_ProductoDAO implements IUsuario_ProductoDAO {

    @PersistenceContext(unitName = "SurfPU")
    EntityManager em;

    @Override
    public List<UsuarioProducto> findAllUsuarioProducto() {
        return em.createNamedQuery("UsuarioProducto.findAll").getResultList();
    }

    @Transactional
    @Override
    public void insertarUsuarioProducto(UsuarioProducto producto) {
        em.persist(producto);
    }

    @Transactional
    @Override
    public void actualizarUsuarioProducto(UsuarioProducto producto) {
        em.merge(producto);
    }


    @Transactional
    @Override
    public void deleteByIdUsuarioProducto(int id) {
        int deletedCount = em.createNamedQuery("UsuarioProducto.deleteById").setParameter("id", id).executeUpdate();
    }

    @Transactional
    @Override
    public List<UsuarioProducto> usuarioproducto(Usuario usu) {
        TypedQuery<UsuarioProducto> query = em.createNamedQuery("UsuarioProducto.findProductosByUsuarioId", UsuarioProducto.class);
        query.setParameter("id", usu);
        return query.getResultList();
    }
    
    @Override
    public List<UsuarioProducto> totalproductoscompradosporporusuario() {
        return em.createQuery("SELECT new com.mycompany.dominio.UsuarioProducto(up.idUsuario, SUM(up.cantidad)) "
                + "FROM UsuarioProducto up "
                + "GROUP BY up.idUsuario", UsuarioProducto.class)
                .getResultList();
    }

}
