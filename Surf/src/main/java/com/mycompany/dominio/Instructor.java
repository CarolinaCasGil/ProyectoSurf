/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dominio;

import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author CAROL
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Instructor.findAll", query = "SELECT i FROM Instructor i ORDER BY i.id_instructor"),
    @NamedQuery(name = "Instructor.deleteById", query = "DELETE FROM Instructor i WHERE i.id_instructor = :id")

})
@Table(name = "instructor")
public class Instructor {

    @Basic(optional = false)
    @NotNull()
    @Size(min = 1, max = 50)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 80)
    @Column(name = "apellido")
    private String apellido;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 90)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 9)
    @Column(name = "telefono")
    private String telefono;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_instructor")
    private Integer id_instructor;
    @JoinColumn(name = "id_actividad", referencedColumnName = "id_actividad")
    @ManyToOne
    private Actividad idActividad;

    public Instructor() {

    }

    public int getId_instructor() {
        return id_instructor;
    }

    public void setId_instructor(int id_instructor) {
        this.id_instructor = id_instructor;
    }

    public Instructor(String apellido, String email, String telefono, Integer id_instructor, Actividad idActividad) {
        this.apellido = apellido;
        this.email = email;
        this.telefono = telefono;
        this.id_instructor = id_instructor;
        this.idActividad = idActividad;
    }

    public Instructor(String nombre, String apellido, String email, String telefono, Integer id_instructor, Actividad idActividad) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.telefono = telefono;
        this.id_instructor = id_instructor;
        this.idActividad = idActividad;
    }

    public Actividad getId_actividad() {
        return idActividad;
    }

    public void setId_actividad(int id_actividad) {
        this.idActividad = idActividad;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + this.id_instructor;
        hash = 97 * hash + Objects.hashCode(this.nombre);
        hash = 97 * hash + Objects.hashCode(this.apellido);
        hash = 97 * hash + Objects.hashCode(this.email);
        hash = 97 * hash + Objects.hashCode(this.telefono);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Instructor other = (Instructor) obj;
        if (this.id_instructor != other.id_instructor) {
            return false;
        }
        if (this.idActividad != other.idActividad) {
            return false;
        }
        if (!Objects.equals(this.nombre, other.nombre)) {
            return false;
        }
        if (!Objects.equals(this.apellido, other.apellido)) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        return Objects.equals(this.telefono, other.telefono);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Instructor{");
        sb.append(", idActividad=").append(idActividad);
        sb.append("nombre=").append(nombre);
        sb.append('}');
        return sb.toString();
    }

    

    public Instructor(Integer idInstructor) {
        this.id_instructor = idInstructor;
    }

    public Instructor(Integer idInstructor, String nombre, String apellido, String email, String telefono) {
        this.id_instructor = idInstructor;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.telefono = telefono;
    }

    public Integer getIdInstructor() {
        return id_instructor;
    }

    public void setIdInstructor(Integer idInstructor) {
        this.id_instructor = idInstructor;
    }

    public Actividad getIdActividad() {
        return idActividad;
    }

    public void setIdActividad(Actividad idActividad) {
        this.idActividad = idActividad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

}
