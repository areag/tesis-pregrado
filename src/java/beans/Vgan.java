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
public class Vgan {

    int idVenta;
    int nroVenta;
    String fecha;
    int dencierre;
    double kgTernero;
    double precioKg;
    int cantidad;
    double kgVendido;
    double valor;

    public Vgan() {
    }

    public int getIdVenta() {
        return idVenta;
    }

    public int getNroVenta() {
        return nroVenta;
    }

    public String getFecha() {
        return fecha;
    }

    public int getDencierre() {
        return dencierre;
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

    public double getKgVendido() {
        return kgVendido;
    }

    public double getValor() {
        return valor;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public void setNroVenta(int nroVenta) {
        this.nroVenta = nroVenta;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setDencierre(int dencierre) {
        this.dencierre = dencierre;
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

    public void setKgVendido(double kgVendido) {
        this.kgVendido = kgVendido;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public boolean guardarVentas(Vgan VG) {
        SQL r = new SQL();
        boolean result = r.ejecutarSql("INSERT INTO vgan ( numeroVenta, fecha, dencierre, kgTernero, precioKg, cantidad, kgVendido, valor)"
                + " VALUES ('" + VG.getNroVenta() + "',"
                + "'" + VG.getFecha() + "',"
                + "'" + VG.getDencierre() + "',"
                + "'" + VG.getKgTernero() + "',"
                + "'" + VG.getPrecioKg() + "',"
                + "'" + VG.getCantidad() + "',"
                + "'" + VG.getKgVendido() + "',"
                + "'" + VG.getValor() + "');");
        return result;

    }

    public boolean editarVentas(Vgan VG) {
        SQL r = new SQL();
        boolean result = r.ejecutarSql("UPDATE vgan SET "
                                                        + "numeroVenta='" + VG.getNroVenta()
                                                        + "', fecha='" + VG.getFecha()
                                                        + "', dencierre='" + VG.getDencierre()
                                                        + "', kgTernero='" + VG.getKgTernero()
                                                        + "', precioKg='" + VG.getPrecioKg()
                                                        + "', cantidad='" + VG.getCantidad()
                                                        + "', kgVendido='" + VG.getKgVendido()
                                                        + "', valor='" + VG.getValor()
                                                        + "' WHERE numeroVenta='" + VG.getNroVenta() + "'");

        return result;
    }
    
    public boolean eliminarVenta(int nroVenta){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("DELETE FROM vgan WHERE numeroVenta = '" + nroVenta + "'");
        return resul;
        
    }

}
