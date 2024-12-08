/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.data;

import com.mycompany.dominio.Alojamiento;
import com.mycompany.dominio.Usuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

/**
 *
 * @author CAROL
 */
@Stateless
public class AlojamientoDAO implements IAlojamientoDAO {

    @PersistenceContext(unitName = "SurfPU")
    EntityManager em;

    @Override
    public List<Alojamiento> findAllAlojamiento() {
        return em.createNamedQuery("Alojamiento.findAll").getResultList();
    }

    @Override
    public Alojamiento findAlojamientoId(Alojamiento alojamiento) {
        return em.find(Alojamiento.class, alojamiento.getIdAlojamiento());
    }

    @Transactional
    @Override
    public void insertarAlojamiento(Alojamiento alojamiento) {
        em.persist(alojamiento);
    }

    @Transactional
    @Override
    public void actualizarAlojamiento(Alojamiento alojamiento) {
        em.merge(alojamiento);
    }

    @Override
    public void borrarAlojamiento(Alojamiento alojamiento) {
        em.merge(alojamiento);
    }

    @Override
    public List<Alojamiento> findAlojamientoByLugar(String lugar) {
        TypedQuery<Alojamiento> query = em.createNamedQuery("Alojamiento.findByLugar", Alojamiento.class);
        query.setParameter("lugar", lugar);
        return query.getResultList();
    }

    @Transactional
    @Override
    public void deleteByIdAlojamiento(int id) {
        int deletedCount = em.createNamedQuery("Alojamiento.deleteById").setParameter("id", id).executeUpdate();
    }

}
