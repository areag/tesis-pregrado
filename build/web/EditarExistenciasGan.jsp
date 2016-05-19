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
            double por;
                                %>

        <%
            desvio = request.getParameter("desvio");
        %>
        
        <%=desvio%>
        
        <%
            if ("editar".equals(desvio)) {

                ExistenciasGan EG = new ExistenciasGan();
                EG.setIdExistencias(Integer.parseInt(request.getParameter("idexistenciasgan")));
                EG.setFecha(request.getParameter("fecha"));
                EG.setPorcentaje(Double.parseDouble(request.getParameter("porcentaje")));
                EG.setPrecio_ternero(Double.parseDouble(request.getParameter("precio_ternero")));
                EG.setPrecio_novillo(Double.parseDouble(request.getParameter("precio_novillo")));
                EG.setIncremento(Double.parseDouble(request.getParameter("incremento")));
                EG.setDisminucion(Double.parseDouble(request.getParameter("disminucion")));
                EG.setPeso_ternero(Double.parseDouble(request.getParameter("peso_ternero")));
                EG.setPeso_novillo(Double.parseDouble(request.getParameter("peso_novillo")));
                EG.setMuerte_ternero(Double.parseDouble(request.getParameter("muerte_ternero")));
                EG.setMuerte_novillo(Double.parseDouble(request.getParameter("muerte_novillo")));

                System.out.print(EG.getIdExistencias());
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

                resultado = eg.editarExistGan(EG);

                if (resultado == true) {
                    r1 = "alert('Existencia modificado Exitosamente!!!!!')";
                    r2 = "window.open('ResulExistenciasGan.jsp', 'central')";

                } else {
                    r1 = "alert('Error al intentar modificar existencia!!!')";
                    r2 = "window.open('ResulExistenciasGan.jsp', 'central')";
                }

            } else if ("eliminar".equals(desvio)) {
                
                int idexistencias = Integer.parseInt(request.getParameter("idexistenciasgan"));

                resultado = eg.eliminarExistGan(idexistencias);

                if (resultado == true) {

                    r1 = "alert('Existencia eliminada Exitosamente!!!!!')";
                    r2 = "window.open('ResulExistenciasGan.jsp', 'central')";
                } else {
                    r1 = "alert('Error al intentar eliminar existencia!!!')";
                    r2 = "window.open('ResulExistenciasGan.jsp', 'central')";
                }
            }


        %>

        <script>
            <%=r1%>
            <%=r2%>
        </script>

        <title>Edit Existencias Ganaderia</title>
    </head>
    <body>

    </body>
</html>
