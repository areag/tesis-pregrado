<%-- 
    Document   : EditarComprasGanaderia
    Created on : 05/03/2016, 15:25:40
    Author     : Guille
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.SQL"%>
<%@page import="beans.Cgan" %>
<jsp:useBean id="cg" class="beans.Cgan" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Compras Ganaderia </title>



        <%!
            boolean resultado;
            String r1 = "";
            String r2 = "";
            String desvio;
                                                                    %>

        <%
            desvio = request.getParameter("desvio");

            if ("editar".equals(desvio)) {
                Cgan CG = new Cgan();
                CG.setNumeroCompra(Integer.parseInt(request.getParameter("nroComprahidden")));
                CG.setFecha(request.getParameter("fechahidden"));
                CG.setKgTernero(Double.parseDouble(request.getParameter("kgTernerohidden")));
                CG.setPrecioKg(Double.parseDouble(request.getParameter("precioKghidden")));
                CG.setCantidad(Integer.parseInt(request.getParameter("canthidden")));
                CG.setCosto(Double.parseDouble(request.getParameter("costohidden")));
                resultado = cg.editarCompra(CG);

                if (resultado == true) {
                    r1 = "alert('Compra Modificadas Exitosamente!!!!!')";
                    r2 = "window.open('ResultadoComprasGanaderia.jsp','central')";

                } else {
                    r1 = "alert('Error al intentar cargar las Compras!!!')";
                    r2 = "window.open('ResultadoComprasGanaderia.jsp', 'central')";

                }

            } else if ("eliminar".equals(desvio)) {
                int numeroCompra = Integer.parseInt(request.getParameter("idc"));
                Cgan CG = new Cgan();
                resultado = CG.eliminarCompra(numeroCompra);
                if (resultado == true) {
                    r1 = "alert('Compra Eliminada Exitosamente!!!!!')";
                    r2 = "window.open('ResultadoComprasGanaderia.jsp', 'central')";

                } else {
                    r1 = "alert('Error al intentar eliminar la Compra!!!')";
                    r2 = "window.open('ResultadoComprasGanaderia.jsp', 'central')";
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
