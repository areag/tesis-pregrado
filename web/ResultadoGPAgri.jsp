<%-- 
    Document   : ResultadoGPAgri
    Created on : 23/02/2016, 09:33:15
    Author     : nulia
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="beans.GPAgri" %>
<jsp:useBean id="GPAgri" class="beans.GPAgri" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/tablas.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.7.2.custom.css" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/js_GP.js"></script>
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
       
        <%
            String desvio = request.getParameter("variableDesvio");
            if ("guardar".equals(desvio)) {%>
                 
        <%!
            String gasto;
            String desc = "General";
            boolean resultado;
            String r1;
            String r2 = "window.open('GPAgri.jsp', 'central')";
                                                                                                                                                                    %>
        <%
            GPAgri gp = new GPAgri();
            gasto = request.getParameter("selecgp");
            if (gasto.equals("8")) {
                gasto = "Insumo";
                desc = request.getParameter("Insumos");
            }
            if (gasto.equals("9")) {
                gasto = "Laboreo";
                desc = request.getParameter("Laboreos");
            }
            if (gasto.equals("10")) {
                gasto = "Otro gasto";
                desc = request.getParameter("etiquetaOtros");
            }
            gp.setGasto(gasto);
            gp.setDescripcion(desc);
            if (request.getParameter("obser").length() == 0) {
                gp.setObser(" ");
            } else {
                gp.setObser(request.getParameter("obser"));
            }
            gp.setCosto(Double.parseDouble(request.getParameter("costo")));
            String fe = request.getParameter("fecha");
            String dia = fe.substring(0, 2);
            String mes = fe.substring(3, 5);
            String año = fe.substring(6, 10);
            fe = año + "/" + mes + "/" + dia;
            gp.setFecha(fe);
            gp.toString();
            resultado = gp.guardarGP(gp);
        %>
        <%
            if (resultado == true) {
                r1 = "alert('Gasto de producción agregado Exitosamente!!!!!')";

            } else {
                r1 = "alert('Error al intentar agregar el gasto de produccion, vuelva a intentar luego!!!')";

            }
        %>
        <script>
            <%= r1%>
            <%= r2%>
        </script>   
        <%
        } else {
        %>
        <div id="contenedor" class="container">
            <div id="myTabDiv">
                <h1>Gastos de Producción cargados:</h1>
                <table>
                    <thead>    
                        <tr>
                            <th>Numero</th>
                            <th>Gasto</th>
                            <th>Descripcion</th>
                            <th>Observaciones</th>
                            <th>Costo</th>
                            <th>Fecha</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            SQL sql = new SQL();
                            sql.conexion("root", "root");
                            ResultSet rs = sql.consultar("SELECT * FROM gpagri ");
                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td id=\"" + rs.getInt("idgpagri") + "\">" + rs.getInt("idgpagri") + "</td>");
                                out.print("<td id=\"" + rs.getString("gasto") + "\">" + rs.getString("gasto") + "</td>");
                                out.print("<td id=\"" + rs.getString("desc") + "\">" + rs.getString("desc") + "</td>");
                                out.print("<td id=\"" + rs.getString("obser") + "\">" + rs.getString("obser") + "</td>");
                                out.print("<td id=\"" + rs.getDouble("costo") + "\">" + rs.getDouble("costo") + "</td>");
                                out.print("<td id=\"" + rs.getString("fecha") + "\">" + rs.getString("fecha") + "</td>");
                                out.print("<td><span class=\"editar\" onclick=\"transformarEnEditable(this)\"><img src=\"imagenes/editar.png\" title=\"Editar\" alt=\"Editar\" style='cursor:pointer'></span></td>");
                                out.print("<td><span class=\"editar\" onclick=\"eliminar(this)\"><img src=\"imagenes/eliminar.png\" title=\"Eliminar\" alt=\"Eliminar\" style='cursor:pointer'></span></td>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
           
            <form name = "formEdicion2" action="ResulEliEditGP.jsp" method="post" onsubmit="confirEnvio()" onreset="anular()">
                <div id="contenedorForm" class="container">

                </div> 
            </form>

            <br><input type="button" value="Volver" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonTabla" onclick="volver()"/>
            <br><input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla" onclick="volverInicio()" />
        </div>
    </body>
     <%} %>
</html>
