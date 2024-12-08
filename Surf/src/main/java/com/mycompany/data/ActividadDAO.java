/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.data;

import com.mycompany.dominio.Actividad;
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
public class ActividadDAO implements IActividadDAO {

    @PersistenceContext(unitName = "SurfPU")
    EntityManager em;

    @Override
    public List<Actividad> findAllActividad() {
        return em.createNamedQuery("Actividad.findAll").getResultList();
    }

    @Override
    public Actividad findActividadId(Actividad actividad) {
        return em.find(Actividad.class, actividad.getId_actividad());
    }

    @Transactional
    @Override
    public void insertarActividad(Actividad actividad) {
        em.persist(actividad);
    }

    @Transactional
    @Override
    public void actualizarActividad(Actividad actividad) {
        em.merge(actividad);
    }

    @Override
    public void borrarActividad(Actividad actividad) {
        em.merge(actividad);
    }

    @Transactional
    @Override
    public void deleteByIdActividad(int id) {
        int deletedCount = em.createNamedQuery("Actividad.deleteById").setParameter("id", id).executeUpdate();
    }

}
