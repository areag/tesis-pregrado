<%-- 
    Document   : ResultadoGCGanaderia
    Created on : 08/03/2016, 19:08:26
    Author     : Guille
--%>
<%@page import="beans.Ggancom" %>
<jsp:useBean id="ggc" class="beans.Ggancom" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Resultado Gastos de Comercializacion Ganaderia</title>

        <%!
            String gasto;
            boolean resultado;
            String r1 = "";
            String r2 = "";
            
                                             %>

        <%=session.getAttribute("tipoGasto").toString()%>

        <%
            
                Ggancom GGC = new Ggancom();

                gasto = request.getParameter("selecgcgan");
                if (gasto.equals("10")) {
                    gasto = request.getParameter("desc");
                }
                GGC.setGasto(gasto);

                if (request.getParameter("obser").length() == 0) {
                    GGC.setObservacion("");
                } else {
                    GGC.setObservacion(request.getParameter("obser"));
                }
                GGC.setCosto(Double.parseDouble(request.getParameter("costo")));

                int tipoGasto = Integer.parseInt(session.getAttribute("tipoGasto").toString());

                if (tipoGasto == 1) {
                    int idCompra = Integer.parseInt(session.getAttribute("idGasto").toString());
                    GGC.setIdCompra(idCompra);
                    resultado = ggc.guardarGC1(GGC);

                } else if (tipoGasto == 2) {
                    int idVenta = Integer.parseInt(session.getAttribute("idGasto").toString());
                    GGC.setIdVenta(idVenta);
                    resultado = ggc.guardarGC2(GGC);
                }

                if (resultado == true) {
                    r1 = "alert('Gastos Cargados Exitosamente!!!!!')";
                    r2 = "window.open('GCGanaderia.jsp','central')";

                } else {
                    r1 = "alert('Error al intentar cargar los Gastos!!!')";
                    r2 = "window.open('SelectGCGanaderia.jsp', 'central')";

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
