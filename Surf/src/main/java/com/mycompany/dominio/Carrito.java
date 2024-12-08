/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dominio;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author CAROL
 */
@Entity
@Table(name = "carrito")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Carrito.findAll", query = "SELECT c FROM Carrito c "),
    @NamedQuery(name = "Carrito.rellenarCarrito",
            query = "SELECT DISTINCT p.id_producto, p.nombre, p.cantidad, p.costo, p.foto "
            + "FROM Carrito c "
            + "JOIN Producto p ON c.id_producto = p.id_producto "
            + "JOIN Usuario u ON c.id_usuario = u.id_usuario;"),
     @NamedQuery(name = "Carrito.deleteById", query = "DELETE FROM Carrito c WHERE c.idCarrito = :id")
//    @NamedQuery(name = "Carrito.findByIdCarrito", query = "SELECT c FROM Carrito c WHERE c.idCarrito = :idCarrito")
})
public class Carrito implements Serializable {

    @Column(name = "cantidad")
    private Integer cantidad;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_carrito")
    private Integer idCarrito;
    @JoinColumn(name = "id_producto", referencedColumnName = "id_producto")
    @ManyToOne
    private Producto idProducto;
    @JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne
    private Usuario idUsuario;

    public Carrito() {
    }

    public Carrito(Producto idProducto, Usuario idUsuario) {
        this.idProducto = idProducto;
        this.idUsuario = idUsuario;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Carrito(Integer cantidad, Producto idProducto, Usuario idUsuario) {
        this.cantidad = cantidad;
        this.idProducto = idProducto;
        this.idUsuario = idUsuario;
    }

    public Carrito(Integer cantidad, Integer idCarrito, Producto idProducto, Usuario idUsuario) {
        this.cantidad = cantidad;
        this.idCarrito = idCarrito;
        this.idProducto = idProducto;
        this.idUsuario = idUsuario;
    }

    public Carrito(Integer idCarrito) {
        this.idCarrito = idCarrito;
    }

    public Integer getIdCarrito() {
        return idCarrito;
    }

    public void setIdCarrito(Integer idCarrito) {
        this.idCarrito = idCarrito;
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
        hash += (idCarrito != null ? idCarrito.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Carrito)) {
            return false;
        }
        Carrito other = (Carrito) object;
        if ((this.idCarrito == null && other.idCarrito != null) || (this.idCarrito != null && !this.idCarrito.equals(other.idCarrito))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Carrito{");
        sb.append(", idCarrito=").append(idCarrito);
        sb.append("cantidad=").append(cantidad);
        sb.append(", idProducto=").append(idProducto);
        sb.append(", idUsuario=").append(idUsuario);
        sb.append('}');
        return sb.toString();
    }

   

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

   
  
}
