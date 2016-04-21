<%-- 
    Document   : ExistenciasGan
    Created on : 11/04/2016, 18:45:04
    Author     : Guille
--%>

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
        
        <title>Existencias Ganaderia</title>
    </head>
    <body>
        <div class="form">
              <h3>
               Existencias Ganaderas
            </h3>
            
            <form method="post" id="existenciasgan" name="existenciasgan" action="ResulExistenciasGan.jsp"  class="formularios" target="central"> <br>
                
                <label for="fecha" class="Texto"> Seleccionar Fecha: </label>
                <span class="red">*</span>
                <input type="text" name="fecha" id="fecha" readonly="readonly" /><br /><br /> 
                
                <label for="porcentaje" class="Texto"> Porcentaje de ventas: % </label>            
                <input id="porcentaje" name="porcentaje" maxlength="3" class="ComboMedio" onKeyPress="return soloNumeros(event)"  /><br /><br />
                
                 <label for="precio_ternero" class="Texto"> Precio de Plaza al Cierre Terneros:</label>            
                <input id="precio_ternero" name="precio_ternero" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)" /><br /><br />
                
                 <label for="precio_novillo" class="Texto"> Precio de Plaza al Cierre Novillos:</label>            
                <input id="precio_novillo" name="precio_novillo" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)"  /><br /><br />
                
                 <label for="incremento" class="Texto"> Incrementos por cambio de categoria:</label>            
                <input id="incremento" name="incremento" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)"  /><br /><br />
                
                 <label for="disminucion" class="Texto"> Disminuciones por cambio de categoria:</label>            
                <input id="disminucion" name="disminucion" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)"  /><br /><br />
                
                 <label for="peso_ternero" class="Texto"> Peso Promedio Ternero:</label>            
                <input id="peso_ternero" name="peso_ternero" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)" /><br /><br />
                
                 <label for="peso_novillo" class="Texto"> Peso Promedio Novillo:</label>            
                <input id="peso_novillo" name="peso_novillo" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)" /><br /><br />
                
                 <label for="muerte_ternero" class="Texto"> Muerte Terneros:</label>            
                <input id="muerte_ternero" name="muerte_ternero" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)" /><br /><br />
                
                 <label for="muerte_novillo" class="Texto"> Muerte Novillos:</label>            
                <input id="muerte_novillo" name="muerte_novillo" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)" /><br /><br />
                
                <input type="hidden" name="select">
                <input type="reset" name="Guardar" value="Guardar" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonNormal" onclick="VerificarVacios()"/><br /> 
                <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                       onmouseout="this.style.color = 'black'" class="BotonNormal" onclick="volver()"/><br /><br />            
            </form>
            
            <input type="reset" name="boton" value="Registro Existencias" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="window.open('', 'central')"><br>
        
            
            
            
        </div>
    </body>
</html>
