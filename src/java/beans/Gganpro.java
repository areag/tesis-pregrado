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
public class Gganpro {
    
    int idGasto;
    String gasto;
    String descripcion;
    String fecha;
    double costo; 

    public Gganpro() {
    }

    public int getIdGasto() {
        return idGasto;
    }

    public String getGasto() {
        return gasto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getFecha() {
        return fecha;
    }

    public double getCosto() {
        return costo;
    }

    public void setIdGasto(int idGasto) {
        this.idGasto = idGasto;
    }

    public void setGasto(String gasto) {
        this.gasto = gasto;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    
    
    public boolean guardarGastos(Gganpro GG){
        SQL r= new SQL();
        boolean result= r.ejecutarSql("INSERT INTO gpgan( fecha, gasto, observacion, costo) VALUES ('" + GG.getFecha() + "'," + "'" + GG.getGasto() + "'," + "'" + GG.getDescripcion() + "'," + "'" + GG.getCosto() +"');");
        return result;
    }
    
    public boolean editarGastos(Gganpro GG){
        SQL r= new SQL();
        boolean result=r.ejecutarSql("UPDATE gpgan SET fecha=\"" + GG.getFecha() + "\", gasto=\"" + GG.getGasto() +"\", observacion=\"" + GG.getDescripcion() + "\", costo='" + GG.getCosto() + "' WHERE idgpgan='" + GG.getIdGasto() + "'");
        return result;
    }
    
    public boolean eliminarGasto(int idGasto){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("DELETE FROM gpgan WHERE idgpgan = '"+idGasto+"'");
        return resul;
        
    }

  
    
           
    
    
}
