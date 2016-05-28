<%-- 
    Document   : ResulExistenciasGan
    Created on : 11/04/2016, 19:10:29
    Author     : Guille
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page import="beans.ExistenciasGan" %>
<jsp:useBean id="eg" class="beans.ExistenciasGan" scope="session" /> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/tablas.css">
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <script type="text/javascript" src="js/js_existenciasgan.js"></script>

        <title>Resultado Existencias Ganaderia</title>

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
            try {
                ExistenciasGan EG = new ExistenciasGan();
                EG.setFecha_desde(request.getParameter("fecha_desde"));
                String fecha_hasta = request.getParameter("fecha_hasta");
                String dia = fecha_hasta.substring(0, 2);
                String mes = fecha_hasta.substring(3, 5);
                String año = fecha_hasta.substring(6, 10);
                fecha_hasta = año + "-" + mes + "-" + dia;
                EG.setFecha_hasta(fecha_hasta);               
                EG.setPorcentaje(Double.parseDouble(request.getParameter("porcentaje")));
                EG.setPrecio_ternero(Double.parseDouble(request.getParameter("precio_ternero")));
                EG.setPrecio_novillo(Double.parseDouble(request.getParameter("precio_novillo")));
                EG.setIncremento(Double.parseDouble(request.getParameter("incremento")));
                EG.setDisminucion(Double.parseDouble(request.getParameter("disminucion")));
                EG.setPeso_ternero(Double.parseDouble(request.getParameter("peso_ternero")));
                EG.setPeso_novillo(Double.parseDouble(request.getParameter("peso_novillo")));
                EG.setMuerte_ternero(Double.parseDouble(request.getParameter("muerte_ternero")));
                EG.setMuerte_novillo(Double.parseDouble(request.getParameter("muerte_novillo")));
                EG.setEft(EG.nuevo_eft());
                EG.setEfn(EG.nuevo_efn());
                resultado = eg.guardarExistGan(EG);

            } catch (Exception e) {
                out.print("Ocurrio una excepcion: " + e.getMessage());
            }

            if (resultado == true) {
                r1 = "alert('Existencias Cargadas Exitosamente!!!!!')";
                r2 = "window.open('ExistenciasGan.jsp','central')";

            } else {
                r1 = "alert('Error al intentar cargar las Existencias!!!')";
                r2 = "window.open('ExistenciasGan.jsp', 'central')";

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


                <h1>Existencias Ganaderas</h1>

                <table>
                    <thead>    
                        <tr>
                            <th>Número</th>
                            <th>Desde</th>
                            <th>Hasta</th>
                            <th>EFT</th>
                            <th>EFN</th>
                            <th>Porcentaje</th>
                            <th>Precio Ternero al Cierre</th>
                            <th>Precio Novillo al Cierre</th>
                            <th>Incremento por cambio categoria</th>
                            <th>Disminucion por cambio categoria</th>
                            <th>Peso Promedio Ternero</th>
                            <th>Peso Promedio Novillo</th>
                            <th>Muertes Ternero</th>
                            <th>Muertes Novillo</th>
                            <th>Modificar Existencia</th>
                            <th>Generar Reporte</th>
                            <th>Eliminar Existencia</th>


                        </tr>
                    </thead>
                    <tbody>

                        <%
                            SQL sql = new SQL();                                                     
                            sql.conexion("root", "root");
                            ResultSet rs = sql.consultar("SELECT * FROM existenciasgan order by fecha_hasta desc; ");
                            while (rs.next()) {                                
                                out.print("<tr>");
                                out.print("<td>" + rs.getInt("idexistenciasgan") + "</td>");
                                out.print("<td>" + rs.getString("fecha_desde") + "</td>");
                                out.print("<td>" + rs.getString("fecha_hasta") + "</td>");
                                out.print("<td>" + rs.getInt("eft") + "</td>");
                                out.print("<td>" + rs.getInt("efn") + "</td>");
                                out.print("<td>" + rs.getDouble("porcentaje") + "</td>");
                                out.print("<td>" + rs.getDouble("precio_ternero") + "</td>");
                                out.print("<td>" + rs.getDouble("precio_novillo") + "</td>");
                                out.print("<td>" + rs.getDouble("incremento") + "</td>");
                                out.print("<td>" + rs.getDouble("disminucion") + "</td>");
                                out.print("<td>" + rs.getDouble("peso_ternero") + "</td>");
                                out.print("<td>" + rs.getDouble("peso_novillo") + "</td>");
                                out.print("<td>" + rs.getDouble("muerte_ternero") + "</td>");
                                out.print("<td>" + rs.getDouble("muerte_novillo") + "</td>");
                                out.print("<td align=\"center\"> <span class=\"editar\" onclick=\"transformarEnEditable(this)\" style='cursor: pointer'><img src=\"imagenes/editar.png\" title=\"Editar\" alt=\"Editar\"></span>");
                                out.print("<td align=\"center\"> <span class=\"editar\" onclick=\"window.open('ReportesGan.jsp?&idexistenciasgan=" + rs.getInt("idexistenciasgan") + "','reportesgan','width=595.28,height=541.89');\" style='cursor: pointer'><img src=\"imagenes/generar_reporte.png\" title=\"Reporte\" alt=\"Reporte\"></span>");                               
                                out.print("<td><span class=\"editar\" onclick=\"eliminar(this)\"><img src=\"imagenes/eliminar.png\" title=\"Eliminar\" alt=\"Eliminar\" style='cursor: pointer'></span></td>");
                                out.print("</tr>");
                            }
                            rs.close();
                        %>
                    </tbody>
                </table>
            </div>

            <form name="formEdicion2" action="EditarExistenciasGan.jsp" method="post" onsubmit="capturarEnvio()" onreset="anular()">

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
