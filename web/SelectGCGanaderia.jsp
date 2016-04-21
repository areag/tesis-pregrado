<%-- 
    Document   : SelectGastComCompGanaderia
    Created on : 07/03/2016, 17:50:32
    Author     : Guille
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
        <title>Gastos de Comercializacion Compras Ganadería</title>


        <script>

            function verificarRadio() {
                var radios = false;
                var len = document.selecgasto.selec.length;
                var valor;
                var i;
                for (i = 0; i < len; i++) {
                    if (document.selecgasto.selec[i].checked) {
                        valor = document.selecgasto.selec[i].value;
                        document.selecgasto.nroGasto.value = valor; //mando el idCompra a GastosComerComprasGanaderia.jsp
                        radios = true;
                    }
                }
                if (radios == false) {
                    alert("Seleccione una compra!!");
                } else {

                    document.selecgasto.submit();
                }
            }

        </script>



    </head>
    <body>

        <div id="contenedor" class="container">

            <form method="post" action="GCGanaderia.jsp" id="selecgasto" name="selecgasto" target="central">

                <%   
                    session.removeAttribute("idGasto");
                    String boton = request.getParameter("boton");
                    if ("compra".equals(boton)) {
                        
                        if (session.getAttribute("tipoGasto") != null) {
                            session.getAttribute("tipoGasto");
                        } else {
                            session.setAttribute("tipoGasto", new Integer(1));
                        }
                %>


                <div id="myTabDiv">


                    <h1>Seleccione una Compra</h1>

                    <table>
                        <thead>    
                            <tr>
                                <th>Número de Compra</th>
                                <th>Fecha</th>
                                <th>Kg/Ternero (promedio)</th>
                                <th>$/Kg</th>
                                <th>Cantidad</th>
                                <th>Valor</th>
                                <th>
                        <div align="center">
                            <img src="imagenes/seleccion.png" title="Seleccione" alt="Seleccion">
                        </div>
                        </th>
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
                                    out.print("<td> <input type=\"radio\" name=\"selec\" id=\"selec\" value=\"" + rs.getInt("numeroCompra") + "\"> </td>");
                                    out.print("</tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <br/>
                <input type="hidden" name="nroGasto">
                <input type="reset" value="Seccion Gastos" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonTabla" onclick="verificarRadio()" />
            </form>

            <%} else if ("venta".equals(boton)) {
                
                if (session.getAttribute("tipoGasto") != null) {
                            session.getAttribute("tipoGasto");
                        } else {
                            session.setAttribute("tipoGasto", new Integer(2));
                        }
            %>
            
            <div id="myTabDiv">

                <h1>Seleccione una Venta</h1>

                <table>
                    <thead>    
                        <tr>
                            <th>Número de Venta</th>
                            <th>Fecha</th>
                            <th>Días de Encierre</th>
                            <th>Kg/Ternero (promedio)</th>
                            <th>$/Kg</th>
                            <th>Cantidad</th>
                            <th>Total de Kg. Vendidos</th>
                            <th>Valor de Venta</th>
                            <th>
                    <div align="center">
                        <img src="imagenes/seleccion.png" title="Seleccione" alt="Seleccion">
                    </div>
                    </th>
                    </tr>
                    </thead>

                    <tbody>

                        <%
                            
                            SQL sql = new SQL();
                            sql.conexion("root", "root");
                            ResultSet rs = sql.consultar("SELECT * FROM vgan order by numeroVenta; ");
                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs.getInt("numeroVenta") + "</td>");
                                out.print("<td>" + rs.getString("fecha") + "</td>");
                                out.print("<td>" + rs.getInt("dencierre") + "</td>");
                                out.print("<td>" + rs.getDouble("kgTernero") + "</td>");
                                out.print("<td>" + rs.getDouble("precioKg") + "</td>");
                                out.print("<td>" + rs.getInt("cantidad") + "</td>");
                                out.print("<td>" + rs.getDouble("kgVendido") + "</td>");
                                out.print("<td>" + rs.getDouble("valor") + "</td>");
                                out.print("<td> <input type=\"radio\" name=\"selec\" id=\"selec\" value=\"" + rs.getInt("numeroVenta") + "\"> </td>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <br/>
            <input type="hidden" name="nroGasto">
            <input type="reset" value="Seccion Gastos" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonTabla" onclick="verificarRadio()" />
        </form>


        <%}%> 

        <input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
               onMouseOut="this.style.color = 'black'" class="BotonTabla"  onclick="volverInicio()" />
    </div>
</body>
</html>
