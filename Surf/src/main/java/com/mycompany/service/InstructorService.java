/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.service;

import com.mycompany.data.*;
import com.mycompany.dominio.Instructor;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author CAROL
 */
public class InstructorService implements IInstructorService {

    @Inject
    private IInstructorDAO iinstructordao;

    @Override
    public List<Instructor> listarInstructor() {
        return iinstructordao.findAllInstructor();
    }

    @Override
    public void insertarInstructor(Instructor instructor) {
        iinstructordao.insertarInstructor(instructor);
    }

    @Override
    public void actualizarInstructor(Instructor instructor) {
        iinstructordao.actualizarInstructor(instructor);
    }

    @Override
    public void eliminarInstructor(Instructor instructor) {
        iinstructordao.borrarInstructor(instructor);
    }

}
