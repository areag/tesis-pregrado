<%-- 
    Document   : EditarGastosGanaderia
    Created on : 26/02/2016, 19:41:35
    Author     : Guille
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.SQL"%>
<%@ page import="beans.Gganpro" %>
<jsp:useBean id="gg" class="beans.Gganpro" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        


        <%!
            String gasto;
            boolean resultado;
            String r1;
            String r2;
            String desvio;

                                   %>


        <%
            desvio = request.getParameter("desvio");

            if ("editar".equals(desvio)) {
                Gganpro GG = new Gganpro();
                GG.setIdGasto(Integer.parseInt(request.getParameter("idgchidden")));
                GG.setFecha(request.getParameter("fechahidden"));
                GG.setGasto(request.getParameter("gastohidden"));
                GG.setDescripcion(request.getParameter("obhidden"));
                GG.setCosto(Double.parseDouble(request.getParameter("costohidden")));
                resultado = gg.editarGastos(GG);

                if (resultado == true) {
                    r1 = "alert('Gasto de Produccion modificado Exitosamente!!!!!')";
                    r2 = "window.open('ResultadoGastosGanaderia.jsp', 'central')";

                } else {
                    r1 = "alert('Error al intentar modificar gasto de produccion!!!')";
                    r2 = "window.open('ResultadoGastosGanaderia.jsp', 'central')";
                }

            } else if ("eliminar".equals(desvio)) {
                int idGasto = Integer.parseInt(request.getParameter("idg"));
                Gganpro GG = new Gganpro();
                resultado = GG.eliminarGasto(idGasto);
                if (resultado == true) {
                    r1 = "alert('Gasto Eliminado Exitosamente!!!!!')";
                    r2 = "window.open('ResultadoGastosGanaderia.jsp', 'central')";

                } else {
                    r1 = "alert('Error al intentar eliminar el Gasto!!!')";
                    r2 = "window.open('ResultadoGastosGanaderia.jsp', 'central')";
                }
            }
        %>
        <script>
            <%=r1%>
            <%=r2%>
        </script> 



        <title>Editar Gastos Ganaderia</title>


    </head>

</html>
