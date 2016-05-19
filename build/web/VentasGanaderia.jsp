<%-- 
    Document   : VentasGanaderia
    Created on : 10/03/2016, 12:52:30
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
        <script type="text/javascript" src="js/js_vgan.js"></script>
        <link href="css/FormCarga.css" rel="stylesheet">  

        <script>
            window.onload = function () {
                document.getElementById("ventasgan").reset();
            }
        </script>


        <%session.removeAttribute("tipoGasto");%>

        <title>Ventas Ganaderia</title>
    </head>
    <body>

        <div class="form">
            <h3>Ventas Ganaderas</h3>

            <form method="post" id="ventasgan" action="ResultadoVentasGanaderia.jsp" name="ventasgan"  class="formularios" target="central"> <br>

                <label for="nrodeventa" class="Texto"> Número de Venta:</label>
                <span class="red">*</span>
                <input type="text" class="ComboMedio" name="nroventa" id="nroventa"><br/><br>

                <label for="fecha" class="Texto"> Fecha de venta: </label>
                <span class="red">*</span>
                <input type="text" class="ComboMedio" name="fecha" id="fecha" readonly="readonly" /><br /><br />

                <label for="diasencierre" class="Texto">Días Encierre: </label>
                <input type="text" class="ComboMedio" name="dencierre" id="dencierre" onKeyPress="return soloNumeros(event)"><br /><br />

                <label name="kgternero" for="kgternero" class="Texto">Kg/Ternero (promedio):</label>
                <input type="text" name="kgternero" id="kgternero" class="ComboMedio" onKeyPress="return soloNumeros(event)"><br /><br />

                <label name="precioKg" for="precioKg" class="Texto">$/Kg:</label>
                <span class="red">*</span>
                <input type="text" name="precioKg" id="precioKg" class="ComboMedio" onKeyPress="return soloNumeros(event)"><br /><br />

                <label for="cantidad" class="Texto"> Cantidad: </label>
                <input name="cant" id="cant" class="ComboMedio" onKeyPress="return soloNumeros(event)"><br /><br />

                <label for="kgVendidos" class="Texto"> Total de Kg Vendidos:</label>
                <span class="red">*</span>
                <input name="kgVendidos" id="kgVendidos" class="ComboMedio" onKeyPress="return soloNumeros(event)"><br /><br />

                <label for="valor" class="Texto"> Valor de Venta $:</label>
                <span class="red">*</span>
                <input type="text" id="valor" name="valor" class="ComboMedio" onKeyPress="return soloNumeros(event)"/><br />
                <span class="red">* Campos obligatorios</span><br /><br />

                <input type="hidden" name="select">
                <input type="reset" name="Guardar" value="Guardar" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonNormal" onclick="VerificarVacios()"/><br />
                <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                       onmouseout="this.style.color = 'black'" class="BotonNormal" onclick="volver()"/><br /><br />
            </form>

            <input type="button" name="Ver" value="Ver Ventas" onmouseover="this.style.color = 'green'" 
                   onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="window.open('ResultadoVentasGanaderia.jsp', 'central')"/><br />

            <input type="button" name="Ver" value="Ver Gastos de Ventas" onmouseover="this.style.color = 'green'" 
                   onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="window.open('SelectGCGanaderia.jsp?&boton=venta', 'central')"/><br /><br />

        </div>
    </body>
</html>
