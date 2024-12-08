/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.data;

import com.mycompany.dominio.Instructor;
import java.util.List;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

/**
 *
 * @author CAROL
 */
@Stateless
public class InstructorDAO implements IInstructorDAO {

    @PersistenceContext(unitName = "SurfPU")
    EntityManager em;

    @Override
    public List<Instructor> findAllInstructor() {
        return em.createNamedQuery("Instructor.findAll").getResultList();
    }

    @Override
    public Instructor findInstructorId(Instructor instructor) {
        return em.find(Instructor.class, instructor.getId_instructor());
    }

    @Transactional
    @Override
    public void insertarInstructor(Instructor instructor) {
        em.persist(instructor);
    }

    @Override
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void actualizarInstructor(Instructor instructor) {
        em.merge(instructor);
    }

    @Override
    public void borrarInstructor(Instructor instructor) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Transactional
    @Override
    public void deleteByIdInstructor(int id) {
        int deletedCount = em.createNamedQuery("Instructor.deleteById").setParameter("id", id).executeUpdate();
    }
}
