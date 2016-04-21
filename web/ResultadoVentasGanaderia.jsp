<%-- 
    Document   : ResultadoVentasGanaderia
    Created on : 10/03/2016, 12:54:48
    Author     : Guille
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.Vgan" %>
<jsp:useBean id="vg" class="beans.Vgan" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/tablas.css">
        <script type="text/javascript" src="js/js_vgan.js"></script>
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <title>Resultado Ventas Ganaderia</title>
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
            Vgan VG = new Vgan();
            VG.setNroVenta(Integer.parseInt(request.getParameter("nroventa")));
            String fe = request.getParameter("fecha");
            String dia = fe.substring(0, 2);
            String mes = fe.substring(3, 5);
            String año = fe.substring(6, 10);
            fe = año + "/" + mes + "/" + dia;
            VG.setFecha(fe);
            
            if (request.getParameter("dencierre").isEmpty()) {
                VG.setDencierre(0);
            } else {
                VG.setDencierre(Integer.parseInt(request.getParameter("dencierre")));
            }
            
            if (request.getParameter("kgternero").isEmpty()) {
                VG.setKgTernero(0);
            } else {
                VG.setKgTernero(Double.parseDouble(request.getParameter("kgternero")));
            }
            
            VG.setPrecioKg(Double.parseDouble(request.getParameter("precioKg")));
            
            if (request.getParameter("cant").isEmpty()) {
                VG.setCantidad(0);
            } else {
                VG.setCantidad(Integer.parseInt(request.getParameter("cant")));
            }
            
            VG.setKgVendido(Double.parseDouble(request.getParameter("kgVendidos")));
            VG.setValor(Double.parseDouble(request.getParameter("valor")));
            
            resultado = vg.guardarVentas(VG);
            
             if (resultado == true) {
                r1 = "alert('Ventas Cargadas Exitosamente!!!!!')";
                r2 = "window.open('VentasGanaderia.jsp','central')";

            } else {
                r1 = "alert('Error al intentar cargar las Ventas!!!')";
                r2 = "window.open('VentasGanaderia.jsp', 'central')";
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
        
        <div id="contenedor" class="container">



            <div id="myTabDiv">


                <h1>Ventas Cargadas</h1>

                <table>
                    <thead>    
                        <tr>
                            <th>Número</th>
                            <th>Fecha</th>
                            <th>Días de Encierre</th>
                            <th>Kg/Ternero (prom.)</th>
                            <th>$/Kg</th>
                            <th>Cantidad</th>
                            <th>Total de Kg. Vendidos</th>
                            <th>Valor</th>
                            <th>Modificar</th>
                            <th>Eliminar</th>


                        </tr>
                    </thead>
                    <tbody>

                        <%
                            SQL sql = new SQL();
                            sql.conexion("root", "root");
                            ResultSet rs = sql.consultar("SELECT * FROM vgan order by numeroVenta; ");
                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs.getInt("numeroVenta") + "</td>");
                                out.print("<td>" + rs.getString("fecha") + "</td>");
                                out.print("<td>" + rs.getInt("dencierre") + "</td>");
                                out.print("<td>" + rs.getDouble("kgTernero") + "</td>");
                                out.print("<td>" + rs.getDouble("precioKg") + "</td>");
                                out.print("<td>" + rs.getInt("cantidad") + "</td>");
                                out.print("<td>" + rs.getDouble("kgVendido") + "</td>");
                                out.print("<td>" + rs.getDouble("valor") + "</td>");
                                out.println("<td align=\"center\"> <span class=\"editar\" onclick=\"transformarEnEditable(this)\" style='cursor: pointer'><img src=\"imagenes/editar.png\" title=\"Editar\" alt=\"Editar\"></span>");
                                out.print("<td><span class=\"editar\" onclick=\"eliminar(this)\"><img src=\"imagenes/eliminar.png\" title=\"Eliminar\" alt=\"Eliminar\" style='cursor: pointer'></span></td>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <form name="formEdicion2" action="EditarVentasGanaderia.jsp" method="post" onsubmit="capturarEnvio()" onreset="anular()">
                <div id="contenedorForm">

                </div>

            </form>
            <br>
            
            <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                   onmouseout="this.style.color = 'black'" class="BotonTabla" onclick="volver()"/><br />

            <input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla"  onclick="volverInicio()" />

        </div>

    </body>
    <%}%>
</html>
