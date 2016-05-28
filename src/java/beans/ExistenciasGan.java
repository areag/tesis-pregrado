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
public class ExistenciasGan {

    SQL sql = new SQL();
    String conexion = "";
    int idExistencias;
    String fecha_desde;
    String fecha_hasta;
    int eft;
    int efn;
    double porcentaje;
    double precio_ternero;
    double precio_novillo;
    double incremento;
    double disminucion;
    double peso_ternero;
    double peso_novillo;
    double muerte_ternero;
    double muerte_novillo;

    public ExistenciasGan() {
    }

    public int getIdExistencias() {
        return idExistencias;
    }

    public String getFecha_desde() {
        return fecha_desde;
    }

    public String getFecha_hasta() {
        return fecha_hasta;
    }

    public int getEft() {
        return eft;
    }

    public int getEfn() {
        return efn;
    }
    
    public double getPorcentaje() {
        return porcentaje;
    }

    public double getPrecio_ternero() {
        return precio_ternero;
    }

    public double getPrecio_novillo() {
        return precio_novillo;
    }

    public double getIncremento() {
        return incremento;
    }

    public double getDisminucion() {
        return disminucion;
    }

    public double getPeso_ternero() {
        return peso_ternero;
    }

    public double getPeso_novillo() {
        return peso_novillo;
    }

    public double getMuerte_ternero() {
        return muerte_ternero;
    }

    public double getMuerte_novillo() {
        return muerte_novillo;
    }

    public void setIdExistencias(int idExistencias) {
        this.idExistencias = idExistencias;
    }

    public void setFecha_desde(String fecha_desde) {
        this.fecha_desde = fecha_desde;
    }

    public void setFecha_hasta(String fecha_hasta) {
        this.fecha_hasta = fecha_hasta;
    }

    public void setEft(int eft) {
        this.eft = eft;
    }

    public void setEfn(int efn) {
        this.efn = efn;
    }
    
    public void setPorcentaje(double porcentaje) {
        this.porcentaje = porcentaje;
    }

    public void setPrecio_ternero(double precio_ternero) {
        this.precio_ternero = precio_ternero;
    }

    public void setPrecio_novillo(double precio_novillo) {
        this.precio_novillo = precio_novillo;
    }

    public void setIncremento(double incremento) {
        this.incremento = incremento;
    }

    public void setDisminucion(double disminucion) {
        this.disminucion = disminucion;
    }

    public void setPeso_ternero(double peso_ternero) {
        this.peso_ternero = peso_ternero;
    }

    public void setPeso_novillo(double peso_novillo) {
        this.peso_novillo = peso_novillo;
    }

    public void setMuerte_ternero(double muerte_ternero) {
        this.muerte_ternero = muerte_ternero;
    }

    public void setMuerte_novillo(double muerte_novillo) {
        this.muerte_novillo = muerte_novillo;
    }

    public boolean guardarExistGan(ExistenciasGan EG) {
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("INSERT INTO existenciasgan ("
                + "fecha_desde,"
                + "fecha_hasta,"
                + "eft,"
                + "efn,"
                + " porcentaje,"
                + "precio_ternero,"
                + "precio_novillo,"
                + "incremento,"
                + "disminucion,"
                + "peso_ternero,"
                + "peso_novillo,"
                + "muerte_ternero,"
                + "muerte_novillo)"
                + "VALUES('"
                + EG.getFecha_desde() + "','"
                + EG.getFecha_hasta() + "','"
                + EG.getEft() + "','"
                + EG.getEfn() + "','"
                + EG.getPorcentaje() + "','"
                + EG.getPrecio_ternero() + "','"
                + EG.getPrecio_novillo() + "','"
                + EG.getIncremento() + "','"
                + EG.getDisminucion() + "','"
                + EG.getPeso_ternero() + "','"
                + EG.getPeso_novillo() + "','"
                + EG.getMuerte_ternero() + "','"
                + EG.getMuerte_novillo() + "')");

        return resul;
    }

