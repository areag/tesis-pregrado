<%-- 
    Document   : ResulGastosAlimGanaderia
    Created on : 02/03/2016, 10:03:43
    Author     : Guille
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.Gganalim"%>
<jsp:useBean id="ga" class="beans.Gganalim" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" href="css/tablas.css">
        <script type="text/javascript" src="js/js_gganalim.js"></script>
        <script type="text/javascript" src="js_FunGenericas.js"></script>


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
            Gganalim GA = new Gganalim();
            String fe = request.getParameter("fecha");
            String dia = fe.substring(0, 2);
            String mes = fe.substring(3, 5);
            String año = fe.substring(6, 10);
            fe = año + "/" + mes + "/" + dia;
            GA.setFecha(fe);
            GA.setComponente(request.getParameter("gastoalim"));
            GA.setKg(Double.parseDouble(request.getParameter("kilo")));
            GA.setPreciokg(Double.parseDouble(request.getParameter("preciokilo")));
            GA.setObservacion(request.getParameter("ob1"));
            GA.setCosto(Double.parseDouble(request.getParameter("costo1")));
            resultado = ga.guardarGastos(GA);

            if (resultado == true) {
                r1 = "alert('Gastos Cargados Exitosamente!!!!!')";
                r2 = "window.open('GastosGanaderia.jsp','central')";

            } else {
                r1 = "alert('Error al intentar cargar los Gastos!!!')";
                r2 = "window.open('GastosGanaderia.jsp', 'central')";

            }
        %>
        <script>
            <%=r1%>
            <%=r2%>
        </script> 
        <title>JSP Page</title>
    </head>
    <% } else {
    %>
    <body>

        <div id="contenedor" class="container">



            <div id="myTabDiv">


                <h1>Gastos de Alimentación</h1>

                <table>
                    <thead>    
                        <tr>
                            <th>Numero</th>
                            <th>Fecha</th>
                            <th>Componente</th>
                            <th>Kgs</th>
                            <th>$/Kg</th>
                            <th>Observaciones</th>
                            <th>Costo</th>
                            <th>Modificar</th>
                            <th>Eliminar</th>


                        </tr>
                    </thead>
                    <tbody>

                        <%
                            SQL sql = new SQL();
                            sql.conexion("root", "root");
                            ResultSet rs = sql.consultar("SELECT * FROM gagan order by fecha desc; ");
                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs.getInt("idgagan") + "</td>");
                                out.print("<td>" + rs.getString("fecha") + "</td>");
                                out.print("<td>" + rs.getString("componente") + "</td>");
                                out.print("<td>" + rs.getDouble("kg") + "</td>");
                                out.print("<td>" + rs.getDouble("preciokg") + "</td>");
                                out.print("<td>" + rs.getString("observacion") + "</td>");
                                out.print("<td>" + rs.getDouble("costo") + "</td>");
                                out.println("<td align=\"center\"> <span class=\"editar\" onclick=\"transformarEnEditable(this)\" style='cursor: pointer'><img src=\"imagenes/editar.png\" title=\"Editar\" alt=\"Editar\"></span>");
                                out.print("<td><span class=\"editar\" onclick=\"eliminar(this)\"><img src=\"imagenes/eliminar.png\" title=\"Eliminar\" alt=\"Eliminar\" style='cursor: pointer'></span></td>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <form name="formEdicion2" action="EditarGastosAlimGanaderia.jsp" method="post" onsubmit="capturarEnvio()" onreset="anular()">
                <div id="contenedorForm" class="container">

                </div>
            </form>
            <br>
            <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                   onmouseout="this.style.color = 'black'" class="BotonTabla" onclick="volver()"/><br />
            <input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla" onclick="volverInicio()" />
        </div>
    </body>
    <%}%>
</html>
