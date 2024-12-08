/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.data.*;
import com.mycompany.dominio.Pack;
import java.util.List;
import javax.ejb.Stateless;
import javax.inject.Inject;

/**
 *
 * @author CAROL
 */
@Stateless
public class PackService implements IPackService{

      
    @Inject
    private IPackDAO ipackdao;
    
    @Override
    public List<Pack> listarPack() {
          return ipackdao.findAllPack();
    }

    @Override
    public void insertarPack(Pack pack) {
       ipackdao.insertarPack(pack);
    }

    @Override
    public void actualizarPack(Pack pack) {
        ipackdao.actualizarPack(pack);
    }

    @Override
    public void eliminarPack(int id) {
        ipackdao.deleteByIdPack(id);
    }
    
    
}
