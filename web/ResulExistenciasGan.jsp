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
            ExistenciasGan EG = new ExistenciasGan();
            String fe = request.getParameter("fecha");
            String dia = fe.substring(0, 2);
            String mes = fe.substring(3, 5);
            String año = fe.substring(6, 10);
            fe = año + "/" + mes + "/" + dia;
            EG.setFecha(fe);
            EG.setPorcentaje(Double.parseDouble(request.getParameter("porcentaje")));
            EG.setPrecio_ternero(Double.parseDouble(request.getParameter("precio_ternero")));
            EG.setPrecio_novillo(Double.parseDouble(request.getParameter("precio_novillo")));
            EG.setIncremento(Double.parseDouble(request.getParameter("incremento")));
            EG.setDisminucion(Double.parseDouble(request.getParameter("disminucion")));
            EG.setPeso_ternero(Double.parseDouble(request.getParameter("peso_ternero")));
            EG.setPeso_novillo(Double.parseDouble(request.getParameter("peso_novillo")));
            EG.setMuerte_ternero(Double.parseDouble(request.getParameter("muerte_ternero")));
            EG.setMuerte_novillo(Double.parseDouble(request.getParameter("muerte_novillo")));
            resultado = eg.guardarExistGan(EG);
            
            
            System.out.print(EG.getFecha());
            System.out.print(EG.getPorcentaje());
            System.out.print(EG.getPrecio_ternero());
            System.out.print(EG.getPrecio_novillo());
            System.out.print(EG.getIncremento());
            System.out.print(EG.getDisminucion());
            System.out.print(EG.getPeso_ternero());
            System.out.print(EG.getPeso_novillo());
            System.out.print(EG.getMuerte_ternero());
            System.out.print(EG.getMuerte_novillo());

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
                            <th>Numero</th>
                            <th>Fecha</th>
                            <th>Porcentaje</th>
                            <th>Precio Ternero al Cierre</th>
                            <th>Precio Novillo al Cierre</th>
                            <th>Incremento por cambio categoria</th>
                            <th>Disminucion por cambio categoria</th>
                            <th>Peso Promedio Ternero</th>
                            <th>Peso Promedio Novillo</th>
                            <th>Muertes Ternero</th>
                            <th>Muertes Novillo</th>
                            <th>Modificar</th>
                            <th>Eliminar</th>


                        </tr>
                    </thead>
                    <tbody>

                        <%
                            SQL sql = new SQL();
                            sql.conexion("root", "root");
                            ResultSet rs = sql.consultar("SELECT * FROM existenciasgan order by fecha desc; ");
                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs.getInt("idexistenciasgan") + "</td>");
                                out.print("<td>" + rs.getString("fecha") + "</td>");
                                out.print("<td>" + rs.getDouble("porcentaje") + "</td>");
                                out.print("<td>" + rs.getDouble("precio_ternero") + "</td>");
                                out.print("<td>" + rs.getDouble("precio_novillo") + "</td>");
                                out.print("<td>" + rs.getDouble("incremento") + "</td>");
                                out.print("<td>" + rs.getDouble("disminucion") + "</td>");
                                out.print("<td>" + rs.getDouble("peso_novillo") + "</td>");
                                out.print("<td>" + rs.getDouble("peso_novillo") + "</td>");
                                out.print("<td>" + rs.getDouble("muerte_ternero") + "</td>");
                                out.print("<td>" + rs.getDouble("muerte_novillo") + "</td>");
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
