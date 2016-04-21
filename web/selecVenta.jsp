<%-- 
    Document   : selecVenta
    Created on : 21/01/2016, 10:00:37
    Author     : nulia
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
        <title>Seleccionar Venta Agrícola</title>

        <script>

            function verificarRadio() {
                
                var radios = false;
                var len = document.selecventa.selec.length;               
                
                for (var i = 0; i < len; i++) {
                    if (document.selecventa.selec[i].checked) {
                        radios = true;
                    }
                }
                if (radios == false) {
                    alert("Seleccione una venta!!");
                } else {
                    document.selecventa.submit();
                }
            }

        </script>


    </head>
    <body>
        <div class="container"> 

            <form method="post" action="GC.jsp" target="central" id="selecventa" name="selecventa"> 
                <h1>Seleccione una venta:</h1>

                <table >
                    <thead>    
                        <tr>
                            <th>Numero</th>
                            <th>Producto</th>
                            <th>Fecha</th>
                            <th>Kg</th>
                            <th>$Mercado</th>
                            <th>% Comision</th>
                            <th>Comprador</th>
                            <th>Valor </th>
                            <th>
                    <div align="center">
                        <img src="imagenes/seleccion.png" title="Seleccione" alt="Seleccion">
                    </div>
                    </th>
                    </tr>
                    </thead>
                    <tbody>
                        <%
                            session.removeAttribute("gc_Agri");
                            SQL sql = new SQL();
                            sql.conexion("root", "root");
                            ResultSet rs = sql.consultar("SELECT * FROM VENTAS ");
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
                                out.print("<td> <input type=\"radio\" name=\"selec\" id=\"selec\" value=\"" + rs.getInt("idVenta") + "\"> </td>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody><br />
                </table>
                <input type="reset" value="Cargar Gastos" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonTabla" onclick="verificarRadio()" />
            </form>
            <input type="button" value="Volver" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonTabla" onclick="volver()"><br />

        </div>
    </body>
</html>

