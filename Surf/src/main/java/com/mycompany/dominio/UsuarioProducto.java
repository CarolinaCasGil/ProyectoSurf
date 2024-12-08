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
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author CAROL
 */
@Entity
@Table(name = "usuario_producto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UsuarioProducto.findAll", query = "SELECT u FROM UsuarioProducto u"),
    @NamedQuery(
            name = "UsuarioProducto.findProductosByUsuarioId",
            query = "SELECT u FROM UsuarioProducto u WHERE u.idUsuario = :id"),
//            query = "SELECT p.id_producto, p.nombre, up.cantidad, p.costo, p.foto, u.idUsuario"
//            + " FROM Producto p "
//            + " JOIN UsuarioProducto up ON p.id_producto = up.producto.idProducto "
//            + " JOIN Usuario u ON up.usuario.idUsuario = u.idUsuario "
//            + " WHERE u.idUsuario = :id"
    @NamedQuery(name = "UsuarioProducto.totalProductosCompradosPorUsuario", query = "SELECT up.idUsuario, SUM(up.cantidad) AS total_productos_comprados FROM UsuarioProducto up GROUP BY up.idUsuario"),
    @NamedQuery(name = "UsuarioProducto.deleteById", query = "DELETE FROM UsuarioProducto u WHERE u.idUsuarioProducto = :id")
//    @NamedQuery(name = "UsuarioProducto.findByIdUsuarioProducto", query = "SELECT u FROM UsuarioProducto u WHERE u.idUsuarioProducto = :idUsuarioProducto"),
//    @NamedQuery(name = "UsuarioProducto.findByFechaPedido", query = "SELECT u FROM UsuarioProducto u WHERE u.fechaPedido = :fechaPedido"),
//    @NamedQuery(name = "UsuarioProducto.findByCantidad", query = "SELECT u FROM UsuarioProducto u WHERE u.cantidad = :cantidad")

})
public class UsuarioProducto implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidad")
    private int cantidad;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_usuario_producto")
    private Integer idUsuarioProducto;
    @Column(name = "fecha_pedido")
    @Temporal(TemporalType.DATE)
    private Date fechaPedido;
    @JoinColumn(name = "id_producto", referencedColumnName = "id_producto")
    @ManyToOne(optional = false)
    private Producto idProducto;
    @JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne
    private Usuario idUsuario;

    public UsuarioProducto() {
    }

     
    public UsuarioProducto(int cantidad, Date fechaPedido, Producto idProducto, Usuario idUsuario) {
        this.cantidad = cantidad;
        this.fechaPedido = fechaPedido;
        this.idProducto = idProducto;
        this.idUsuario = idUsuario;
    }

    public UsuarioProducto(int cantidad, Date fechaPedido, Producto idProducto) {
        this.cantidad = cantidad;
        this.fechaPedido = fechaPedido;
        this.idProducto = idProducto;
    }

    public UsuarioProducto(int cantidad, Integer idUsuarioProducto, Date fechaPedido, Producto idProducto, Usuario idUsuario) {
        this.cantidad = cantidad;
        this.idUsuarioProducto = idUsuarioProducto;
        this.fechaPedido = fechaPedido;
        this.idProducto = idProducto;
        this.idUsuario = idUsuario;
    }

    public UsuarioProducto(Integer idUsuarioProducto) {
        this.idUsuarioProducto = idUsuarioProducto;
    }

    public UsuarioProducto(Integer idUsuarioProducto, int cantidad) {
        this.idUsuarioProducto = idUsuarioProducto;
        this.cantidad = cantidad;
    }

    public Integer getIdUsuarioProducto() {
        return idUsuarioProducto;
    }

    public void setIdUsuarioProducto(Integer idUsuarioProducto) {
        this.idUsuarioProducto = idUsuarioProducto;
    }

    public Date getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(Date fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public Producto getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Producto idProducto) {
        this.idProducto = idProducto;
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
        hash += (idUsuarioProducto != null ? idUsuarioProducto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UsuarioProducto)) {
            return false;
        }
        UsuarioProducto other = (UsuarioProducto) object;
        if ((this.idUsuarioProducto == null && other.idUsuarioProducto != null) || (this.idUsuarioProducto != null && !this.idUsuarioProducto.equals(other.idUsuarioProducto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("UsuarioProducto{");
        sb.append(", idUsuario=").append(idUsuario);
        sb.append("cantidad=").append(cantidad);
        sb.append(", idUsuarioProducto=").append(idUsuarioProducto);
        sb.append(", fechaPedido=").append(fechaPedido);
        sb.append(", idProducto=").append(idProducto);
        sb.append('}');
        return sb.toString();
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

}
