<%-- 
    Document   : EditarGCGanaderia
    Created on : 09/03/2016, 10:47:40
    Author     : Guille
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.Ggancom" %>
<jsp:useBean id="ggc" class="beans.Ggancom" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Editar Gastos Comercializacion de Compras Ganaderia</title>

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
                Ggancom GGC = new Ggancom();
                GGC.setIdGasto(Integer.parseInt(request.getParameter("nroGastohidden")));
                GGC.setGasto(request.getParameter("gastohidden"));
                GGC.setObservacion(request.getParameter("obhidden"));
                GGC.setCosto(Double.parseDouble(request.getParameter("costohidden")));
                resultado = ggc.editarGC(GGC);

                if (resultado == true) {
                    r1 = "alert('Gastos Cargados Exitosamente!!!!!')";
                    r2 = "window.open('GCGanaderia.jsp','central')";

                } else {
                    r1 = "alert('Error al intentar cargar los Gastos!!!')";
                    r2 = "window.open('SelectGCGanaderia.jsp', 'central')";

                }

            } else if ("eliminar".equals(desvio)) {
                int idGasto = Integer.parseInt(request.getParameter("idg"));
                Ggancom GGC = new Ggancom();
                resultado = GGC.eliminarGC(idGasto);
                if (resultado == true) {
                    r1 = "alert('Gasto Eliminado Exitosamente!!!!!')";
                    r2 = "window.open('GCGanaderia.jsp', 'central')";

                } else {
                    r1 = "alert('Error al intentar eliminar el Gasto!!!')";
                    r2 = "window.open('SelectGCGanaderia.jsp', 'central')";
                }
            }

        %>

        <script>
            <%=r1%>
            <%=r2%>
        </script>



    </head>
    <body>

    </body>
</html>
