/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dominio;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author CAROL
 */
@Entity
@Table(name = "usuario_pack")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UsuarioPack.findAll", query = "SELECT u FROM UsuarioPack u"),
    @NamedQuery(name = "UsuarioPack.deleteById", query = "DELETE FROM UsuarioPack u WHERE u.idUsuarioPack = :id"),
    @NamedQuery(name = "UsuarioPack.findByUsuarioId", query = "SELECT u FROM UsuarioPack u WHERE u.idUsuario = :id"), //    @NamedQuery(name = "UsuarioPack.findByIdUsuarioPack", query = "SELECT u FROM UsuarioPack u WHERE u.idUsuarioPack = :idUsuarioPack")
})
public class UsuarioPack implements Serializable {

    @Column(name = "fecha_inicio")
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_usuario_pack")
    private Integer idUsuarioPack;
    @JoinColumn(name = "id_pack", referencedColumnName = "id_pack")
    @ManyToOne
    private Pack idPack;
    @JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne
    private Usuario idUsuario;

    public UsuarioPack() {
    }

    public UsuarioPack(Date fechaInicio, Pack idPack, Usuario idUsuario) {
        this.fechaInicio = fechaInicio;
        this.idPack = idPack;
        this.idUsuario = idUsuario;
    }

    public UsuarioPack(Integer idUsuarioPack, Pack idPack, Usuario idUsuario) {
        this.idUsuarioPack = idUsuarioPack;
        this.idPack = idPack;
        this.idUsuario = idUsuario;
    }

    public UsuarioPack(Date fechaInicio, Integer idUsuarioPack, Pack idPack, Usuario idUsuario) {
        this.fechaInicio = fechaInicio;
        this.idUsuarioPack = idUsuarioPack;
        this.idPack = idPack;
        this.idUsuario = idUsuario;
    }

    public UsuarioPack(Pack idPack, Usuario idUsuario) {
        this.idPack = idPack;
        this.idUsuario = idUsuario;
    }

    public UsuarioPack(Integer idUsuarioPack) {
        this.idUsuarioPack = idUsuarioPack;
    }

    public Integer getIdUsuarioPack() {
        return idUsuarioPack;
    }

    public void setIdUsuarioPack(Integer idUsuarioPack) {
        this.idUsuarioPack = idUsuarioPack;
    }

    public Pack getIdPack() {
        return idPack;
    }

    public void setIdPack(Pack idPack) {
        this.idPack = idPack;
    }

    public Usuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuario idUsuario) {
        this.idUsuario = idUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idUsuarioPack != null ? idUsuarioPack.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UsuarioPack)) {
            return false;
        }
        UsuarioPack other = (UsuarioPack) object;
        if ((this.idUsuarioPack == null && other.idUsuarioPack != null) || (this.idUsuarioPack != null && !this.idUsuarioPack.equals(other.idUsuarioPack))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("UsuarioPack{");
        sb.append(", idUsuario=").append(idUsuario);
        sb.append("fechaInicio=").append(fechaInicio);
        sb.append(", idUsuarioPack=").append(idUsuarioPack);
        sb.append(", idPack=").append(idPack);
        sb.append('}');
        return sb.toString();
    }

    

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

}
