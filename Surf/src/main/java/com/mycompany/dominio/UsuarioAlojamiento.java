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
@Table(name = "usuario_alojamiento")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UsuarioAlojamiento.findAll", query = "SELECT u FROM UsuarioAlojamiento u"),
    @NamedQuery(name = "UsuarioAlojamiento.deleteById", query = "DELETE FROM UsuarioAlojamiento u WHERE u.idUsuarioAlojamiento = :id"),
    @NamedQuery(name = "UsuarioAlojamiento.findByUsuarioId",query = "SELECT u FROM UsuarioAlojamiento u WHERE u.idUsuario = :id"),
//    @NamedQuery(name = "UsuarioAlojamiento.findByIdUsuarioAlojamiento", query = "SELECT u FROM UsuarioAlojamiento u WHERE u.idUsuarioAlojamiento = :idUsuarioAlojamiento")
})
public class UsuarioAlojamiento implements Serializable {

    @Column(name = "fecha_entrada")
    @Temporal(TemporalType.DATE)
    private Date fechaEntrada;
    @Column(name = "fecha_salida")
    @Temporal(TemporalType.DATE)
    private Date fechaSalida;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_usuario_alojamiento")
    private Integer idUsuarioAlojamiento;
    @JoinColumn(name = "id_alojamiento", referencedColumnName = "id_alojamiento")
    @ManyToOne
    private Alojamiento idAlojamiento;
    @JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne
    private Usuario idUsuario;

    public UsuarioAlojamiento() {
    }

    public UsuarioAlojamiento(Date fechaEntrada, Date fechaSalida, Alojamiento idAlojamiento, Usuario idUsuario) {
        this.fechaEntrada = fechaEntrada;
        this.fechaSalida = fechaSalida;
        this.idAlojamiento = idAlojamiento;
        this.idUsuario = idUsuario;
    }

    public UsuarioAlojamiento(Date fechaEntrada, Date fechaSalida, Integer idUsuarioAlojamiento, Alojamiento idAlojamiento, Usuario idUsuario) {
        this.fechaEntrada = fechaEntrada;
        this.fechaSalida = fechaSalida;
        this.idUsuarioAlojamiento = idUsuarioAlojamiento;
        this.idAlojamiento = idAlojamiento;
        this.idUsuario = idUsuario;
    }

    public UsuarioAlojamiento(Alojamiento idAlojamiento, Usuario idUsuario) {
        this.idAlojamiento = idAlojamiento;
        this.idUsuario = idUsuario;
    }
    
    public UsuarioAlojamiento(Integer idUsuarioAlojamiento) {
        this.idUsuarioAlojamiento = idUsuarioAlojamiento;
    }

    public Integer getIdUsuarioAlojamiento() {
        return idUsuarioAlojamiento;
    }

    public void setIdUsuarioAlojamiento(Integer idUsuarioAlojamiento) {
        this.idUsuarioAlojamiento = idUsuarioAlojamiento;
    }

    public Alojamiento getIdAlojamiento() {
        return idAlojamiento;
    }

    public void setIdAlojamiento(Alojamiento idAlojamiento) {
        this.idAlojamiento = idAlojamiento;
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
        hash += (idUsuarioAlojamiento != null ? idUsuarioAlojamiento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UsuarioAlojamiento)) {
            return false;
        }
        UsuarioAlojamiento other = (UsuarioAlojamiento) object;
        if ((this.idUsuarioAlojamiento == null && other.idUsuarioAlojamiento != null) || (this.idUsuarioAlojamiento != null && !this.idUsuarioAlojamiento.equals(other.idUsuarioAlojamiento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("UsuarioAlojamiento{");
        sb.append(", idUsuario=").append(idUsuario);
        sb.append("fechaEntrada=").append(fechaEntrada);
        sb.append(", fechaSalida=").append(fechaSalida);
        sb.append(", idUsuarioAlojamiento=").append(idUsuarioAlojamiento);
        sb.append(", idAlojamiento=").append(idAlojamiento);
        sb.append('}');
        return sb.toString();
    }

    

    public Date getFechaEntrada() {
        return fechaEntrada;
    }

    public void setFechaEntrada(Date fechaEntrada) {
        this.fechaEntrada = fechaEntrada;
    }

    public Date getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }
    
}
