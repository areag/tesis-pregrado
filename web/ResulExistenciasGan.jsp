<%-- 
    Document   : ResulExistenciasGan
    Created on : 11/04/2016, 19:10:29
    Author     : Guille
--%>

<%@page import="beans.ExistenciasGan" %>
<jsp:useBean id="eg" class="beans.ExistenciasGan" scope="session" /> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado Existencias Ganaderia</title>

        <%
            String boton = request.getParameter("select");
            if ("select".equals(boton)) {
        %>

        <%!
            boolean resultado;
            String r1 = "";
            String r2 = "";
                                %>
                                
        <%
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
            resultado = eg.guardarExistGan(EG);
            
            
            System.out.print(EG.getFecha());
            System.out.print(EG.getPorcentaje());
            System.out.print(EG.getPrecio_ternero());
            System.out.print(EG.getPrecio_novillo());
            System.out.print(EG.getIncremento());
            System.out.print(EG.getDisminucion());
            System.out.print(EG.getPeso_ternero());
            System.out.print(EG.getPeso_novillo());
            System.out.print(EG.getMuerte_ternero());
            System.out.print(EG.getMuerte_novillo());

            if (resultado == true) {
                r1 = "alert('Existencias Cargadas Exitosamente!!!!!')";
                r2 = "window.open('ExistenciasGan.jsp','central')";

            } else {
                r1 = "alert('Error al intentar cargar las Existencias!!!')";
                r2 = "window.open('ExistenciasGan.jsp', 'central')";

            }

        %>

        <script>
            <%=r1%>
            <%=r2%>
        </script> 

    </head>
     <%} else {
    %>
    <body>
        <h1>Hello World!</h1>
    </body>
    <%}%>
</html>
