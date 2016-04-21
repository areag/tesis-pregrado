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
public class VentaAgri {
    
    int idVenta;
    String producto;
    String fecha;
    int kg;

    public VentaAgri(int idVenta, String producto, String fecha, int kg, double precioM, double porcen, String comprador, double valor) {
        this.idVenta = idVenta;
        this.producto = producto;
        this.fecha = fecha;
        this.kg = kg;
        this.precioM = precioM;
        this.porcen = porcen;
        this.comprador = comprador;
        this.valor = valor;
    }
    double precioM;
    double porcen;
    String comprador;
    double valor;

    public VentaAgri() {
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int nroVenta) {
        this.idVenta = nroVenta;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getKg() {
        return kg;
    }

    public void setKg(int kg) {
        this.kg = kg;
    }

    public double getPrecioM() {
        return precioM;
    }

    public void setPrecioM(double precioM) {
        this.precioM = precioM;
    }

    public double getPorcen() {
        return porcen;
    }

    public void setPorcen(double porcen) {
        this.porcen = porcen;
    }

    public String getComprador() {
        return comprador;
    }

    public void setComprador(String comprador) {
        this.comprador = comprador;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }
    
    public boolean guardarVenta (VentaAgri v){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("INSERT INTO ventas (producto, fecha, kg, precioMercado, porcenComision, comprador, valor) VALUES (\"" + v.getProducto()+ "\",\"" + v.getFecha()+ "\",'" + v.getKg() + "','" + v.getPrecioM() + "','" + v.getPorcen() + "',\"" + v.getComprador() + "\",'" +v.getValor() + "')");
        return resul;
    }
    public boolean editarVenta(VentaAgri v){
         SQL r = new SQL();
         boolean resul = r.ejecutarSql("UPDATE ventas SET producto=\""+v.getProducto()+"\", fecha=\""+v.getFecha()+"\", kg='"+v.getKg()+"', precioMercado='"+v.getPrecioM()+"', porcenComision='"+v.getPorcen()+"', comprador=\""+v.getComprador()+"\", valor='"+v.getValor()+"' WHERE idventa='"+v.getIdVenta()+"'");
         return resul;
    }
     public boolean eliminarVenta (int idVenta){
        SQL r = new SQL();
        boolean resul = r.ejecutarSql("DELETE FROM ventas WHERE idventa = '"+idVenta+"'");
        return resul;
    }
}
