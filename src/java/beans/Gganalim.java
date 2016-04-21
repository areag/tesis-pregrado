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
public class Gganalim {

    int idGasto;
    String fecha;
    String componente;
    double kg;
    double preciokg;
    String observacion;
    double costo;

    public Gganalim() {
    }

    public int getIdGasto() {
        return idGasto;
    }

    public String getFecha() {
        return fecha;
    }

    public String getComponente() {
        return componente;
    }

    public double getKg() {
        return kg;
    }

    public double getPreciokg() {
        return preciokg;
    }

    public String getObservacion() {
        return observacion;
    }

    public double getCosto() {
        return costo;
    }

    public void setIdGasto(int idGasto) {
        this.idGasto = idGasto;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setComponente(String componente) {
        this.componente = componente;
    }

    public void setKg(double kg) {
        this.kg = kg;
    }

    public void setPreciokg(double preciokg) {
        this.preciokg = preciokg;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    public boolean guardarGastos(Gganalim GA){
        SQL r= new SQL();
        boolean result= r.ejecutarSql("INSERT INTO gagan( fecha, componente, kg, preciokg, observacion, costo) VALUES ('" + GA.getFecha() + "'," + "'" + GA.getComponente() + "'," + "'" + GA.getKg() + "'," + "'" + GA.getPreciokg() +"'," + "'" + GA.getObservacion() + "'," + "'" + GA.getCosto() + "');");
        return result;
    }
    
     public boolean editarGastos(Gganalim GA){
        SQL r= new SQL();
        boolean result=r.ejecutarSql("UPDATE gagan SET fecha=\"" + GA.getFecha() 
                                                                 + "\", componente=\"" + GA.getComponente() 
                                                                 + "\", kg='" + GA.getKg()
                                                                 + "', preciokg='" + GA.getPreciokg()  
                                                                 + "', observacion=\"" + GA.getObservacion() 
                                                                 + "\", costo='" + GA.getCosto()
                                                                 + "' WHERE idgagan='" + GA.getIdGasto() + "'");
                                                                 
        return result;
    }
     
     public boolean eliminarGasto(int idGasto){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("DELETE FROM gagan WHERE idgagan = '"+idGasto+"'");
        return resul;
        
    }

}
