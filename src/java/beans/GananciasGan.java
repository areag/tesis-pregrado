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
public class GananciasGan {

    SQL sql = new SQL();
    String conexion ="";
    String fecha_desde = "";
    String fecha_hasta = "";
    double ingreso_bruto = 0;
    double total_GCV = 0;
    double ingreso_neto = 0;
    double total_GG = 0;
    double round_total_GG = 0;
    double total_GCC = 0;
    double gastos_GR = 0;
    double ganancia = 0;
    double round_ganancia = 0;

    public String getFecha_desde() {
        return fecha_desde;
    }

    public String getFecha_hasta() {
        return fecha_hasta;
    }
     
    public double getIngreso_bruto() {
        return ingreso_bruto;
    }

    public double getTotal_GCV() {
        return total_GCV;
    }

    public double getIngreso_neto() {
        return ingreso_neto;
    }

    public double getTotal_GG() {
        return total_GG;
    }

    public double getRound_total_GG() {
        return round_total_GG;
    }

    public double getTotal_GCC() {
        return total_GCC;
    }

    public double getGastos_GR() {
        return gastos_GR;
    }

    public double getGanancia() {
        return ganancia;
    }

    public double getRound_ganancia() {
        return round_ganancia;
    }

    public void setFecha_desde(String fecha_desde) {
        this.fecha_desde = fecha_desde;
    }

    public void setFecha_hasta(String fecha_hasta) {
        this.fecha_hasta = fecha_hasta;
    }

    
    public void setIngreso_bruto(double ingreso_bruto) {
        this.ingreso_bruto = ingreso_bruto;
    }

    public void setTotal_GCV(double total_GCV) {
        this.total_GCV = total_GCV;
    }

    public void setIngreso_neto(double ingreso_neto) {
        this.ingreso_neto = ingreso_neto;
    }

    public void setTotal_GG(double total_GG) {
        this.total_GG = total_GG;
    }

    public void setRound_total_GG(double round_total_GG) {
        this.round_total_GG = round_total_GG;
    }

    public void setTotal_GCC(double total_GCC) {
        this.total_GCC = total_GCC;
    }

    public void setGastos_GR(double gastos_GR) {
        this.gastos_GR = gastos_GR;
    }

    public void setGanancia(double ganancia) {
        this.ganancia = ganancia;
    }

    public void setRound_ganancia(double round_ganancia) {
        this.round_ganancia = round_ganancia;
    }
    
    public double ingreso_bruto(String fecha_desde, String fecha_hasta) throws SQLException {
        
    String conexion = sql.conexion("root", "root");
        ResultSet rs = sql.consultar("SELECT ROUND(SUM(valor), 2) AS ingreso_bruto FROM vgan WHERE fecha >= '" + fecha_desde + "' AND fecha <= '" + fecha_hasta + "' order by fecha desc");
        while (rs.next()) {
            ingreso_bruto = rs.getDouble("ingreso_bruto");
        }
        return ingreso_bruto;
    }

    public double total_GCV(String fecha_desde, String fecha_hasta) throws SQLException {
         
    String conexion = sql.conexion("root", "root");
        ResultSet rs = sql.consultar("SELECT ROUND(SUM(gcgan.costo), 2) AS total_GCV FROM vgan JOIN gcgan ON vgan.numeroVenta = gcgan.IdVenta WHERE vgan.fecha >= '" + fecha_desde + "' AND vgan.fecha <= '" + fecha_hasta + "' order by fecha desc;");
        while (rs.next()) {
            total_GCV = rs.getDouble("total_GCV");
        }
        return total_GCV;
    }

    public double ingreso_neto() {
        ingreso_neto = this.ingreso_bruto - this.total_GCV;
        return ingreso_neto = Math.round(ingreso_neto * Math.pow(10, 2)) / Math.pow(10, 2);
    }

    public double total_GG(String fecha_desde, String fecha_hasta) throws SQLException {
        
    String conexion = sql.conexion("root", "root");
        ResultSet rs1 = sql.consultar("SELECT ROUND(SUM(costo),2) AS gastoProd FROM gpgan WHERE fecha >= '" + fecha_desde + "' AND fecha <= '" + fecha_hasta + "' order by fecha desc");
        ResultSet rs2 = sql.consultar("SELECT ROUND(SUM(costo),2) AS gastoAlim FROM gagan WHERE fecha >= '" + fecha_desde + "' AND fecha <= '" + fecha_hasta + "' order by fecha desc");
        if (!rs1.next() || !rs2.next()) {
            total_GG = (rs1.getDouble("gastoProd") + rs2.getDouble("gastoAlim"));
        } else {

            total_GG = (rs1.getDouble("gastoProd") + rs2.getDouble("gastoAlim"));
        }
        return total_GG = Math.round(total_GG * Math.pow(10, 2)) / Math.pow(10, 2);
    }

    public double gastos_GR(String fecha_desde, String fecha_hasta) throws SQLException {
      
    String conexion = sql.conexion("root", "root");
        ResultSet rs = sql.consultar("SELECT ROUND(SUM(costo), 2) AS gastos_GR FROM cgan WHERE fecha >= '" + fecha_desde + "' AND fecha <= '" + fecha_hasta + "' order by fecha desc");
        while (rs.next()) {
            gastos_GR = rs.getDouble("gastos_GR");
        }
        return gastos_GR;
    }
    
    
    public double total_GCC(String fecha_desde, String fecha_hasta) throws SQLException {
       
    String conexion = sql.conexion("root", "root");
        ResultSet rs = sql.consultar("SELECT ROUND(SUM(gcgan.costo), 2) AS total_GCC FROM gcgan JOIN cgan ON cgan.numeroCompra = gcgan.idCompra WHERE cgan.fecha >= '" + fecha_desde + "' AND cgan.fecha <= '" + fecha_hasta + "' order by fecha desc;");
        while (rs.next()) {
            total_GCC = rs.getDouble("total_GCC");
        }
        return total_GCC;
    }
    
    public double ganancia() {
        ganancia = this.ingreso_neto - this.total_GG - (this.gastos_GR + this.total_GCC);       
        return ganancia = Math.round(ganancia * Math.pow(10, 2)) / Math.pow(10, 2);
    }
    
    public boolean guardarGanancias(GananciasGan gan){
        SQL r= new SQL();
        boolean result= r.ejecutarSql("INSERT INTO gananciasgan( fecha_desde, fecha_hasta, ingreso_bruto, total_GCV, ingreso_neto, total_GG, total_GCC, gastos_GR, ganancia) VALUES ('" + gan.getFecha_desde() +"', '"+ gan.getFecha_hasta() + "', '" + this.ingreso_bruto + "', '" + this.total_GCV + "', '" + this.ingreso_neto + "', '" + this.total_GG + "', '" + this.total_GCC + "', '" + this.gastos_GR + "', '" + this.ganancia + "' );");
        return result;
    }
    

}
