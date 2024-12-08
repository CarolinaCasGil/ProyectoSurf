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
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
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
    @NamedQuery(name = "Alojamiento.findAll", query = "SELECT a FROM Alojamiento a ORDER BY a.idAlojamiento"),
    @NamedQuery(name = "Alojamiento.findByLugar", query = "SELECT a FROM Alojamiento a WHERE a.lugar = :lugar ORDER BY a.idAlojamiento"),
    @NamedQuery(name = "Alojamiento.deleteById",query = "DELETE FROM Alojamiento a WHERE a.idAlojamiento = :id")
})
@Table(name = "alojamiento")
public class Alojamiento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_alojamiento")
    private Integer idAlojamiento;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "nombre")
    private String nombre;
    @Lob
    @Size(max = 65535)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "direccion")
    private String direccion;
    @Lob
    @Size(max = 65535)
    @Column(name = "maps")
    private String maps;
    @Basic(optional = false)
    @NotNull
    @Column(name = "capacidad")
    private int capacidad;
    @Basic(optional = false)
    @NotNull
    @Column(name = "costo")
    private int costo;
    @Size(max = 200)
    @Column(name = "lugar")
    private String lugar;
    @Column(name = "cant_comprada")
    private Integer cantComprada;
    @Size(max = 200)
    @Column(name = "foto1")
    private String foto1;
    @Size(max = 200)
    @Column(name = "foto2")
    private String foto2;
    @Size(max = 200)
    @Column(name = "foto3")
    private String foto3;
    @Size(max = 200)
    @Column(name = "foto4")
    private String foto4;
    @JoinColumn(name = "id_pack", referencedColumnName = "id_pack")
    @ManyToOne
    private Pack idPack;

    public Alojamiento() {
    }

    public Alojamiento(Integer idAlojamiento) {
        this.idAlojamiento = idAlojamiento;
    }

    public Alojamiento(String nombre, String descripcion, String direccion, String maps, int capacidad, int costo, String lugar, Integer cantComprada, String foto1, String foto2, String foto3, String foto4, Pack idPack) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.direccion = direccion;
        this.maps = maps;
        this.capacidad = capacidad;
        this.costo = costo;
        this.lugar = lugar;
        this.cantComprada = cantComprada;
        this.foto1 = foto1;
        this.foto2 = foto2;
        this.foto3 = foto3;
        this.foto4 = foto4;
        this.idPack = idPack;
    }

    public Alojamiento(Integer idAlojamiento, String nombre, String descripcion, String direccion, String maps, int capacidad, int costo, String lugar, Integer cantComprada, String foto1, String foto2, String foto3, String foto4, Pack idPack) {
        this.idAlojamiento = idAlojamiento;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.direccion = direccion;
        this.maps = maps;
        this.capacidad = capacidad;
        this.costo = costo;
        this.lugar = lugar;
        this.cantComprada = cantComprada;
        this.foto1 = foto1;
        this.foto2 = foto2;
        this.foto3 = foto3;
        this.foto4 = foto4;
        this.idPack = idPack;
    }

    public Alojamiento(Integer idAlojamiento, String nombre, String direccion, int capacidad, int costo) {
        this.idAlojamiento = idAlojamiento;
        this.nombre = nombre;
        this.direccion = direccion;
        this.capacidad = capacidad;
        this.costo = costo;
    }

    public Integer getIdAlojamiento() {
        return idAlojamiento;
    }

    public void setIdAlojamiento(Integer idAlojamiento) {
        this.idAlojamiento = idAlojamiento;
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

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getMaps() {
        return maps;
    }

    public void setMaps(String maps) {
        this.maps = maps;
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

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public Integer getCantComprada() {
        return cantComprada;
    }

    public void setCantComprada(Integer cantComprada) {
        this.cantComprada = cantComprada;
    }

    public String getFoto1() {
        return foto1;
    }

    public void setFoto1(String foto1) {
        this.foto1 = foto1;
    }

    public String getFoto2() {
        return foto2;
    }

    public void setFoto2(String foto2) {
        this.foto2 = foto2;
    }

    public String getFoto3() {
        return foto3;
    }

    public void setFoto3(String foto3) {
        this.foto3 = foto3;
    }

    public String getFoto4() {
        return foto4;
    }

    public void setFoto4(String foto4) {
        this.foto4 = foto4;
    }

    public Pack getIdPack() {
        return idPack;
    }

    public void setIdPack(Pack idPack) {
        this.idPack = idPack;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idAlojamiento != null ? idAlojamiento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Alojamiento)) {
            return false;
        }
        Alojamiento other = (Alojamiento) object;
        if ((this.idAlojamiento == null && other.idAlojamiento != null) || (this.idAlojamiento != null && !this.idAlojamiento.equals(other.idAlojamiento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Alojamiento{");
        sb.append("idAlojamiento=").append(idAlojamiento);
        sb.append(", nombre=").append(nombre);
        sb.append('}');
        return sb.toString();
    }

  

   

}
