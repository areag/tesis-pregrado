<%-- 
    Document   : ResultadoGastosGanaderia
    Created on : 18/02/2016, 18:35:15
    Author     : Guille
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="beans.Gganpro" %>
<jsp:useBean id="gg" class="beans.Gganpro" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" href="css/tablas.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.7.2.custom.css" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/js_gganpro.js"></script>
        <script type="text/javascript" src="js_FunGenericas.js"></script>



        <title>Tabla Gastos de Produccion</title>


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
            Gganpro GG = new Gganpro();
            GG.setGasto(request.getParameter("gasto"));
            String fe = request.getParameter("fecha");
            String dia = fe.substring(0, 2);
            String mes = fe.substring(3, 5);
            String año = fe.substring(6, 10);
            fe = año + "/" + mes + "/" + dia;
            GG.setFecha(fe);

            GG.setDescripcion(request.getParameter("ob"));
            GG.setCosto(Double.parseDouble(request.getParameter("costo")));
            resultado = gg.guardarGastos(GG);

            if (resultado == true) {
                r1 = "alert('Gastos Cargados Exitosamente!!!!!')";
                r2 = "window.open('GastosGanaderia.jsp','central')";

            } else {
                r1 = "alert('Error al intentar cargar los Gastos!!!')";
                r2 = "window.open('central.html', 'central')";

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


                <h1>Gastos de Producción</h1>

                <table>
                    <thead>    
                        <tr>
                            <th>Numero</th>
                            <th>Fecha</th>
                            <th>Tipo de Gasto</th>
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
                            ResultSet rs = sql.consultar("SELECT * FROM gpgan order by fecha desc; ");
                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs.getInt("idgpgan") + "</td>");
                                out.print("<td>" + rs.getString("fecha") + "</td>");
                                out.print("<td>" + rs.getString("gasto") + "</td>");
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

            <form name="formEdicion2" action="EditarGastosGanaderia.jsp" method="post" onsubmit="capturarEnvio()" onreset="anular()">
                <div id="contenedorForm" class="container">

                </div>

            </form>
            <br>
            <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                   onmouseout="this.style.color = 'black'" class="BotonTabla" onclick="volver()"/><br />
            <input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla"  onclick="volverInicio()" /><br />

        </div>
    </body>
    <%}%>
</html>
