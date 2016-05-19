<%-- 
    Document   : ComprasGanaderia
    Created on : 11/01/2016, 17:39:00
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
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <script type="text/javascript" src="js/js_cgan.js"></script>
        <link href="css/FormCarga.css" rel="stylesheet">  
        <title>Compras Ganadería</title>

        <script>
            window.onload = function () {
                document.getElementById("comprasgan").reset();               
            }
        </script>       
        <%session.removeAttribute("tipoGasto");%> 
        
    </head>


    <body>
        <div class="form">
            <h3>Compras Ganaderas</h3>

            <form method="post" id="comprasgan" action="ResultadoComprasGanaderia.jsp" name="comprasgan"  class="formularios" target="central"> <br>

                <label for="numerodecompra" class="Texto">Número de Compra: </label>
                <span class="red">*</span>
                <input type="text" class="ComboMedio" name="nrocompra" id="nrocompra"><br /><br />

                <label for="fecha" class="Texto"> Fecha de venta: </label>
                <span class="red">*</span>
                <input type="text" class="ComboMedio" name="fecha" id="fecha" readonly="readonly" /><br /><br />

                <label name="kgternero" for="kgternero" class="Texto">Kg/Ternero (promedio):</label>
                <input type="text" name="kgternero" id="kgternero" class="ComboMedio" onKeyPress="return soloNumeros(event)"><br /><br />

                <label name="precioKg" for="precioKg" class="Texto">$/Kg:</label>
                <span class="red">*</span>
                <input type="text" name="precioKg" id="precioKg" class="ComboMedio" onKeyPress="return soloNumeros(event)"><br /><br />

                <label for="cant" class="Texto"> Cantidad: </label>
                <input name="cant" id="cant" class="ComboMedio" onKeyPress="return soloNumeros(event)"><br /><br />

                <label for="costo" class="Texto"> Valor de Compra $:</label>
                <span class="red">*</span>
                <input type="text" id="costo" name="costo" class="ComboMedio" onKeyPress="return soloNumeros(event)"/><br />
                <span class="red">* Campos obligatorios</span><br /><br />

                <input type="hidden" name="select">
                <input type="reset" name="Guardar" value="Guardar" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonNormal" onclick="VerificarVacios()"/><br />
                <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                       onmouseout="this.style.color = 'black'" class="BotonNormal" onclick="volver()"/><br /><br />
            </form>

            <input type="button" name="Ver" value="Ver Compras" onmouseover="this.style.color = 'green'" 
                   onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="window.open('ResultadoComprasGanaderia.jsp','central')"/><br />

            <input type="button" name="Ver" value="Ver Gastos" onmouseover="this.style.color = 'green'" 
                   onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="window.open('SelectGCGanaderia.jsp?&boton=compra','central')"/><br /><br />
            
        </div>



    </body>
</html>
