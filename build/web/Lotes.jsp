<%-- 
    Document   : AltaLote
    Created on : 13/01/2016, 21:38:32
    Author     : nulia
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/FormCarga.css">
        <script type="text/javascript" src="js/js_Lotes.js"></script>
        <script type="text/javascript" src="js_FunGenericas.js"></script>       
        <title>AREAG</title>
    </head>
    <body>
        
        <div class="form">
            
             <h3>
               Lotes
            </h3>
            
        <form method="post" action="ResultadoLote.jsp" target="central" name="lotes"> <br>            
            <label for="nombre" class="Texto">Nombre: </label> 
            <span class="red">*</span>
            <input type="text" name="nombre" id="nombre" class="ComboMedio"/><br><br>
            <label for="cultivo" class="Texto"> Cultivo:</label> 
            <select name="cultivo" class="Texto" id="cultivo" onchange="habilitarInput(this.value)">
                <option value="Soja">Soja</option>
                <option value="Maiz">Maíz</option>
                <option value="Trigo">Trigo</option>
                <option value="Cebada">Cebada</option>
                <option value="Centeno">Centeno</option>
                <option value="Sorgo">Sorgo</option>
                <option value="7">Otro</option>
            </select><span class="red">*</span><br /><br />
            <label id="etiquetaOtros" for="cultivo" class="Texto"> Nombre cultivo: </label>
            <input id="cultivoname" name="cultivoname" maxlength="20" disabled="true" class="ComboMedio" /><br /><br />
            <label class="radio">Propio</label><input type="radio" id="proalq" name="proalq" value="propio" checked/> 
            <label class="radio">Alquilado</label><input type="radio" id="proalq" name="proalq" value="alquilado"/>  <br /><br />
            <label for="hp" class="Texto"> Hectáreas producidas: </label>
            <span class="red">*</span>
            <input id="hp" name="hp" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)"/><br /><br />
            <label for="rb" class="Texto"> Rendimiento Bruto:</label>
            <input id="rb" name="rb" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)"/><br /><br />
            <label for="ei" class="Texto"> Existencia inicial: </label>
            <input id="ei" name="ei" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)"/>
            <label class="Texto"> kg </label><br /><br />
            <label for="porcen" class="Texto"> Porcentaje de gastos de ventas en el precio final: </label> 
            <input id="porcen" name="porcen" maxlength="2" class="ComboMedio" onKeyPress="return soloNumeros(event)"/>
            <label class="Texto"> % </label><br /><br />
            <span class="red">* Campos obligatorios</span><br><br /> 
            <input type="hidden" name="variableDesvio">
            <input type="button" name="boton" value="Guardar" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonNormal" onclick="VerificarVacios()" /><br />
            <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                       onmouseout="this.style.color = 'black'" class="BotonNormal" onclick="volver()"/><br /><br />
        </form>
        <input type="button" name="boton" value="Ver Lotes " onmouseover="this.style.color = 'green'"   
               onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="window.open('ResultadoLote.jsp', 'central')"/><br>
    
        </div>
        </body>
</html>