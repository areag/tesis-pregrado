/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import com.SQL;
/**
 *
 * @author nulia
 */
public class GCAgri {
    
    String gasto;
    String obser;
    double costo;
    int idVenta;
    int idGasto;
    
    public GCAgri() {
    }

    public GCAgri(int idGasto, String gasto, String obser, double costo, int idVenta) {
        this.idGasto = idGasto;
        this.gasto = gasto;
        this.obser = obser;
        this.costo = costo;
        this.idVenta = idVenta;
    }

    public int getIdGasto() {
        return idGasto;
    }

    public void setIdGasto(int idGasto) {
        this.idGasto = idGasto;
    }

    public String getGasto() {
        return gasto;
    }

    public void setGasto(String gasto) {
        this.gasto = gasto;
    }

    public String getObser() {
        return obser;
    }

    public void setObser(String obser) {
        this.obser = obser;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    public boolean guardarGC (GCAgri gc){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("INSERT INTO gcagri (Gasto, Observacion, Costo, idVenta) VALUES (\"" + gc.getGasto() + "\",\"" + gc.getObser()+ "\",'" + gc.getCosto() + "','" + gc.getIdVenta() + "')");
        return resul;
    }
    public boolean editarGC (GCAgri gc){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("UPDATE gcagri SET Gasto=\""+gc.getGasto()+"\",Observacion=\""+gc.getObser()+"\",Costo='"+gc.getCosto()+"' WHERE idGastosComAgri='"+gc.getIdGasto()+"'");
        return resul;
    }
    public boolean eliminarGC(int idGC){
        SQL r = new SQL();
        boolean resul =r.ejecutarSql("DELETE FROM gcagri WHERE idGastosComAgri= '"+idGC+"'");
        return resul;
    }
}