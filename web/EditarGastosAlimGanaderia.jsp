<%-- 
    Document   : EditarGastosAlimGanaderia
    Created on : 02/03/2016, 16:01:08
    Author     : Guille
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.SQL"%>
<%@ page import="beans.Gganalim" %>
<jsp:useBean id="ga" class="beans.Gganalim" scope="session" />
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
                Gganalim GA = new Gganalim();
                GA.setIdGasto(Integer.parseInt(request.getParameter("idgahidden")));
                GA.setFecha(request.getParameter("fechahidden"));
                GA.setComponente(request.getParameter("comphidden"));
                GA.setKg(Double.parseDouble(request.getParameter("kghidden")));
                GA.setPreciokg(Double.parseDouble(request.getParameter("precioKghidden")));
                GA.setObservacion(request.getParameter("obhidden"));
                GA.setCosto(Double.parseDouble(request.getParameter("costohidden")));
                resultado = ga.editarGastos(GA);

                if (resultado == true) {
                    r1 = "alert('Gastos Cargados Exitosamente!!!!!')";
                    r2 = "window.open('ResulGastosAlimGanaderia.jsp','central')";

                } else {
                    r1 = "alert('Error al intentar cargar los Gastos!!!')";
                    r2 = "window.open('ResulGastosAlimGanaderia.jsp', 'central')";

                }
            }else if("eliminar".equals(desvio)){
                int idGasto = Integer.parseInt(request.getParameter("idg"));
                Gganalim GA = new Gganalim();
                resultado = GA.eliminarGasto(idGasto);
                if (resultado == true) {
                    r1 = "alert('Gasto Eliminado Exitosamente!!!!!')";
                    r2 = "window.open('ResulGastosAlimGanaderia.jsp', 'central')";

                } else {
                    r1 = "alert('Error al intentar eliminar el Gasto!!!')";
                    r2 = "window.open('ResulGastosAlimGanaderia.jsp', 'central')";
                }
            }

        %>
        <script>
            <%=r1%>
            <%=r2%>
        </script> 

        <title>JSP Page</title>
    </head>
    <body>

    </body>
</html>
