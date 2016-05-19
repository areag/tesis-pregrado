<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/FormCarga.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.7.2.custom.css" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script> 
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <script type="text/javascript" src="js/js_ventas.js"></script>       
        <title>Ventas Agricultura</title>
    </head>
    <body>
        <div class="form">
            <h3>
               Ventas Agrícolas
            </h3>
            
            
            <form method="post" action="ResulVentasAgri.jsp" target="central" name="ventas"> <br>

                <label for="cultivo" class="Texto"> Producto:</label>            
              <select name="cultivo" id="cultivo" class="ComboMedio" onchange="habilitarInput(this.value)">
                        <option value="Soja">Soja</option>
                        <option value="Maiz">Maiz</option>
                        <option value="Trigo">Trigo</option>
                        <option value="Cebada">Cebada</option>
                        <option value="Centeno">Centeno</option>
                        <option value="Sorgo">Sorgo</option>
                        <option value="7">Otro</option>
                </select>
                <span class="red">*</span><br /><br />
                <label id="etiquetaOtros" for="cultivoname" class="Texto" > Nombre cultivo: </label>
                <input id="cultivoname" name="cultivoname" maxlength="20" disabled="true" class="ComboMedio" /><br /><br />                
                <label for="fecha" class="Texto"> Fecha de venta: </label>
                <span class="red">*</span>
                <input type="text" name="fecha" id="fecha" readonly="readonly" /><br /><br />                
                <label for="kg" class="Texto"> Kilogramos vendidos:</label>            
                <input id="kg" name="kg" maxlength="10" class="ComboMedio" onKeyPress="return soloNumeros(event)" />
                <label class="Texto"> Kg <span class="red">*</span></label><br /><br />
                <label for="pm" class="Texto"> Precio de mercado: </label>
                <input id="pm" name="pm" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)" /><br /><br />
                <label for="porcen" class="Texto"> Porcentaje de comisión: </label> 
                <input id="porcen" name="porcen" maxlength="2" class="ComboMedio" onKeyPress="return soloNumeros(event)" />
                <label class="Texto"> % </label><br /><br />
                <label for="comprador" class="Texto"> Comprador: </label> 
                <input id="comprador" name="comprador" maxlength="30" class="ComboMedio" /><br /><br />
                <label for="valorVenta" class="Texto"> Valor total de la venta en $: </label> 
                <span class="red">*</span>
                <input id="valorVenta" name="valorVenta" maxlength="10" class="ComboMedio" onKeyPress="return soloNumeros(event)" /><br /><br />
                <span class="red">* Campos obligatorios</span><br /><br />
                <input type="hidden" name="variableDesvio">
                <input type="button" name="boton" value="Guardar" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonNormal" onclick="VerificarVacios()" /> <br />
                <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                       onmouseout="this.style.color = 'black'" class="BotonNormal" onclick="volver()"/><br /><br />
            </form>
            <input type="reset" name="boton" value="Ver Ventas" onmouseover="this.style.color = 'green'"   
                   onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="window.open('ResulVentasAgri.jsp', 'central')"><br>
        </div>
    </body>
</html>