<%-- 
    Document   : GastosComerComprasGanaderia
    Created on : 07/03/2016, 18:26:12
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
        <link href="css/FormCarga.css" rel="stylesheet"> 
        <script type="text/javascript" src="js/js_ggancom.js"></script>
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <title>Gastos Comercializacion de Compras Ganaderia </title> 


        <%
            int numeroGasto;

            if (session.getAttribute("idGasto") != null) {
                numeroGasto = Integer.parseInt(session.getAttribute("idGasto").toString());

            } else {
                numeroGasto = Integer.parseInt(request.getParameter("nroGasto").toString());
                session.setAttribute("idGasto", numeroGasto); // estoy pasando el numero de Gasto de la venta u compra seleccionada con el radiobutton, no el tipo!
            }
            %>
        

</head>
<body>

    <div id="contenedor" class="container">
        
          <%if (Integer.parseInt(session.getAttribute("tipoGasto").toString()) == 1) {%>
        <%="<h1>Compra " + numeroGasto + ". Cargue un Gasto.</h1>"%>
        <%} else if (Integer.parseInt(session.getAttribute("tipoGasto").toString()) == 2) {%>
        <%="<h1>Venta " + numeroGasto + ". Cargue un Gasto</h1>"%>
        <%}%>

        <div class="form"> 

            <form method="post" id="gcgan" name="gcgan" action="ResultadoGCGanaderia.jsp"   class="formularios" target="central"> <br>

                <label for="selecTipo" class="Texto">Seleccione un Gasto de Comercialización: </label>            
                <select id="selecgcgan" name="selecgcgan" class="Texto" onchange="habilitarInput(this.value)">
                    <option value="Flete">Flete</option>
                    <option value="Comision">Comision</option>
                    <option value="Guias">Guias</option>
                    <option value="10">Otros</option>
                </select><span class="red">*</span><br />

                <label id="etiquetaOtros" for="desc" class="Texto" disabled="true">  </label>
                <input type="text" id="desc" name="desc" maxlength="20" disabled="true" class="ComboMedio" /><br /><br />

                <label for="obser" class="Texto"> Observaciones: </label>
                <textarea name="obser" id="obser" rows="5" cols="40"></textarea><br />    <br/>            

                <label for="costo" class="Texto"> Costo total en $:</label>
                <span class="red">*</span>
                <input id="costo" name="costo" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)"/><br />
                <span class="red">* Campos obligatorios</span><br /><br />

                <input type="reset" value="Guardar" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonNormal" onclick="verificarVacios()"/> <br/>
            </form>

        </div>

        <div id="myTabDiv">

            <h1>Gastos Cargados</h1>

            <table>
                <thead>    
                    <tr>
                        <th>Número</th>
                        <th>Gasto</th>
                        <th>Observaciones</th>
                        <th>Costo</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>


                    </tr>
                </thead>
                <tbody>

                    <%  SQL con = new SQL();
                        con.conexion("root", "root");
                        int tipoGasto = Integer.parseInt(session.getAttribute("tipoGasto").toString());
                        ResultSet rs = null;
                        if (tipoGasto == 1) {
                            rs = con.consultar("SELECT * FROM gcgan WHERE idCompra='" + numeroGasto + "'");
                        } else if (tipoGasto == 2) {
                            rs = con.consultar("SELECT * FROM gcgan WHERE idVenta='" + numeroGasto + "'");
                        }
                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getInt("idgcgan") + "</td>");
                            out.println("<td>" + rs.getString("gasto") + "</td>");
                            out.println("<td>" + rs.getString("observacion") + "</td>");
                            out.println("<td>" + rs.getDouble("costo") + "</td>");
                            out.println("<td align=\"center\"> <span class=\"editar\" onclick=\"transformarEnEditable(this)\" style='cursor: pointer'><img src=\"imagenes/editar.png\" title=\"Editar\" alt=\"Editar\"></span>");
                            out.print("<td><span class=\"editar\" onclick=\"eliminar(this)\"><img src=\"imagenes/eliminar.png\" title=\"Eliminar\" alt=\"Eliminar\" style='cursor: pointer'></span></td>");
                            out.print("</tr>");
                        }

                    %>
                </tbody>
            </table>
        </div>

        <form name="formEdicion2" action="EditarGCGanaderia.jsp" method="post" onsubmit="capturarEnvio()" onreset="anular()">
            <div id="contenedorForm" class="container">

            </div>

        </form>
        <br>

        <input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
               onMouseOut="this.style.color = 'black'" class="BotonTabla" onclick="volverInicio()" /><br>

        <%if (Integer.parseInt(session.getAttribute("tipoGasto").toString()) == 1) {%>
        <input type="button" value="Elegir Compra" onmouseover="this.style.color = 'green'"   
               onMouseOut="this.style.color = 'black'" class="BotonTabla" onclick="window.open('SelectGCGanaderia.jsp?&boton=compra', 'central')" />
        <%} else if (Integer.parseInt(session.getAttribute("tipoGasto").toString()) == 2) {%>
        <input type="button" value="Elegir Venta" onmouseover="this.style.color = 'green'"   
               onMouseOut="this.style.color = 'black'" class="BotonTabla" onclick="window.open('SelectGCGanaderia.jsp?&boton=venta', 'central')" />
        <%}%>

    </div>
</body>
</html>
