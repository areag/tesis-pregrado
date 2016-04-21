<%-- 
    Document   : EditarVentasGanaderia
    Created on : 10/03/2016, 15:23:32
    Author     : Guille
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.Vgan" %>
<jsp:useBean id="vg" class="beans.Vgan" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Ventas Ganaderia</title>
        
        <%!
            boolean resultado;
            String r1 = "";
            String r2 = "";
            String desvio;
                                            %>

        <%
            desvio = request.getParameter("desvio");
            if ("editar".equals(desvio)) {
            Vgan VG = new Vgan();
            VG.setNroVenta(Integer.parseInt(request.getParameter("nroVentahidden")));
            VG.setFecha(request.getParameter("fechahidden"));
            VG.setDencierre(Integer.parseInt(request.getParameter("dencierrehidden")));
            VG.setKgTernero(Double.parseDouble(request.getParameter("kgTernerohidden")));
            VG.setPrecioKg(Double.parseDouble(request.getParameter("precioKghidden")));
            VG.setCantidad(Integer.parseInt(request.getParameter("canthidden")));
            VG.setKgVendido(Double.parseDouble(request.getParameter("kgVendidoshidden")));
            VG.setValor(Double.parseDouble(request.getParameter("valorhidden")));
            resultado = vg.editarVentas(VG);
         
                    
            if (resultado == true) {
                r1 = "alert('Compras Modificadas Exitosamente!!!!!')";
                r2 = "window.open('ResultadoVentasGanaderia.jsp','central')";

            } else {
                r1 = "alert('Error al intentar cargar las Compras!!!')";
                r2 = "window.open('central.html', 'central')";

            }
            }else if ("eliminar".equals(desvio)) {
                int numeroVenta = Integer.parseInt(request.getParameter("idv"));
                Vgan VG = new Vgan();
                resultado = VG.eliminarVenta(numeroVenta);
                if (resultado == true) {
                    r1 = "alert('Venta Eliminada Exitosamente!!!!!')";
                    r2 = "window.open('ResultadoVentasGanaderia.jsp', 'central')";

                } else {
                    r1 = "alert('Error al intentar eliminar la Venta!!!')";
                    r2 = "window.open('ResultadoVentasGanaderia.jsp', 'central')";
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
