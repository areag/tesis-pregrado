<%-- 
    Document   : GC
    Created on : 08/01/2016, 22:28:02
    Author     : nulia
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
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <script type="text/javascript" src="js/js_GC.js"></script>
        <%
            int idVenta;
            if (session.getAttribute("gc_Agri") != null) {
                idVenta = Integer.parseInt(session.getAttribute("gc_Agri").toString());
            } else {
                idVenta = Integer.parseInt(request.getParameter("selec").toString());
                session.setAttribute("gc_Agri", "" + idVenta);
            }
            System.out.println("************El id de venta q me traje es "+idVenta+"**************");

        %>
        
        
  
        <title >AREAG Gastos de Comercialización</title>
    </head>
    <body>
        
        <div id="contenedor" class="container">
             
       <%="<h1>Venta " + session.getAttribute("gc_Agri") + ". Cargue un Gasto.</h1>"%>

        <div class="form"> 

        <form id="miform" name="miform" method="post" action="ResulGCagri.jsp" target="central"> <br>
            <label for="selecTipo" class="Texto">Seleccione un Gasto de Comercialización: </label>            
            <select id="selecgc" name="selecgc" class="ComboMedio" onchange="habilitarInput(this.value)">
                <option value="Flete">Flete</option>
                <option value="Limpieza y clasificacion">Limpieza y clasificación</option>
                <option value="Cargadora">Cargadora</option>
                <option value="Regalias">Regalías</option>
                <option value="Secada">Secada</option>
                <option value="Paritarias">Paritarias</option>
                <option value="Analisis">Análisis</option>
                <option value="Sellado">Sellado</option>
                <option value="Impuestos">Impuestos</option>
                <option value="10">Otro</option>
            </select><span class="red">*</span><br /><br />
            <label id="etiquetaOtros" for="desc" class="Texto" disabled="true">  </label>
            <input type="text" id="desc" name="desc" maxlength="20" disabled="true" class="ComboMedio" /><br /><br />

            <label for="obser" class="Texto"> Observaciones: </label>
            <textarea name="obser" id="obser" rows="8" cols="40" class="ComboMedio"></textarea><br /><br />

            <label for="costo" class="Texto"> Costo total en $:</label>
            <span class="red">*</span>
            <input id="costo" name="costo" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)"/><br />

            <span class="red">* Campos obligatorios</span><br /><br />
            <input type="button" value="Guardar" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonNormal" onclick="verificarVacios()"/>
        </form><br />
        </div>
        
        
        
        <div id="myTabDiv">
            
            <h1>Gastos Cargados</h1>
            
            <table id="mitabla" name="mitabla" >
                <thead>
                    <tr>
                        <th align="center">Numero</th>
                        <th align="center">Gasto</th>
                        <th align="center">Observaciones</th>
                        <th align="center">Costo</th>
                        <th align="center">Modificar</th>
                        <th align="center">Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%  SQL con = new SQL();
                        con.conexion("root", "root");
                        ResultSet rs = con.consultar("SELECT * FROM gcagri WHERE idVenta='" + idVenta + "'");
                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getInt("idGastosComAgri") + "</td>");
                            out.println("<td>" + rs.getString("Gasto") + "</td>");
                            out.println("<td>" + rs.getString("Observacion") + "</td>");
                            out.println("<td>" + rs.getDouble("Costo") + "</td>");
                            out.println("<td align=\"center\"> <span class=\"editar\" onclick=\"transformarEnEditable(this)\"> <img src=\"imagenes/editar.png\" title=\"Editar\" alt=\"Editar\" style='cursor: pointer'></span></td>");
                            out.println("<td align=\"cebter\"> <span class=\"editar\" onclick=\"eliminar(this)\"> <img src=\"imagenes/eliminar.png\" title=\"Eliminar\" alt=\"Eliminar\" style='cursor: pointer'></span></td>");
                            out.println("</tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
        <form name = "formEdicion2" action="ResulEliEditGC.jsp" method="post" onsubmit="capturarEnvio()" onreset="anular()">
            <div id="contenedorForm" class="container">

            </div> 
        </form>
        
                
        <br><input type="button" value="Elegir Venta" onmouseover="this.style.color = 'green'"   
               onMouseOut="this.style.color = 'black'" class="BotonTabla" onclick="window.open('selecVenta.jsp', 'central')" /><br/>
                
        <input type="button" value="Finalizar" onmouseover="this.style.color = 'green'"   
               onMouseOut="this.style.color = 'black'" class="BotonNormal" onclick="volverInicio()" />
        
        </div>
    </body>
</html>
