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
public class GPAgri {
    int idGasto;
    String fecha;
    String gasto;
    String descripcion;
    String obser;
    double costo;   

    public GPAgri() {
    }

    public GPAgri(int idGasto, String fecha, String gasto, String descripcion, String obser, double costo) {
        this.idGasto = idGasto;
        this.fecha = fecha;
        this.gasto = gasto;
        this.descripcion = descripcion;
        this.obser = obser;
        this.costo = costo;
    }

    public int getIdGasto() {
        return idGasto;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getObser() {
        return obser;
    }

    public void setObser(String obser) {
        this.obser = obser;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
     public boolean guardarGP (GPAgri gp){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("INSERT INTO `areagbd`.`gpagri` (`gasto`, `desc`, `obser`, `costo`, `fecha`) VALUES ('" + gp.getGasto() + "','" + gp.getDescripcion()+ "','" + gp.getObser() + "','" + gp.getCosto() + "','"+gp.getFecha()+"')");
        return resul;
    }
    public boolean editarGP (GPAgri gp){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("UPDATE `areagbd`.`gpagri` SET `gasto`=\""+gp.getGasto()+"\", `desc`=\""+gp.getDescripcion()+"\", `obser`=\""+gp.getObser()+"\", `costo`='"+gp.getCosto()+"' WHERE `idgpagri`='"+gp.getIdGasto()+"'");
        return resul;
    }
    public boolean eliminarGP (GPAgri gp){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("DELETE FROM gpagri WHERE idgpagri='"+gp.getIdGasto()+"'");
        return resul;
    }

    @Override
    public String toString() {
        return "**********************GPAgri{" + "fecha=" + fecha + ", gasto=" + gasto + ", descripcion=" + descripcion + ", obser=" + obser + ", costo=" + costo + '}';
    }
    
}