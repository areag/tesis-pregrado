<%-- 
    Document   : ResulEdicionGC
    Created on : 12/02/2016, 10:22:39
    Author     : nulia
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="beans.GCAgri" %>
<jsp:useBean id="GCAgri" class="beans.GCAgri" scope="session" />
<%!
    String gasto;
    boolean resultado;
    String r1;
    String r2;
    String desvio=" ";
%>
<%  
    desvio = request.getParameter("desvio");
    System.out.println("*********Variable desvio: " + desvio + "******");
    if ("editar".equals(desvio)) {
    int ses = Integer.parseInt(session.getAttribute("gc_Agri").toString());
    GCAgri gc = new GCAgri();
    gc.setIdGasto(Integer.parseInt(request.getParameter("idgc")));
    gasto = request.getParameter("gasto");
    if (gasto.equals("10")) {
        gasto = "Otro";
    }
    String ob = request.getParameter("ob");
    gc.setGasto(gasto);
    if(ob.length()==0){
        gc.setObser("");
    }else{
        gc.setObser(ob);
    }
    gc.setCosto(Double.parseDouble(request.getParameter("costo")));
    gc.setIdVenta(ses);
    resultado = gc.editarGC(gc);
%>
<%
    if (resultado == true) {
        r1 = "alert('Gasto de comercializacion modificado Exitosamente!!!!!')";
        r2 = "window.open('GC.jsp', 'central')";

    } else {
        r1 = "alert('Error al intentar modificar el gasto de comercializacion!!!')";
        r2 = "window.open('GC.jsp', 'central')";
    }
    }
    if ("eliminar".equals(desvio)) {
        int idgc = Integer.parseInt(request.getParameter("idgc"));
        GCAgri gc = new GCAgri();
        resultado = gc.eliminarGC(idgc);
        if (resultado == true) {
            r1 = "alert('Gasto Eliminado Exitosamente!!!!!')";
            r2 = "window.open('GC.jsp', 'central')";

        } else {
            r1 = "alert('Error al intentar eliminar el Lote!!!')";
            r2 = "window.open('GC.jsp', 'central')";
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
