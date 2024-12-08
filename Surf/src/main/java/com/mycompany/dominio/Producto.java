/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dominio;

import java.util.Collection;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
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
    @NamedQuery(name = "Producto.findAll", query = "SELECT p FROM Producto p ORDER BY p.id_producto"),
    @NamedQuery(name = "Producto.findAllByName", query = "SELECT p FROM Producto p WHERE p.nombre LIKE :nombre ORDER BY p.id_producto"),
    @NamedQuery(name = "Producto.deleteById", query = "DELETE FROM Producto p WHERE p.id_producto = :id")

})
@Table(name = "producto")
public class Producto {

    @Basic(optional = false)
    @NotNull()
    @Size(min = 1, max = 50)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidad")
    private int cantidad;
    @Basic(optional = false)
    @NotNull
    @Column(name = "costo")
    private int costo;
    @Size(max = 200)
    @Column(name = "foto")
    private String foto;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idProducto")
    private Collection<UsuarioProducto> usuarioProductoCollection;
    @OneToMany(mappedBy = "idProducto")
    private Collection<Carrito> carritoCollection;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_producto")
    private Integer id_producto;
    @Column(name = "cant_comprada")
    private Integer cantComprada;

    public Producto(String nombre, int cantidad, int costo, String foto, Integer cantComprada) {
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.costo = costo;
        this.foto = foto;
        this.cantComprada = cantComprada;
    }

    public Producto(String nombre, int cantidad, int costo, String foto, Integer id_producto, Integer cantComprada) {
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.costo = costo;
        this.foto = foto;
        this.id_producto = id_producto;
        this.cantComprada = cantComprada;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public Producto() {
    }

    public Producto(String nombre, int cantidad, int costo) {
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.costo = costo;
    }

    public Producto(int id_producto, String nombre, int cantidad, int costo) {
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.costo = costo;
    }

    public Producto(String nombre, int cantidad, int costo, String foto, Collection<Carrito> carritoCollection, Integer id_producto, Integer cantComprada, Collection<Usuario> usuarioCollection) {
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.costo = costo;
        this.foto = foto;
        this.carritoCollection = carritoCollection;
        this.id_producto = id_producto;
        this.cantComprada = cantComprada;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 71 * hash + this.id_producto;
        hash = 71 * hash + Objects.hashCode(this.nombre);
        hash = 71 * hash + this.cantidad;
        hash = 71 * hash + this.costo;
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
        final Producto other = (Producto) obj;
        if (this.id_producto != other.id_producto) {
            return false;
        }
        if (this.cantidad != other.cantidad) {
            return false;
        }
        if (this.costo != other.costo) {
            return false;
        }
        return Objects.equals(this.nombre, other.nombre);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Producto{");
        sb.append(", id_producto=").append(id_producto);
        sb.append("nombre=").append(nombre);
        sb.append('}');
        return sb.toString();
    }

    

    public Producto(Integer idProducto) {
        this.id_producto = idProducto;
    }

    public Producto(Integer idProducto, String nombre, int cantidad, int costo) {
        this.id_producto = idProducto;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.costo = costo;
    }

    public Integer getIdProducto() {
        return id_producto;
    }

    public void setIdProducto(Integer idProducto) {
        this.id_producto = idProducto;
    }

    public Integer getCantComprada() {
        return cantComprada;
    }

    public void setCantComprada(Integer cantComprada) {
        this.cantComprada = cantComprada;
    }

    @XmlTransient
    public Collection<Carrito> getCarritoCollection() {
        return carritoCollection;
    }

    public void setCarritoCollection(Collection<Carrito> carritoCollection) {
        this.carritoCollection = carritoCollection;
    }
    @XmlTransient
    public Collection<UsuarioProducto> getUsuarioProductoCollection() {
        return usuarioProductoCollection;
    }
    public void setUsuarioProductoCollection(Collection<UsuarioProducto> usuarioProductoCollection) {
        this.usuarioProductoCollection = usuarioProductoCollection;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

}
