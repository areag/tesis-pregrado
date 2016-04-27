<%-- 
    Document   : RegistroGananciasGan
    Created on : 26/04/2016, 18:37:55
    Author     : Guille
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="beans.GananciasGan" %>
<jsp:useBean id="ganancias" class="beans.GananciasGan" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/tablas.css">
        <script type="text/javascript" src="js_FunGenericas.js"></script>
         <script type="text/javascript" src="js/js_gananciasGan.js"></script>
        <title>Registro Nuevas Ganancias</title>
        
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
            GananciasGan gan = new GananciasGan();
            String fecha_desde = request.getParameter("fecha_desde");
            String fecha_hasta = request.getParameter("fecha_hasta");
            gan.setFecha_desde(fecha_desde);
            gan.setFecha_hasta(fecha_hasta);
            resultado = ganancias.guardarGanancias(gan);

            if (resultado == true) {
                r1 = "alert('Ganancia Cargadas Exitosamente!!!!!')";
                r2 = "window.open('GananciaGan.jsp','central')";

            } else {
                r1 = "alert('Error, verifique las fechas!!!')";
                r2 = "window.open('GananciaGan.jsp', 'central')";

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


                <h1>Ganancias Guardadas</h1>

                <table>
                    <thead>    
                        <tr>
                            <th>Número</th>
                            <th>Fecha desde</th>
                            <th>Fecha hasta</th>
                            <th>Ingreso Bruto</th>
                            <th>Total de Gastos de Comercialización Ventas</th>
                            <th>Ingreso Neto </th>
                            <th>Total Gastos Ganadería </th>
                            <th>Total Gastos de Comercializacion de Compras</th>
                            <th>Gastos Reposición </th>
                            <th>Ganancia </th>
                            <th>Ver Detalles</th>
                            <th>Eliminar</th>


                        </tr>
                    </thead>
                    <tbody>

                        <%
                            SQL sql = new SQL();
                            sql.conexion("root", "root");
                            ResultSet rs = sql.consultar("SELECT * FROM gananciasgan order by idgananciasgan; ");
                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs.getInt("idgananciasgan") + "</td>");
                                out.print("<td name= \"fecha_desde\" id= \"fecha_desde\">" + rs.getString("fecha_desde") + "</td>");
                                out.print("<td name=\"fecha_hasta\" id= \"fecha_hasta\">" + rs.getString("fecha_hasta") + "</td>");
                                out.print("<td>" + rs.getDouble("ingreso_bruto") + "</td>");
                                out.print("<td>" + rs.getDouble("total_GCV") + "</td>");
                                out.print("<td>" + rs.getDouble("ingreso_neto") + "</td>");
                                out.print("<td>" + rs.getDouble("total_GG") + "</td>");
                                out.print("<td>" + rs.getDouble("total_GCC") + "</td>");
                                out.print("<td>" + rs.getDouble("gastos_GR") + "</td>");
                                out.print("<td>" + rs.getDouble("ganancia") + "</td>");
                                out.println("<td align=\"center\"> <span class=\"editar\" onclick=\"capturarEnvio(this)\" style='cursor: pointer'><img src=\"imagenes/ver_detalle.png\" title=\"Ver Detalles\" alt=\"Ver Detalles\"></span>");
                                out.print("<td><span class=\"editar\" onclick=\"eliminar(this)\"><img src=\"imagenes/eliminar.png\" title=\"Eliminar\" alt=\"Eliminar\" style='cursor: pointer'></span></td>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                </table>
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
