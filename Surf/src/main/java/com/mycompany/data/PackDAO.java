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
import javax.transaction.Transactional;

/**
 *
 * @author CAROL
 */
@Stateless
public class PackDAO implements IPackDAO{
    
    @PersistenceContext(unitName="SurfPU")
    EntityManager em;
    
    @Override
    public List<Pack> findAllPack() {
        return em.createNamedQuery("Pack.findAll").getResultList();
    }

    @Override
    public Pack findPackId(Pack pack) {
        return em.find(Pack.class, pack.getIdPack());
    }

    @Transactional
    @Override
    public void insertarPack(Pack pack) {
        em.persist(pack);
    }

    @Transactional
    @Override
    public void actualizarPack(Pack pack) {
        em.merge(pack);
    }

    @Override
    public void borrarPack(Pack pack) {
        em.merge(pack);
    }
    
    @Transactional
    @Override
    public void deleteByIdPack(int id) {
        int deletedCount = em.createNamedQuery("Pack.deleteById").setParameter("id", id).executeUpdate();
    }
    
}
