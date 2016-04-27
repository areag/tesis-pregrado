<%-- 
    Document   : GananciaGan
    Created on : 23/04/2016, 14:16:18
    Author     : Guille
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="css/FormCarga.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.7.2.custom.css" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/js_gananciasGan.js"></script>
        <script type="text/javascript" src="js_FunGenericas.js"></script>

        <title>Ganancia a la fecha Ganadería</title>
    </head>
    <body>

        <div class="form">

            <h3>Generar Ganancia entre Fechas</h3>

            <form name="miformGan" method="post" target="central" > <br>

                <label for="fecha" class="Texto"> Fecha Desde: </label>
                <span class="red">*</span>
                <input type="text" id="fecha_desde" class="fecha_gan" readonly="readonly" /><br /><br />
                
                <label for="fecha" class="Texto"> Fecha Hasta: </label>
                <span class="red">*</span>
                <input type="text"  id="fecha_hasta" class="fecha_gan" readonly="readonly" /><br /><br />
            
                <span class="red">* Campos obligatorios</span><br /><br />

                

                <input type="reset" name="boton" value="Generar Ganancia" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="verificarVacios()"/><br>
                
            </form>
            
            <input type="reset" name="boton" value="Ver Ganancias Guardadas" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="window.open('RegistroGananciasGan.jsp','central')"/><br>
                <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                       onmouseout="this.style.color = 'black'" class="BotonLargo" onclick="volver()"/><br /><br />

        </div>

    </body>
</html>
