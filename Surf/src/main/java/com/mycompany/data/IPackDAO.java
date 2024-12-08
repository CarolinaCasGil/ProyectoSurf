/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.data;

import com.mycompany.dominio.Pack;
import com.mycompany.dominio.Producto;
import java.util.List;

/**
 *
 * @author CAROL
 */
public interface IPackDAO {

    public List<Pack> findAllPack();

    public Pack findPackId(Pack pack);

    public void insertarPack(Pack pack);

    public void actualizarPack(Pack pack);

    public void borrarPack(Pack pack);

    public void deleteByIdPack(int id);

}
