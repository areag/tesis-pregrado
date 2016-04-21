<%-- 
    Document   : ResultadoLote
    Created on : 02/03/2016, 18:11:17
    Author     : nulia
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@ page import="beans.Lote" %>
<jsp:useBean id="lote" class="beans.Lote" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/tablas.css">
        <script type="text/javascript" src="js/js_Lotes.js"></script>
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <title>AREAG</title>
    </head>
    <body>
        <%
            String desvio = request.getParameter("variableDesvio");
            if ("guardar".equals(desvio)) {
        %>  
        <%!
            String cultivo;
            boolean resultado;
            String r1;
            String r2;
            String nombre;
            int hp;
            boolean propia;
                    %>
        <%
            Lote l = new Lote();
            nombre = request.getParameter("nombre");
            cultivo = request.getParameter("cultivo");
            if (cultivo.equals("7")) {
                cultivo = request.getParameter("cultivoname");
            }
            hp = Integer.parseInt(request.getParameter("hp"));

            if (request.getParameter("proalq").equals("propio")) {
                propia = true;
            } else {
                propia = false;
            }
            l.setNombre(nombre);
            l.setCultivo(cultivo);
            l.setHp(hp);
            l.setPropio(propia);

            if (request.getParameter("rb").isEmpty()) {
                l.setRb(0);
            } else {
                l.setRb(Double.parseDouble(request.getParameter("rb")));
            }

            if (request.getParameter("ei").isEmpty()) {
                l.setExisIni(0);
            } else {
                l.setExisIni(Double.parseDouble(request.getParameter("ei")));
            }

            if (request.getParameter("porcen").isEmpty()) {
                l.setPorcen(0);
            } else {
                l.setPorcen(Double.parseDouble(request.getParameter("porcen")));
            }
            resultado = l.guardarLote(l);
        %>
        <% if (resultado == true) {
                r1 = "alert('Lote Cargado Exitosamente!!!!!')";
                r2 = "window.open('Lotes.jsp', 'central')";
            } else {
                r1 = "alert('Error al intentar cargar el Lote!!!')";
                r2 = "window.open('Lotes.jsp', 'central')";
            }
        %>    
        <script>
            <%= r1%>
            <%= r2%>
        </script> 
        <% } else {%>

        <div id="contenedor" class="container">
            <div id="myTabDiv">

            <h1>Lotes cargados </h1>
            <table>
                <thead>    
                    <tr>
                        <th>Numero</th>
                        <th>Nombre</th>
                        <th>Cultivo</th>
                        <th>Has Producidas</th>
                        <th>Rto Bruto</th>
                        <th>Existencia Inicial</th>
                        <th>% Gastos Comercializacion</th>
                        <th>¿Propia?</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String propia;
                        SQL sql = new SQL();
                        sql.conexion("root", "root");
                        ResultSet rs = sql.consultar("SELECT * FROM lotes ");
                        while (rs.next()) {
                            out.print("<tr>");
                            out.print("<td id=\"" + rs.getInt("idlote") + "\">" + rs.getInt("idlote") + "</td>");
                            out.print("<td id=\"" + rs.getString("nombre") + "\">" + rs.getString("nombre") + "</td>");
                            out.print("<td id=\"" + rs.getString("cultivo") + "\">" + rs.getString("cultivo") + "</td>");
                            out.print("<td id=\"" + rs.getInt("hp") + "\">" + rs.getInt("hp") + "</td>");
                            out.print("<td id=\"" + rs.getDouble("rb") + "\">" + rs.getDouble("rb") + "</td>");
                            out.print("<td id=\"" + rs.getDouble("existenciaInicial") + "\">" + rs.getDouble("existenciaInicial") + "</td>");
                            out.print("<td id=\"" + rs.getDouble("porcenGC") + "\">" + rs.getDouble("porcenGC") + "</td>");
                            if (rs.getInt("propia") == 1) {
                                propia = "SI";
                            } else {
                                propia = "NO";
                            }
                            out.print("<td>" + propia + "</td>");
                            out.print("<td><span class=\"editar\" onclick=\"transformarEnEditable(this)\"><img src=\"imagenes/editar.png\" title=\"Editar\" alt=\"Editar\" style='cursor: pointer'></span></td>");
                            out.print("<td><span class=\"editar\" onclick=\"eliminar(this)\"><img src=\"imagenes/eliminar.png\" title=\"Eliminar\" alt=\"Eliminar\" style='cursor: pointer'></span></td>");
                            out.print("</tr>");
                        }
                    %>
                </tbody>
            </table>
                </div>
            <form name = "formEdicionLotes" action="ResulEliEditLote.jsp" method="post" onsubmit="confirEnvio()" onreset="anular()" >
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
