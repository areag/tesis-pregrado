<%-- 
    Document   : GastosGanaderia
    Created on : 18/02/2016, 17:26:49
    Author     : Guille
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/FormCarga.css" rel="stylesheet">  
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.7.2.custom.css" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <script type="text/javascript" src="js/js_gganpro.js"></script>

        <script>
            window.onload = function () {
                document.getElementById("gasto").selectedIndex = 0;
                document.getElementById("gastosgan").reset();
            }
            
            function calculaValor() { 
                var kg = document.getElementById("kg").value;
                var precio = document.getElementById("valorKg").value;
                var costo1 = document.getElementById("costo1").value = parseFloat(kg) * parseFloat(precio);
                document.getElementById("costo1").value = costo1;  
            }

            function cambia() {
                document.getElementById("valor").value = "";
                document.getElementById("kg").value = "";
                document.getElementById("valorKg").value = "";
            }
        </script>
        <title>Gastos Ganadería</title>
    </head>
    <body>
        
        <div class="form">
            <h3>
               Gastos Producción y Alimentación Ganadera
            </h3>

            <form method="post" id="gastosgan" name="gastosgan"  class="formularios" target="central"> <br>

                <label for="fecha" class="Texto"> Fecha de venta: </label>
                <span class="red">*</span>
                <input type="text" class="ComboMedio" name="fecha" id="fecha" readonly="readonly" /><br /><br />

                <label for="gasto" class="Texto">Elegir tipo de Gasto:</label>
                <select name="gasto" id="gasto" class="ComboMedio"  onchange="habilitarInput()">
                    <option value="1">Seleccionar:</option>
                    <option value="Suministros">Suministros</option>
                    <option value="Sanidad">Sanidad</option>
                    <option value="Honorarios Laborales">Honorarios Laborales</option>
                    <option value="Otros Gastos">Otros Gastos</option>
                    <option value="Gastos Alimentacion">Gastos Alimentación</option>
                </select><br/><br/>

                <div class="visible" id="gastoprod">
                    <label for="ob" class="Texto"> Observaciones: </label>
                    <textarea name="ob" id="ob" rows="8" cols="40"></textarea><br /><br />
                    <label for="costo" class="Texto"> Costo total en $:</label>
                    <span class="red">*</span>
                    <input id="costo" name="costo" class="ComboMedio" onKeyPress="return soloNumeros(event)"/><br />
                    <span class="red">* Campos obligatorios</span><br /><br />
                </div>


                <div class="visible" id="gastoalimentacion">
                    <label for="elegircomponente" class="Texto">Elegir componente:</label>
                    <select name="gastoalim" id="gastoalim" class="ComboMedio" onchange="cambia()">
                        <option value="Maiz">Maiz</option>
                        <option value="Nucleo">Nucleo</option>
                        <option value="Concentrado">Concentrado</option>
                        <option value="Otros">Otros</option>
                    </select> <br/><br />

                    <label name="kg" for="kg" class="Texto">Kg:</label>
                    <input type="text" name="kg" id="kg" class="ComboMedio"><br /><br />

                    <label name="$/kg" for="valorKg" class="Texto">$/Kg:</label>
                    <input type="text" name="valorKg" id="valorKg" class="ComboMedio" onkeyup="calculaValor()"><br /><br />

                    <label for="ob1" class="Texto"> Observaciones: </label>
                    <textarea name="ob1" id="ob1" rows="8" cols="40" ></textarea><br /><br />

                    <label for="costo1" class="Texto"> Costo total en $:</label>
                    <span class="red">*</span>
                    <input type="text" id="costo1" name="costo1" class="ComboMedio" disabled value="0"/><br />

                    <span class="red">* Campos obligatorios</span><br /><br /> 
                </div>

                <input type="hidden" name="select">
                <input type="reset" name="Guardar" value="Guardar" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonNormal" onclick="VerificarVacios()"/><br /> 
                <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                       onmouseout="this.style.color = 'black'" class="BotonNormal" onclick="volver()"/><br /><br />
            </form>

            <input type="button" name="Ver" value="Ver Gastos de Produccion" onmouseover="this.style.color = 'green'" 
                   onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="window.open('ResultadoGastosGanaderia.jsp', 'central')"/><br />

            <input type="button" name="Ver" value="Ver Gastos de Alimentacion" onmouseover="this.style.color = 'green'" 
                   onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="window.open('ResulGastosAlimGanaderia.jsp', 'central')"/><br /><br />


        </div>

    </body>

</html>
