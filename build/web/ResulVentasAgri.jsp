<%-- 
    Document   : ResulVentasAgri
    Created on : 20/01/2016, 14:23:56
    Author     : nulia
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page import="beans.VentaAgri" %>
<jsp:useBean id="VentaAgri" class="beans.VentaAgri" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
        <link rel="stylesheet" href="css/tablas.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.7.2.custom.css" />
        
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
        
        <script type="text/javascript" src="js/js_ventas.js"></script>
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <title>AREAG</title>
    </head>
    <body>
        <%
            String desvio = request.getParameter("variableDesvio");
            if ("guardar".equals(desvio)) {
        %> 
        <%!
            String producto;
            boolean resultado;
            String r1;
            String r2;
                                %>
        <%
            VentaAgri v = new VentaAgri();
            producto = request.getParameter("cultivo");
            if (producto.equals("7")) {
                producto = request.getParameter("cultivoname");
            }
            v.setProducto(producto);
            //leo la fecha y paso de dd/mm/aaaa a aaaa/mm/dd para guardar
            String fe = request.getParameter("fecha");
            String dia = fe.substring(0, 2);
            String mes = fe.substring(3, 5);
            String año = fe.substring(6, 10);
            fe = año + "/" + mes + "/" + dia;
            v.setFecha(fe);
            v.setKg(Integer.parseInt(request.getParameter("kg")));

            if (request.getParameter("pm").isEmpty()) {
                v.setPrecioM(0);
            } else {
                v.setPrecioM(Double.parseDouble(request.getParameter("pm")));
            }

            if (request.getParameter("porcen").isEmpty()) {
                v.setPorcen(0);
            } else {
                v.setPorcen(Double.parseDouble(request.getParameter("porcen")));
            }

            if (request.getParameter("comprador").isEmpty()) {
                v.setComprador("");
            } else {
                v.setComprador(request.getParameter("comprador"));
            }
            v.setValor(Double.parseDouble(request.getParameter("valorVenta")));

            resultado = v.guardarVenta(v);
        %>
        <%
            if (resultado == true) {
                r1 = "alert('Venta Cargada Exitosamente!!!!!')";
                r2 = "window.open('VentasAgri.jsp', 'central')";

            } else {
                r1 = "alert('Error al intentar cargar la Venta!!!')";
                r2 = "window.open('VentasAgri.jsp', 'central')";
            }
        %>         

        <script>
            <%= r1%>
            <%= r2%>
        </script>  
        <% }else{ %>
        
        <div id="contenedor" class="container">
            
            <div id="myTabDiv">
        <h1>Ventas cargadas: </h1>
        <table>
            <thead>    
                <tr>
                    <th>Numero</th>
                    <th>Producto</th>
                    <th>Fecha</th>
                    <th>Kg</th>
                    <th>Precio Mercado</th>
                    <th>% Comision</th>
                    <th>Comprador</th>
                    <th>Valor</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <%
                    SQL sql = new SQL();
                    sql.conexion("root", "root");
                    ResultSet rs = sql.consultar("SELECT * FROM ventas ");
                    while (rs.next()) {
                        out.print("<tr>");
                        out.print("<td id=\"" + rs.getInt("idventa") + "\">" + rs.getInt("idventa") + "</td>");
                        out.print("<td id=\"" + rs.getString("producto") + "\">" + rs.getString("producto") + "</td>");
                        out.print("<td id=\"" + rs.getString("fecha") + "\">" + rs.getString("fecha") + "</td>");
                        out.print("<td id=\"" + rs.getInt("kg") + "\">" + rs.getInt("kg") + "</td>");
                        out.print("<td id=\"" + rs.getDouble("precioMercado") + "\">" + rs.getDouble("precioMercado") + "</td>");
                        out.print("<td id=\"" + rs.getDouble("porcenComision") + "\">" + rs.getDouble("porcenComision") + "</td>");
                        out.print("<td id=\"" + rs.getString("comprador") + "\">" + rs.getString("comprador") + "</td>");
                        out.print("<td id=\"" + rs.getDouble("valor") + "\">" + rs.getDouble("valor") + "</td>");
                        out.print("<td><span class=\"editar\" onclick=\"transformarEnEditable(this)\"><img src=\"imagenes/editar.png\" title=\"Editar\" alt=\"Editar\" style='cursor: pointer'></span></td>");
                        out.print("<td><span class=\"editar\" onclick=\"eliminar(this)\"><img src=\"imagenes/eliminar.png\" title=\"Eliminar\" alt=\"Eliminar\" style='cursor: pointer'></span></td>");
                        out.print("</tr>");
                    }
                %>
            </tbody>
        </table>
            </div>
        <form name = "formEdicionVentas" action="ResulEliEditVenta.jsp" method="post" onsubmit="confirEnvio()" onreset="anular()" >
            <div id="contenedorForm" class="container">

            </div> 
        </form>
        <br><input type="button" value="Volver" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla" onclick="volver()"><br />
        <input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla" onclick="volverInicio()" />
        
        </div>
    </body>
    <%}%>
</html>