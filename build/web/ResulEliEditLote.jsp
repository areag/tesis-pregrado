<%-- 
    Document   : ResulEliEditLote
    Created on : 03/03/2016, 11:20:15
    Author     : nulia
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.Lote" %>
<jsp:useBean id="lote" class="beans.Lote" scope="session" />

<%! boolean resultado;
    String r1;
    String r2;
    String desvio=" ";
%>
<%
    desvio = request.getParameter("desvio");
  
    System.out.println("*********Variable desvio: " + desvio + "******");
    
    if ("editar".equals(desvio)) {
        int idLote = Integer.parseInt(request.getParameter("idlotehidden"));
        String cultivo = request.getParameter("cultivohidden");
        String nombre = request.getParameter("nombrehidden");
        int hp = Integer.parseInt(request.getParameter("hphidden"));
        double rb = Double.parseDouble(request.getParameter("rbhidden"));
        double exisIni = Double.parseDouble(request.getParameter("exisInihidden"));
        double porcen = Double.parseDouble(request.getParameter("porcenhidden"));
        boolean propia;
        String pro = request.getParameter("prohidden");
        if (pro.equals("t")) {
            propia = true;
        } else {
            propia = false;
        }
        Lote l = new Lote(idLote, nombre, cultivo, hp, rb, exisIni, porcen, propia);
        l.toString();
        resultado = l.editarLote(l);
%> 
<% if (resultado == true) {
            r1 = "alert('Lote Modificado Exitosamente!!!!!')";
            r2 = "window.open('ResultadoLote.jsp', 'central')";

        } else {
            r1 = "alert('Error al intentar modificar el Lote!!!')";
            r2 = "window.open('ResultadoLote.jsp', 'central')";
        }
    }
    if ("eliminar".equals(desvio)) {
        int idLote = Integer.parseInt(request.getParameter("idl"));
        Lote l = new Lote();
        resultado = l.eliminarLote(idLote);
        if (resultado == true) {
            r1 = "alert('Lote Eliminado Exitosamente!!!!!')";
            r2 = "window.open('ResultadoLote.jsp', 'central')";

        } else {
            r1 = "alert('Error al intentar eliminar el Lote!!!')";
            r2 = "window.open('ResultadoLote.jsp', 'central')";
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
