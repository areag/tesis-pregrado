<%-- 
    Document   : verDetalleGanGan
    Created on : 27/04/2016, 17:48:02
    Author     : Guille
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/tablas.css">
        <script type="text/javascript" src="js_FunGenericas.js"></script>

        <title>Mostrar Detalle Ganancias Ganaderias</title>
        <%
            String fecha_desde = request.getParameter("fecha_desde");
            String fecha_hasta = request.getParameter("fecha_hasta");
            SQL sql = new SQL();
            sql.conexion("root", "root");
        %>

    </head>
    <body>
        <div id="contenedor" class="container">

            <h1>Detalles Ganancias desde: <%=fecha_desde%> hasta: <%=fecha_hasta%>  </h1>

            <p style ="border-top : 3px solid #1de341;">

            <div id="myTabDiv">

                <h1>Ventas Cargadas</h1>

                <table>
                    <thead>    
                        <tr>
                            <th>Número de Venta</th>
                            <th>Fecha</th>
                            <th>Días de Encierre</th>
                            <th>Kg/Ternero (prom.)</th>
                            <th>$/Kg</th>
                            <th>Cantidad</th>
                            <th>Total de Kg. Vendidos</th>
                            <th>Valor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            ResultSet rs = sql.consultar("SELECT * FROM vgan WHERE fecha >= '" + fecha_desde + "' AND fecha <= '" + fecha_hasta + "' order by fecha desc;");
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
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <p style ="border-top : 2px solid #1de341;">

            <div id="myTabDiv">

                <h1>Gastos de Ventas Cargados</h1>

                <table>
                    <thead>    
                        <tr>
                            <th>Número de Gasto de Venta</th>
                            <th>Gasto</th>
                            <th>Observaciones</th>
                            <th>Costo</th>                       
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ResultSet rs2 = sql.consultar("SELECT * FROM gcgan JOIN vgan ON vgan.numeroVenta = gcgan.IdVenta WHERE vgan.fecha >= '" + fecha_desde + "' AND vgan.fecha <= '" + fecha_hasta + "' order by fecha desc;");

                            while (rs2.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs2.getInt("idgcgan") + "</td>");
                                out.println("<td>" + rs2.getString("gasto") + "</td>");
                                out.println("<td>" + rs2.getString("observacion") + "</td>");
                                out.println("<td>" + rs2.getDouble("costo") + "</td>");
                                out.print("</tr>");
                            }

                        %>


                    </tbody>
                </table>
            </div>
            <p style ="border-top : 2px solid #1de341;">

            <div id="myTabDiv">

                <h1>Compras Cargadas</h1>

                <table>
                    <thead>    
                        <tr>
                            <th>Número de Compra</th>
                            <th>Fecha</th>
                            <th>Kg/Ternero (promedio)</th>
                            <th>$/Kg</th>
                            <th>Cantidad</th>
                            <th>Valor</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ResultSet rs5 = sql.consultar("SELECT * FROM cgan WHERE fecha >= '" + fecha_desde + "' AND fecha <= '" + fecha_hasta + "' order by fecha desc");
                            while (rs5.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs5.getInt("numeroCompra") + "</td>");
                                out.print("<td>" + rs5.getString("fecha") + "</td>");
                                out.print("<td>" + rs5.getDouble("kgTernero") + "</td>");
                                out.print("<td>" + rs5.getDouble("precioKg") + "</td>");
                                out.print("<td>" + rs5.getInt("cantidad") + "</td>");
                                out.print("<td>" + rs5.getDouble("costo") + "</td>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div> 

            <p style ="border-top : 2px solid #1de341;">

            <div id="myTabDiv">

                <h1>Gastos de Compras Cargados</h1>

                <table>
                    <thead>    
                        <tr>
                            <th>Número de Gasto de Compra</th>
                            <th>Gasto</th>
                            <th>Observaciones</th>
                            <th>Costo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ResultSet rs6 = sql.consultar("SELECT * FROM gcgan JOIN vgan ON vgan.numeroVenta = gcgan.idCompra WHERE vgan.fecha >= '" + fecha_desde + "' AND vgan.fecha <= '" + fecha_hasta + "' order by fecha desc;");

                            while (rs6.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs6.getInt("idgcgan") + "</td>");
                                out.println("<td>" + rs6.getString("gasto") + "</td>");
                                out.println("<td>" + rs6.getString("observacion") + "</td>");
                                out.println("<td>" + rs6.getDouble("costo") + "</td>");
                                out.print("</tr>");
                            }

                        %>


                    </tbody>
                </table>
            </div>         

            <p style ="border-top : 2px solid #1de341;">       

            <div id="myTabDiv">

                <h1>Gastos de Producción</h1>

                <table>
                    <thead>    
                        <tr>
                            <th>Numero de Gasto de Produccion</th>
                            <th>Fecha</th>
                            <th>Tipo de Gasto</th>
                            <th>Observaciones</th>
                            <th>Costo</th>                      
                        </tr>
                    </thead>
                    <tbody>

                        <%  
                            ResultSet rs3 = sql.consultar("SELECT * FROM gpgan WHERE fecha >= '" + fecha_desde + "' AND fecha <= '" + fecha_hasta + "' order by fecha desc");
                            while (rs3.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs3.getInt("idgpgan") + "</td>");
                                out.print("<td>" + rs3.getString("fecha") + "</td>");
                                out.print("<td>" + rs3.getString("gasto") + "</td>");
                                out.print("<td>" + rs3.getString("observacion") + "</td>");
                                out.print("<td>" + rs3.getDouble("costo") + "</td>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <p style ="border-top : 2px solid #1de341;">

            <div id="myTabDiv">


                <h1>Gastos de Alimentación</h1>

                <table>
                    <thead>    
                        <tr>
                            <th>Numero de Gasto de Alimentacion</th>
                            <th>Fecha</th>
                            <th>Componente</th>
                            <th>Kgs</th>
                            <th>$/Kg</th>
                            <th>Observaciones</th>
                            <th>Costo</th>

                        </tr>
                    </thead>
                    <tbody>

                        <%
                            ResultSet rs4 = sql.consultar("SELECT * FROM gagan WHERE fecha >= '" + fecha_desde + "' AND fecha <= '" + fecha_hasta + "' order by fecha desc");                           
                            while (rs4.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs4.getInt("idgagan") + "</td>");
                                out.print("<td>" + rs4.getString("fecha") + "</td>");
                                out.print("<td>" + rs4.getString("componente") + "</td>");
                                out.print("<td>" + rs4.getDouble("kg") + "</td>");
                                out.print("<td>" + rs4.getDouble("preciokg") + "</td>");
                                out.print("<td>" + rs4.getString("observacion") + "</td>");
                                out.print("<td>" + rs4.getDouble("costo") + "</td>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>        

            <br>

            <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                   onmouseout="this.style.color = 'black'" class="BotonTabla" onclick="volver()"/><br />

            <input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla"  onclick="volverInicio()" />

        </div>
    </body>
</html>
