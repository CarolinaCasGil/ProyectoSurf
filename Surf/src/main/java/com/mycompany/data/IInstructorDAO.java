/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.data;

import com.mycompany.dominio.*;
import java.util.List;
import javax.transaction.Transactional;

/**
 *
 * @author CAROL
 */
public interface IInstructorDAO {
    
    public List<Instructor> findAllInstructor();
    
    public Instructor findInstructorId(Instructor instructor);
    
    public void insertarInstructor(Instructor instructor);
    
    public void actualizarInstructor (Instructor instructor);
    
    public void borrarInstructor(Instructor instructor);
    
    public void deleteByIdInstructor(int id);
    
}
