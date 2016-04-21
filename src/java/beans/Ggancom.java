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
public class Ggancom {
    
    int idGasto;
    String gasto;
    String observacion;
    double costo;
    int idCompra;
    int idVenta;

    public Ggancom() {
    }

    public int getIdGasto() {
        return idGasto;
    }

    public String getGasto() {
        return gasto;
    }

    public String getObservacion() {
        return observacion;
    }

    public double getCosto() {
        return costo;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public int getIdVenta() {
        return idVenta;
    }
    
    public void setIdGasto(int idGasto) {
        this.idGasto = idGasto;
    }

    public void setGasto(String gasto) {
        this.gasto = gasto;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }
    
    
    
    public boolean guardarGC1 (Ggancom GGC){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("INSERT INTO gcgan (gasto, observacion, costo, idCompra) VALUES (\"" + GGC.getGasto() + "\"," + "\"" + GGC.getObservacion() + "\"," + "'" + GGC.getCosto() + "'," + "'" + GGC.getIdCompra() + "'" + ");");
        return resul;
    }
    
    public boolean guardarGC2 (Ggancom GGC){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("INSERT INTO gcgan (gasto, observacion, costo, idVenta) VALUES (\"" + GGC.getGasto() + "\"," + "\"" + GGC.getObservacion() + "\"," + "'" + GGC.getCosto() + "'," + "'" + GGC.getIdVenta() + "'" + ");");
        return resul;
    }
    
    public boolean editarGC (Ggancom GGC){
        SQL r= new SQL();
        boolean resul =  r.ejecutarSql("UPDATE gcgan SET gasto=\"" + GGC.getGasto() + "\", observacion=\"" + GGC.getObservacion() + "\", costo='" + GGC.getCosto() + "' WHERE idgcgan='" + GGC.getIdGasto() + "'");
        return resul;
    }
    
    public boolean eliminarGC(int idGasto){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("DELETE FROM gcgan WHERE idgcgan = '"+idGasto+"'");
        return resul;
        
    }
}
