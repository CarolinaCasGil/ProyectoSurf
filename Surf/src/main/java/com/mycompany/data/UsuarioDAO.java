/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.data;

import com.mycompany.dominio.Usuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

/**
 *
 * @author CAROL
 */
@Stateless
public class UsuarioDAO implements IUsuarioDAO {

    @PersistenceContext(unitName = "SurfPU")
    EntityManager em;

    @Override
    public List<Usuario> findAllUsuario() {
        return em.createNamedQuery("Usuario.findAll").getResultList();
    }

    @Override
    public Usuario findUsuarioId(Usuario usuario) {
        return em.find(Usuario.class, usuario.getIdUsuario());
    }

    @Transactional
    @Override
    public void insertarUsuario(Usuario usuario) {
        em.persist(usuario);
    }

    @Transactional
    @Override
    public void actualizarUsuario(Usuario usuario) {
        em.merge(usuario);
    }

    @Override
    public void borrarUsuario(Usuario usuario) {
        em.remove(usuario);
    }

    @Transactional
    @Override
    public void deleteByIdUsuario(int id) {
        int deletedCount = em.createNamedQuery("Usuario.deleteById").setParameter("id", id).executeUpdate();
    }

}
