/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import com.SQL;

/**
 *
 * @author Guille
 */
public class Cgan {
    
    int idCompra;
    int numeroCompra;
    String fecha;
    double kgTernero;
    double precioKg;
    int cantidad;
    double costo;

    public Cgan() {
    }

    public int getIdCompra() {
        return idCompra;
    }

    public int getNumeroCompra() {
        return numeroCompra;
    }

    public String getFecha() {
        return fecha;
    }

    public double getKgTernero() {
        return kgTernero;
    }

    public double getPrecioKg() {
        return precioKg;
    }

    public int getCantidad() {
        return cantidad;
    }

    public double getCosto() {
        return costo;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public void setNumeroCompra(int numeroCompra) {
        this.numeroCompra = numeroCompra;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setKgTernero(double kgTernero) {
        this.kgTernero = kgTernero;
    }

    public void setPrecioKg(double precioKg) {
        this.precioKg = precioKg;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    public boolean guardarCompra(Cgan CG){
        SQL r= new SQL();
        boolean result= r.ejecutarSql("INSERT INTO cgan( numeroCompra, fecha, kgTernero, precioKg, cantidad, costo) VALUES ('" + CG.getNumeroCompra() + "'," + "'" + CG.getFecha() + "'," + "'" + CG.getKgTernero() + "'," + "'" + CG.getPrecioKg() +"'," + "'" + CG.getCantidad() + "'," + "'" + CG.getCosto() + "');");
        return result;
    }
    
    public boolean editarCompra(Cgan CG){
        SQL r= new SQL();
        boolean result=r.ejecutarSql("UPDATE cgan SET numeroCompra='" + CG.getNumeroCompra() 
                                                                 + "', fecha='" + CG.getFecha()
                                                                 + "', kgTernero='" + CG.getKgTernero()
                                                                 + "', precioKg='" + CG.getPrecioKg()
                                                                 + "', cantidad='" + CG.getCantidad()
                                                                 + "', costo='" + CG.getCosto()
                                                                 + "' WHERE numeroCompra='" + CG.getNumeroCompra() + "'");
                                                                 
        return result;
    }
    
    public boolean eliminarCompra(int nroCompra){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("DELETE FROM cgan WHERE numeroCompra = '" + nroCompra + "'");
        return resul;
        
    }
    
    
}
