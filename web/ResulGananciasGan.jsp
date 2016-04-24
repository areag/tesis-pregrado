<%-- 
    Document   : ResulGananciasGan
    Created on : 23/04/2016, 20:35:52
    Author     : Guille
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.GananciasGan" %>
<jsp:useBean id="gg" class="beans.GananciasGan" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/tablas.css">
 
        <script type="text/javascript" src="js/js_gananciasGan.js"></script>
        <script type="text/javascript" src="js_FunGenericas.js"></script>



        <%

            String r1 = "";
            String r2 = "";
            int size = 0;

            String fecha_desde = request.getParameter("fecha_desde");
            String dia_desde = fecha_desde.substring(0, 2);
            String mes_desde = fecha_desde.substring(3, 5);
            String año_desde = fecha_desde.substring(6, 10);
            fecha_desde = año_desde + "/" + mes_desde + "/" + dia_desde;

            String fecha_hasta = request.getParameter("fecha_hasta");
            String dia_hasta = fecha_hasta.substring(0, 2);
            String mes_hasta = fecha_hasta.substring(3, 5);
            String año_hasta = fecha_hasta.substring(6, 10);
            fecha_hasta = año_hasta + "/" + mes_hasta + "/" + dia_hasta;


        %>

        <title>Generar Ganancias</title>

    </head>
    <body>
        <div id="contenedor" class="container">



            <div id="myTabDiv">

                <h1>Ganancias Generadas entre el: <%=fecha_desde%> y el: <%=fecha_hasta%>  </h1>

                <table>
                    <thead>    
                        <tr>

                            <th>Fecha</th>                        
                            <th>Valor</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            
                            SQL sql = new SQL();
                            sql.conexion("root", "root");
                            ResultSet rs = sql.consultar("SELECT fecha, valor FROM vgan WHERE fecha >= '" + fecha_desde + "' AND fecha <= '" + fecha_hasta + "' order by fecha desc");
                            double acu = 0;
                            int i = 0;
                            
                            while (rs.next()) {
                                acu += rs.getDouble("valor");
                                i++;             
                                out.print("<tr>");
                                out.print("<td>" + rs.getString("fecha") + "</td>");
                                out.print("<td>" + rs.getDouble("valor") + "</td>");
                                out.print("</tr>");
                            }                           
                            if (rs != null) {                            
                                    rs.beforeFirst();
                                    rs.last();
                                    size = rs.getRow();                              
                                if (size == 0) {
                                    r1 = "alert('No existen Ventas para la seleccion realizada')";
                                    r2 = "window.open('GananciaGan.jsp','central')";
                                }
                            }                            
                        %>
                    </tbody>
                </table>
            </div> <br/>
            
                    <label name="ib" for="IB" class="Texto"> Ingreso Bruto: </label>
                    <input type="text" name="ib" id="ib" class="ComboMedio" value="<%=acu%>" readonly="readonly"><br /><br />
               
            <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                   onmouseout="this.style.color = 'black'" class="BotonTabla" onclick="volver()"/><br />

            <input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla"  onclick="volverInicio()" />

        </div>

        <script>
            <%=r1%>
            <%=r2%>
        </script> 

    </body>
</html>
