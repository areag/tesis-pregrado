<%-- 
    Document   : EditarExistenciasGan
    Created on : 21/04/2016, 18:28:27
    Author     : Guille
--%>

<%@page import="beans.ExistenciasGan" %>
<jsp:useBean id="eg" class="beans.ExistenciasGan" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <%!
            
            boolean resultado;
            String r1;
            String r2;
            String desvio;
            
        %>
        <%
            desvio = request.getParameter("desvio");
            
            if ("editar".equals(desvio)) {
            ExistenciasGan EG = new ExistenciasGan();
            String fe = request.getParameter("fecha");
            String dia = fe.substring(0, 2);
            String mes = fe.substring(3, 5);
            String año = fe.substring(6, 10);
            fe = año + "/" + mes + "/" + dia;
            EG.setFecha(fe);
            EG.setPorcentaje(Double.parseDouble(request.getParameter("porcentaje")));
            EG.setPrecio_ternero(Double.parseDouble(request.getParameter("precio_ternero")));
            EG.setPrecio_novillo(Double.parseDouble(request.getParameter("precio_novillo")));
            EG.setIncremento(Double.parseDouble(request.getParameter("incremento")));
            EG.setDisminucion(Double.parseDouble(request.getParameter("disminucion")));
            EG.setPeso_ternero(Double.parseDouble(request.getParameter("peso_ternero")));
            EG.setPeso_novillo(Double.parseDouble(request.getParameter("peso_novillo")));
            EG.setMuerte_ternero(Double.parseDouble(request.getParameter("muerte_ternero")));
            EG.setMuerte_novillo(Double.parseDouble(request.getParameter("muerte_novillo")));
            resultado = eg.editarExistGan(EG);
            
            if (resultado == true) {
                    r1 = "alert('Existencia modificado Exitosamente!!!!!')";
                    r2 = "window.open('ResulExistenciasGan.jsp', 'central')";

                } else {
                    r1 = "alert('Error al intentar modificar existencia!!!')";
                    r2 = "window.open('ResulExistenciasGan.jsp.jsp', 'central')";
                }

 } else if ("eliminar".equals(desvio)) {
 
 }

            
        
        %>
        <title>Edit Existencias Ganaderia</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
