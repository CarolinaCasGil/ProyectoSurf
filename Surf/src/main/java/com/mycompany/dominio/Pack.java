/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dominio;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author CAROL
 */
@Entity
@Table(name = "pack")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pack.findAll", query = "SELECT p FROM Pack p"),
    @NamedQuery(name = "Pack.deleteById",query = "DELETE FROM Pack p WHERE p.idPack = :id")
//    @NamedQuery(name = "Pack.findByIdPack", query = "SELECT p FROM Pack p WHERE p.idPack = :idPack"),
//    @NamedQuery(name = "Pack.findByCantActv", query = "SELECT p FROM Pack p WHERE p.cantActv = :cantActv"),
//    @NamedQuery(name = "Pack.findByCosto", query = "SELECT p FROM Pack p WHERE p.costo = :costo"),
//    @NamedQuery(name = "Pack.findByCantComprada", query = "SELECT p FROM Pack p WHERE p.cantComprada = :cantComprada")
})
public class Pack implements Serializable {

    @Basic(optional = false)
    @NotNull()
    @Column(name = "cant_actv")
    private int cantActv;
    @Basic(optional = false)
    @NotNull
    @Column(name = "costo")
    private int costo;
    @Size(max = 200)
    @Column(name = "titulo")
    private String titulo;
    @Lob()
    @Size(max = 65535)
    @Column(name = "descripcion")
    private String descripcion;
    @Size(max = 200)
    @Column(name = "foto")
    private String foto;
    @OneToMany(mappedBy = "idPack")
    private Collection<Alojamiento> alojamientoCollection;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_pack")
    private Integer idPack;
    @Column(name = "cant_comprada")
    private Integer cantComprada;
    @JoinColumn(name = "id_actividad", referencedColumnName = "id_actividad")
    @ManyToOne
    private Actividad idActividad;

    public Pack() {
    }

    public Pack(int cantActv, int costo, String titulo, String descripcion, String foto, Integer cantComprada, Actividad idActividad) {
        this.cantActv = cantActv;
        this.costo = costo;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.foto = foto;
        this.cantComprada = cantComprada;
        this.idActividad = idActividad;
    }

    public Pack(int cantActv, int costo, String titulo, String descripcion, String foto, Integer idPack, Integer cantComprada, Actividad idActividad) {
        this.cantActv = cantActv;
        this.costo = costo;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.foto = foto;
        this.idPack = idPack;
        this.cantComprada = cantComprada;
        this.idActividad = idActividad;
    }

   

    public Pack(Integer idPack) {
        this.idPack = idPack;
    }

    public Pack(Integer idPack, int cantActv, int costo) {
        this.idPack = idPack;
        this.cantActv = cantActv;
        this.costo = costo;
    }

    public Integer getIdPack() {
        return idPack;
    }

    public void setIdPack(Integer idPack) {
        this.idPack = idPack;
    }

    public int getCantActv() {
        return cantActv;
    }

    public void setCantActv(int cantActv) {
        this.cantActv = cantActv;
    }


    public Integer getCantComprada() {
        return cantComprada;
    }

    public void setCantComprada(Integer cantComprada) {
        this.cantComprada = cantComprada;
    }

    public Actividad getIdActividad() {
        return idActividad;
    }

    public void setIdActividad(Actividad idActividad) {
        this.idActividad = idActividad;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPack != null ? idPack.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pack)) {
            return false;
        }
        Pack other = (Pack) object;
        if ((this.idPack == null && other.idPack != null) || (this.idPack != null && !this.idPack.equals(other.idPack))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Pack{");
        sb.append(", idActividad=").append(idActividad);
        sb.append(", titulo=").append(titulo);
        sb.append('}');
        return sb.toString();
    }


 

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    @XmlTransient
    public Collection<Alojamiento> getAlojamientoCollection() {
        return alojamientoCollection;
    }

    public void setAlojamientoCollection(Collection<Alojamiento> alojamientoCollection) {
        this.alojamientoCollection = alojamientoCollection;
    }

   
}
