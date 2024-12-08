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
public interface IInstructorService {

    public List<Instructor> listarInstructor();

    public void insertarInstructor(Instructor instructor);

    public void actualizarInstructor(Instructor instructor);

    public void eliminarInstructor(Instructor instructor);

}
