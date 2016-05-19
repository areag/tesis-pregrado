<%-- 
    Document   : ResulEdicionGP
    Created on : 25/02/2016, 17:14:18
    Author     : nulia
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="beans.GPAgri" %>
<jsp:useBean id="GPAgri" class="beans.GPAgri" scope="session" />
<%!
    boolean resultado;
    String r1;
    String r2;
    String desvio;
%>

<%
    desvio = request.getParameter("desvio");
    if ("editar".equals(desvio)) {
        GPAgri gp = new GPAgri();
        int idgp = Integer.parseInt(request.getParameter("idgp"));
        String gasto = request.getParameter("gasto");
        gp.setIdGasto(idgp);
        gp.setGasto(gasto);
        gp.setDescripcion(request.getParameter("desc"));
        if (request.getParameter("ob").length() == 0) {
            gp.setObser(" ");
        } else {
            gp.setObser(request.getParameter("ob"));
        }
        gp.setCosto(Double.parseDouble(request.getParameter("costo")));
        String fe = request.getParameter("fecha");
        String dia = fe.substring(0, 2);
        String mes = fe.substring(3, 5);
        String año = fe.substring(6, 10);
        fe = año + "/" + mes + "/" + dia;
        gp.setFecha(fe);
        gp.toString();
        resultado = gp.editarGP(gp);

        if (resultado == true) {
            r1 = "alert('Gasto de producción modificado Exitosamente!!!!!')";
            r2 = "window.open('ResultadoGPAgri.jsp', 'central')";

        } else {
            r1 = "alert('Error al intentar modificar el gasto de produccion, vuelva a intentar luego!!!')";
            r2 = "window.open('ResultadoGPAgri.jsp', 'central')";

        }
    }

    if ("eliminar".equals(desvio)) {
        GPAgri gp = new GPAgri();
        int idGasto = Integer.parseInt(request.getParameter("idgp"));
        gp.setIdGasto(idGasto);
        resultado = gp.eliminarGP(gp);

        if (resultado == true) {
            r1 = "alert('Gasto de producción eliminado Exitosamente!!!!!')";
            r2 = "window.open('ResultadoGPAgri.jsp', 'central')";

        } else {
            r1 = "alert('Error al intentar eliminar el gasto de produccion, vuelva a intentar luego!!!')";
            r2 = "window.open('ResultadoGPAgri.jsp', 'central')";
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