    public boolean editarExistGan(ExistenciasGan EG) {
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("UPDATE existenciasgan SET "
                + "fecha_desde = '" + EG.getFecha_desde() + "', "
                + "fecha_hasta = '" + EG.getFecha_hasta() + "', "
                + "eft = '" + EG.getEft() + "', "
                + "efn = '" + EG.getEfn() + "', "
                + "porcentaje = '" + EG.getPorcentaje() + "', "
                + "precio_ternero = '" + EG.getPrecio_ternero() + "', "
                + "precio_novillo = '" + EG.getPrecio_novillo() + "', "
                + "incremento = '" + EG.getIncremento() + "', "
                + "disminucion = '" + EG.getDisminucion() + "', "
                + "peso_ternero = '" + EG.getPeso_ternero() + "', "
                + "peso_novillo = '" + EG.getPeso_novillo() + "', "
                + "muerte_ternero = '" + EG.getMuerte_ternero() + "', "
                + "muerte_novillo = '" + EG.getMuerte_novillo() + "' "
                + "WHERE idexistenciasgan= '" + EG.getIdExistencias() + "'");
  return resul;
    }
    
    public boolean eliminarExistGan(int idexistenciasgan) {
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("DELETE FROM existenciasgan WHERE idexistenciasgan = '" + idexistenciasgan + "'" );
        return resul;
    }
   
      public String [] existencias_ant() throws SQLException {         
          String [] existencias = new String [3];
          sql.conexion("root", "root");
            ResultSet rs = sql.consultar("SELECT * FROM existenciasgan order by fecha_hasta asc; ");
            if (rs.next()) {
                rs.last();
            }
            existencias [0] = String.valueOf(rs.getInt("eft"));
            existencias [1] = String.valueOf(rs.getInt("efn"));
            existencias [2] = rs.getString("fecha_hasta");
            return existencias;        
      }
      
      public int nuevo_eft() throws SQLException {
        int eft;
        String aux [] = this.existencias_ant();
        int eft_ant = Integer.parseInt(aux[0]);
        String fecha_desde = aux[2];
        String fecha_hasta = getFecha_hasta();
        int compras = 0;
        int disminucion = (int) getDisminucion();
        int muerte_ternero = (int) getMuerte_ternero();                      
        sql.conexion("root", "root");       
        ResultSet rs = sql.consultar("SELECT ROUND(SUM(cgan.cantidad), 2) AS compras FROM cgan WHERE fecha >= '" + fecha_desde + "' AND fecha <= '" + fecha_hasta + "' ORDER BY fecha desc");             
        while(rs.next()){
            compras = rs.getInt("compras");
                         
       }        
           eft = eft_ant + compras - disminucion - muerte_ternero;
           
           System.out.println("las eft anteriores son: " +eft_ant);
           System.out.println("las fechas son: " + fecha_desde + ", " +fecha_hasta);
           System.out.println("compras anterior es:" +compras);
           System.out.println("las diminuciones son:" +disminucion);
           System.out.println("las muertes de terneros son:" +muerte_ternero);   
           System.out.println("eft nueva es:" +eft);
           
       return eft;
    }
      
      public int nuevo_efn() throws SQLException {
        int efn;
        String aux [] = this.existencias_ant();
        int efn_ant = Integer.parseInt(aux[1]);
        String fecha_desde = aux[2];
        String fecha_hasta = getFecha_hasta();
        int ventas = 0;
        int incrementos = (int) getIncremento();
        int muerte_novillo = (int) getMuerte_novillo();                      
        sql.conexion("root", "root");       
        ResultSet rs = sql.consultar("SELECT ROUND(SUM(vgan.cantidad), 2) AS ventas FROM vgan WHERE fecha >= '" + fecha_desde + "' AND fecha <= '" + fecha_hasta + "' ORDER BY fecha desc");             
        while(rs.next()){
            ventas = rs.getInt("ventas");
                         
       }        
           efn = efn_ant + incrementos - ventas  - muerte_novillo;
           
           System.out.println("las efn anteriores son: " +efn_ant);
           System.out.println("las fechas son: " + fecha_desde + ", " +fecha_hasta);
           System.out.println("compras anterior es:" + ventas);
           System.out.println("las diminuciones son:" + incrementos);
           System.out.println("las muertes de terneros son:" + muerte_novillo);   
           System.out.println("eft nueva es:" +efn);
           
       return efn;
    }

}

