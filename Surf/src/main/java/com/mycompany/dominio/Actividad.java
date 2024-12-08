/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dominio;

import java.util.Collection;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author CAROL
 */
@Entity
@NamedQueries({
    @NamedQuery(name="Actividad.findAll", query = "SELECT a FROM Actividad a ORDER BY a.id_actividad"),
    @NamedQuery(name = "Actividad.deleteById",query = "DELETE FROM Actividad a WHERE a.id_actividad = :id")
})

@Table(name="actividad")
public class Actividad {

    @Basic(optional = false)
    @NotNull()
    @Size(min = 1, max = 30)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "capacidad")
    private int capacidad;
    @Basic(optional = false)
    @NotNull
    @Column(name = "costo")
    private int costo;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_actividad")
    private Integer id_actividad;
    @OneToMany(mappedBy = "idActividad")
    private Collection<Instructor> instructorCollection;
    @OneToMany(mappedBy = "idActividad")
    private Collection<Pack> packCollection;
       
   


    public int getId_actividad() {
        return id_actividad;
    }

    public void setId_actividad(int id_actividad) {
        this.id_actividad = id_actividad;
    }

    public Actividad() {
    }

    public Actividad(int id_actividad, String nombre, String descripcion, int capacidad, int costo) {
        this.id_actividad = id_actividad;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.capacidad = capacidad;
        this.costo = costo;
    }

    public Actividad(String nombre, String descripcion, int capacidad, int costo) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.capacidad = capacidad;
        this.costo = costo;
    }


    @Override
    public int hashCode() {
        int hash = 5;
        hash = 47 * hash + this.id_actividad;
        hash = 47 * hash + Objects.hashCode(this.nombre);
        hash = 47 * hash + Objects.hashCode(this.descripcion);
        hash = 47 * hash + this.capacidad;
        hash = 47 * hash + this.costo;
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
        final Actividad other = (Actividad) obj;
        if (this.id_actividad != other.id_actividad) {
            return false;
        }
        if (this.capacidad != other.capacidad) {
            return false;
        }
        if (this.costo != other.costo) {
            return false;
        }
        if (!Objects.equals(this.nombre, other.nombre)) {
            return false;
        }
        return Objects.equals(this.descripcion, other.descripcion);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Actividad{");
        sb.append(", id_actividad=").append(id_actividad);
        sb.append("nombre=").append(nombre);
        sb.append('}');
        return sb.toString();
    }

    

    public Actividad(Integer idActividad) {
        this.id_actividad = idActividad;
    }

    public Actividad(Integer idActividad, String nombre, String descripcion, int capacidad, int costo) {
        this.id_actividad = idActividad;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.capacidad = capacidad;
        this.costo = costo;
    }

    public Integer getIdActividad() {
        return id_actividad;
    }

    public void setIdActividad(Integer idActividad) {
        this.id_actividad = idActividad;
    }


    @XmlTransient
    public Collection<Instructor> getInstructorCollection() {
        return instructorCollection;
    }

    public void setInstructorCollection(Collection<Instructor> instructorCollection) {
        this.instructorCollection = instructorCollection;
    }

    @XmlTransient
    public Collection<Pack> getPackCollection() {
        return packCollection;
    }

    public void setPackCollection(Collection<Pack> packCollection) {
        this.packCollection = packCollection;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }

   
}
