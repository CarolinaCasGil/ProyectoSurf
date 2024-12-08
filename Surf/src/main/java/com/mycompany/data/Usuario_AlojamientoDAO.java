/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.data;

import com.mycompany.dominio.Usuario;
import com.mycompany.dominio.UsuarioAlojamiento;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

/**
 *
 * @author CAROL
 */
public class Usuario_AlojamientoDAO implements IUsuario_AlojamientoDAO {

    @PersistenceContext(unitName = "SurfPU")
    EntityManager em;

    @Override
    public List<UsuarioAlojamiento> findAllUsuarioAlojamiento() {
        return em.createNamedQuery("UsuarioAlojamiento.findAll").getResultList();
    }

    @Override
    public UsuarioAlojamiento findUsuarioAlojamientoId(UsuarioAlojamiento usuarioalojamiento) {
        return em.find(UsuarioAlojamiento.class, usuarioalojamiento.getIdUsuarioAlojamiento());
    }

    @Transactional
    @Override
    public void insertarUsuarioAlojamiento(UsuarioAlojamiento usuarioalojamiento) {
        em.persist(usuarioalojamiento);
    }

    @Transactional
    @Override
    public void actualizarUsuarioAlojamiento(UsuarioAlojamiento usuarioalojamiento) {
        em.merge(usuarioalojamiento);
    }

    @Override
    public void borrarUsuarioAlojamiento(UsuarioAlojamiento usuarioalojamiento) {
        em.merge(usuarioalojamiento);
    }

    @Transactional
    @Override
    public void deleteByIdUsuarioAlojamiento(int id) {
        int deletedCount = em.createNamedQuery("UsuarioAlojamiento.deleteById").setParameter("id", id).executeUpdate();
    }

    @Transactional
    @Override
    public List<UsuarioAlojamiento> findByUsuarioId(Usuario usu) {
        return em.createNamedQuery("UsuarioAlojamiento.findByUsuarioId", UsuarioAlojamiento.class).setParameter("id", usu).getResultList();
    }

}
