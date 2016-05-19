<%-- 
    Document   : ExistenciasGan
    Created on : 11/04/2016, 18:45:04
    Author     : Guille
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.SQL"%>
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
                            SQL sql = new SQL();
                            sql.conexion("root", "root");
                            ResultSet rs = sql.consultar("SELECT * FROM existenciasgan order by fecha asc; ");
                            if(rs.next() ) {
                                rs.last();
                            }                        
                            String fecha_ant = rs.getString("fecha");
                            
                            %>
        
        <title>Existencias Ganaderia</title>
    </head>
    <body>
        <div class="form">
            
            <h3> Existencias Ganaderas  <h4> Ultima Existencia cargada: <%=fecha_ant%> </h4> </h3>
            
            <form method="post" id="existenciasgan" name="existenciasgan" action="ResulExistenciasGan.jsp"  class="formularios" target="central"> <br>
                
                <label for="fecha" class="Texto"> Seleccionar Fecha: </label>
                <span class="red">*</span>
                <input type="text" name="fecha" id="fecha" readonly="readonly" /><br /><br /> 
                
                <label for="titleExitencia" class="Texto"> Existencia final a la misma fecha del año anterior de: </label><br /><br />
                
                <label for="existenciaTernero" class="Texto"> Terneros: </label>
                <span class="red">*</span>
                <input type="text" name="existenciaTernero" id="existenciaTernero" class="ComboMedio"/><br />
                
                <label for="existenciaNovillos" class="Texto"> Novillos: </label>
                <span class="red">*</span>
                <input type="text" name="existenciaNovillos" id="existenciaNovillos" class="ComboMedio" /><br /><br /> 
                
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
        
            
            
            
        </div>
    </body>
</html>
