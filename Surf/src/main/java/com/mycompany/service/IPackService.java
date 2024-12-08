/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.dominio.*;
import java.util.List;

/**
 *
 * @author CAROL
 */
public interface IPackService {
        
    public List<Pack> listarPack();
    
     public void insertarPack(Pack pack);

    public void actualizarPack(Pack pack);
    
    public void eliminarPack(int id);
    
}
