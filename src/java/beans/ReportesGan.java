/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import com.SQL;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Guille
 */
public class ReportesGan {

    SQL sql = new SQL();
    String conexion ="";
    int idreportesgan;
    String fecha;
    int eft;
    int efn;
    double ppt;
    double ppn;
    double prom_t;
    double prom_n;
    double porc_gc;

    public int getIdreportesgan() {
        return idreportesgan;
    }

    public String getFecha() {
        return fecha;
    }

    public int getEft() {
        return eft;
    }

    public int getEfn() {
        return efn;
    }

    public double getPpt() {
        return ppt;
    }

    public double getPpn() {
        return ppn;
    }

    public double getProm_t() {
        return prom_t;
    }

    public double getProm_n() {
        return prom_n;
    }

    public double getPorc_gc() {
        return porc_gc;
    }

    public void setIdreportesgan(int idreportesgan) {
        this.idreportesgan = idreportesgan;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setEft(int eft) {
        this.eft = eft;
    }

    public void setEfn(int efn) {
        this.efn = efn;
    }

    public void setPpt(double ppt) {
        this.ppt = ppt;
    }

    public void setPpn(double ppn) {
        this.ppn = ppn;
    }

    public void setProm_t(double prom_t) {
        this.prom_t = prom_t;
    }

    public void setProm_n(double prom_n) {
        this.prom_n = prom_n;
    }

    public void setPorc_gc(double porc_gc) {
        this.porc_gc = porc_gc;
    }
    


    public int EFT() throws SQLException {
        int eft = 0;
        int eft_ant = 0;
        int compras = 0;
        sql.conexion("root", "root");
        ResultSet rs = sql.consultar("SELECT eft FROM reportesgan WHERE fecha = '" + this.getFecha() + "';");
        ResultSet rs1 = sql.consultar(" SELECT ROUND(SUM(cgan.cantidad), 2) AS compras FROM cgan WHERE fecha >= '" + this.getFecha() + "' ORDER BY fecha desc");
       while(rs.next()){
           rs.last();
           eft_ant = rs.getInt("eft");
           System.out.println("eft anterior es" + eft_ant);
       }   
       this.eft = eft_ant;
          
       while(rs1.next()){
           compras = rs1.getInt("compras");
           System.out.println("compras anterior es:" +compras);
     
       }
       
       
       return eft = compras ;

    }

}
