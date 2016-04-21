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
public class ExistenciasGan {

    int idExistencias;
    String fecha;
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

    public String getFecha() {
        return fecha;
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

    public void setFecha(String fecha) {
        this.fecha = fecha;
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
                + "fecha,"
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
                + EG.getFecha() + "','"
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

}
