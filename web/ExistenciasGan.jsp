<%-- 
    Document   : ExistenciasGan
    Created on : 11/04/2016, 18:45:04
    Author     : Guille
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
<%@page import="beans.ExistenciasGan" %>
<jsp:useBean id="eg" class="beans.ExistenciasGan" scope="session" /> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.7.2.custom.css" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script> 

        <link href="css/FormCarga.css" rel="stylesheet"> 
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <script type="text/javascript" src="js/js_existenciasgan.js"></script>

        <%
            Date actual = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy");
            String actual_date = ft.format(actual); // devuelve el dia de la fecha...ver en q se puede usar

            String existencias[] = eg.existencias_ant();
            String eft_ant = existencias[0];
            String efn_ant = existencias[1];
            String fecha_ant = existencias[2];


        %>

        <title>Existencias Ganaderia</title>
    </head>
    <body>
        <div class="form">

            <h3> Existencias Ganaderas </h3>

            <form method="post" id="existenciasgan" name="existenciasgan" action="ResulExistenciasGan.jsp"  class="formularios" target="central"> <br>
                
                <input id="fecha_desde" name="fecha_desde" type="hidden" value="<%=fecha_ant%>">

                <label for="titleExitencia" class="Texto"> Ultima Existencia cargada al <%=fecha_ant%>: </label><br /><br />
                <label for="existenciaTernero" class="Texto"> Terneros: </label>
                <input type="text" name="existenciaTernero" id="existenciaTernero" class="ComboMedio" readonly="readonly" value="<%=eft_ant%>"/><br />

                <label for="existenciaNovillos" class="Texto"> Novillos: </label>
                <input type="text" name="existenciaNovillos" id="existenciaNovillos" class="ComboMedio" readonly="readonly" value="<%=efn_ant%>" /> <br />




                <h3> Cargar nueva Existencia </h3> <br />


                <label for="fecha" class="Texto"> Seleccionar Fecha: </label>
                <span class="red">*</span>
                <input type="text" name="fecha_hasta" id="fecha" readonly="readonly" onchange="check_año()" /><br /><br /> 

                <label for="porcentaje" class="Texto"> Porcentaje de gastos de ventas: % </label>
                <span class="red">*</span>
                <input id="porcentaje" name="porcentaje" maxlength="3" class="ComboMedio" onKeyPress="return soloNumeros(event)"  /><br /><br />

                <label for="precio_ternero" class="Texto"> Precio de Plaza al Cierre Terneros:</label>  
                <span class="red">*</span>
                <input id="precio_ternero" name="precio_ternero" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)" /><br /><br />

                <label for="precio_novillo" class="Texto"> Precio de Plaza al Cierre Novillos:</label>  
                <span class="red">*</span>
                <input id="precio_novillo" name="precio_novillo" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)"  /><br /><br />

                <label for="incremento" class="Texto"> Incrementos por cambio de categoria:</label>  
                <span class="red">*</span>
                <input id="incremento" name="incremento" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)"  /><br /><br />

                <label for="disminucion" class="Texto"> Disminuciones por cambio de categoria:</label>
                <span class="red">*</span>
                <input id="disminucion" name="disminucion" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)"  /><br /><br />

                <label for="peso_ternero" class="Texto"> Peso Promedio Ternero:</label>     
                <span class="red">*</span>
                <input id="peso_ternero" name="peso_ternero" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)" /><br /><br />

                <label for="peso_novillo" class="Texto"> Peso Promedio Novillo:</label>   
                <span class="red">*</span>
                <input id="peso_novillo" name="peso_novillo" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)" /><br /><br />

                <label for="muerte_ternero" class="Texto"> Muerte Terneros:</label>            
                <span class="red">*</span>
                <input id="muerte_ternero" name="muerte_ternero" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)" /><br /><br />

                <label for="muerte_novillo" class="Texto"> Muerte Novillos:</label>  
                <span class="red">*</span>
                <input id="muerte_novillo" name="muerte_novillo" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)" /><br /><br />

                <span class="red">* Campos obligatorios</span><br /><br />

                <input type="hidden" name="select">
                <input type="reset" name="Guardar" value="Guardar" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonNormal" onclick="VerificarVacios()"/><br /> 
                <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                       onmouseout="this.style.color = 'black'" class="BotonNormal" onclick="volver()"/><br /><br />            
            </form>

            <input type="reset" name="boton" value="Registro Existencias" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="window.open('ResulExistenciasGan.jsp', 'central')"><br>
            <input type="reset" name="boton" value="Generar Reportes" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="window.open('ReportesGan.jsp', 'central')"><br>




        </div>
    </body>
</html>
