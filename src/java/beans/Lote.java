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
public class Lote {

    int idLote;
    String nombre;
    String cultivo;
    int hp;
    double rb;
    double exisIni;
    double porcen;
    boolean propio;

    public Lote() {
    }

    public Lote(int idLote, String nombre, String cultivo, int hp, double rb, double exisIni, double porcen, boolean propio) {
        this.idLote = idLote;
        this.nombre = nombre;
        this.cultivo = cultivo;
        this.hp = hp;
        this.rb = rb;
        this.exisIni = exisIni;
        this.porcen = porcen;
        this.propio = propio;
    }

    public int getIdLote() {
        return idLote;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCultivo() {
        return cultivo;
    }

    public void setCultivo(String cultivo) {
        this.cultivo = cultivo;
    }

    public int getHp() {
        return hp;
    }

    public void setHp(int hp) {
        this.hp = hp;
    }

    public double getRb() {
        return rb;
    }

    public void setRb(double rb) {
        this.rb = rb;
    }

    public double getExisIni() {
        return exisIni;
    }

    public void setExisIni(double exisIni) {
        this.exisIni = exisIni;
    }

    public double getPorcen() {
        return porcen;
    }

    public void setPorcen(double porcen) {
        this.porcen = porcen;
    }

    public boolean isPropio() {
        return propio;
    }

    public void setPropio(boolean propio) {
        this.propio = propio;
    }

        
    public boolean guardarLote (Lote l){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("INSERT INTO lotes (nombre, cultivo, hp, rb, existenciaInicial, porcenGC, propia) VALUES (\"" + l.getNombre() + "\",\"" + l.getCultivo() + "\",'" + l.getHp() + "','" + l.getRb() + "','" + l.getExisIni() + "','" + l.getPorcen() + "'," + l.isPropio() + ")");
        return resul;
    }
    public boolean editarLote (Lote l){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("UPDATE lotes SET nombre=\""+l.getNombre()+"\", cultivo=\""+l.getCultivo()+"\", hp='"+l.getHp()+"', rb='"+l.getRb()+"', existenciaInicial='"+l.getExisIni()+"', porcenGC='"+l.getPorcen()+"', propia="+l.isPropio()+" WHERE idlote='"+l.getIdLote()+"'");
        return resul;
    }
    
    public boolean eliminarLote (int idLote){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("DELETE FROM lotes WHERE idlote = '"+idLote+"'");
        return resul;
    }
}