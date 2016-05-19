<%-- 
    Document   : ResulGCagri
    Created on : 22/01/2016, 22:33:47
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
%>
<%
    int ses = Integer.parseInt(session.getAttribute("gc_Agri").toString());

    GCAgri gc = new GCAgri();
    gasto = request.getParameter("selecgc");
    if (gasto.equals("7")) {
        gasto = request.getParameter("desc");
    }
    gc.setGasto(gasto);
    if(request.getParameter("obser").length()==0){
        gc.setObser("");
    }else{
        gc.setObser(request.getParameter("obser"));
    }
    gc.setCosto(Double.parseDouble(request.getParameter("costo")));
    gc.setIdVenta(ses);
    resultado = gc.guardarGC(gc);
%>
<%
    if (resultado == true) {
        r1 = "alert('Gasto de comercializacion agregado Exitosamente!!!!!')";
        r2 = "window.open('GC.jsp', 'central')";

    } else {
        r1 = "alert('Error al intentar agregar el gasto de comercializacion!!!')";
        r2 = "window.open('selecVenta.jsp', 'central')";
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