<%-- 
    Document   : ResulEliEditVenta
    Created on : 09/03/2016, 09:43:18
    Author     : nulia
--%>
<%@page import="com.SQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="beans.VentaAgri" %>
<jsp:useBean id="Venta" class="beans.VentaAgri" scope="session" />
<%! boolean resultado;
    String r1;
    String r2;
    String desvio=" ";
%>
<%
    desvio = request.getParameter("desvio");
    System.out.println("*********Variable desvio ventas: " + desvio + "******");
    if ("editar".equals(desvio)) {
        int idVenta = Integer.parseInt(request.getParameter("idventa"));
        String producto = request.getParameter("producto");
        String fecha = request.getParameter("fecha");
        int kg = Integer.parseInt(request.getParameter("kg"));
        double pm = Double.parseDouble(request.getParameter("pm"));
        double porcen = Double.parseDouble(request.getParameter("porcen"));
        String comprador = request.getParameter("comprador");
        double valor = Double.parseDouble(request.getParameter("valor"));
        VentaAgri v = new VentaAgri(idVenta, producto, fecha, kg, pm, porcen, comprador, valor);
        resultado = v.editarVenta(v);
        if (resultado == true) {
            r1 = "alert('Venta Modificada Exitosamente!!!!!')";
            r2 = "window.open('ResulVentasAgri.jsp', 'central')";
        } else {
            r1 = "alert('Error al intentar modificar la venta!!!')";
            r2 = "window.open('ResulVentasAgri.jsp', 'central')";
        }      
    }

    if ("eliminar".equals(desvio)) {
        int idVenta = Integer.parseInt(request.getParameter("idv"));
        VentaAgri v = new VentaAgri();
        resultado = v.eliminarVenta(idVenta);
        r2 = "window.open('ResulVentasAgri.jsp', 'central')";
        if (resultado == true) {
            r1 = "alert('Venta Eliminada Exitosamente!!!!!')";
        } else {
            r1 = "alert('Error al intentar eliminar la venta!!!')";
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AREAG</title>
    </head>
    <body>

        <script>
            <%= r1%>
            <%= r2%>
        </script> 
    </body>
</html>
