/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.data;

import com.mycompany.dominio.Usuario;
import com.mycompany.dominio.UsuarioPack;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

/**
 *
 * @author CAROL
 */
public class Usuario_PackDAO implements IUsuario_PackDAO {

    @PersistenceContext(unitName = "SurfPU")
    EntityManager em;

    @Override
    public List<UsuarioPack> findAllUsuarioPack() {
        return em.createNamedQuery("UsuarioPack.findAll").getResultList();
    }

    @Override
    public UsuarioPack findUsuarioPackId(UsuarioPack usuariopack) {
        return em.find(UsuarioPack.class, usuariopack.getIdUsuarioPack());
    }

    @Transactional
    @Override
    public void insertarUsuarioPack(UsuarioPack usuariopack) {
        em.persist(usuariopack);
    }

    @Transactional
    @Override
    public void actualizarUsuarioPack(UsuarioPack usuariopack) {
        em.remove(em.merge(usuariopack));
    }

    @Override
    public void borrarUsuarioPack(UsuarioPack usuariopack) {
        em.merge(usuariopack);
    }

    @Transactional
    @Override
    public void deleteByIdUsuarioPack(int id) {
        int deletedCount = em.createNamedQuery("UsuarioPack.deleteById").setParameter("id", id).executeUpdate();
    }
    
    @Transactional
    @Override
    public List<UsuarioPack> findByUsuarioId(Usuario usu) {
        return em.createNamedQuery("UsuarioPack.findByUsuarioId", UsuarioPack.class).setParameter("id", usu).getResultList();
    }

}
