<%-- 
    Document   : ResultadoComprasGanaderia
    Created on : 04/03/2016, 17:32:32
    Author     : Guille
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.Cgan" %>
<jsp:useBean id="cg" class="beans.Cgan" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/tablas.css">
        <script type="text/javascript" src="js/js_cgan.js"></script>
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <title>Resultado Compras Ganaderia</title>

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
            Cgan CG = new Cgan();
            CG.setNumeroCompra(Integer.parseInt(request.getParameter("nrocompra")));
            String fe = request.getParameter("fecha");
            String dia = fe.substring(0, 2);
            String mes = fe.substring(3, 5);
            String año = fe.substring(6, 10);
            fe = año + "/" + mes + "/" + dia;
            CG.setFecha(fe);

            if (request.getParameter("kgternero").isEmpty()) {
                CG.setKgTernero(0);
            } else {
                CG.setKgTernero(Double.parseDouble(request.getParameter("kgternero")));
            }
            
            if (request.getParameter("cant").isEmpty()) {
                CG.setCantidad(0);
            } else {
                CG.setKgTernero(Integer.parseInt(request.getParameter("cant")));
            }
            
            CG.setPrecioKg(Double.parseDouble(request.getParameter("precioKg")));
            CG.setCosto(Double.parseDouble(request.getParameter("costo")));
            resultado = cg.guardarCompra(CG);

            if (resultado == true) {
                r1 = "alert('Compras Cargadas Exitosamente!!!!!')";
                r2 = "window.open('ComprasGanaderia.jsp','central')";

            } else {
                r1 = "alert('Error al intentar cargar las Compras!!!')";
                r2 = "window.open('ComprasGanaderia.jsp', 'central')";

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
                            <th>Modificar</th>
                            <th>Eliminar</th>


                        </tr>
                    </thead>
                    <tbody>

                        <%
                            SQL sql = new SQL();
                            sql.conexion("root", "root");
                            ResultSet rs = sql.consultar("SELECT * FROM cgan order by numeroCompra; ");
                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs.getInt("numeroCompra") + "</td>");
                                out.print("<td>" + rs.getString("fecha") + "</td>");
                                out.print("<td>" + rs.getDouble("kgTernero") + "</td>");
                                out.print("<td>" + rs.getDouble("precioKg") + "</td>");
                                out.print("<td>" + rs.getInt("cantidad") + "</td>");
                                out.print("<td>" + rs.getDouble("costo") + "</td>");
                                out.println("<td align=\"center\"> <span class=\"editar\" onclick=\"transformarEnEditable(this)\" style='cursor: pointer'><img src=\"imagenes/editar.png\" title=\"Editar\" alt=\"Editar\"></span>");
                                out.print("<td><span class=\"editar\" onclick=\"eliminar(this)\"><img src=\"imagenes/eliminar.png\" title=\"Eliminar\" alt=\"Eliminar\" style='cursor: pointer'></span></td>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <form name="formEdicion2" action="EditarComprasGanaderia.jsp" method="post" onsubmit="capturarEnvio()" onreset="anular()">
                <div id="contenedorForm" class="container">

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
