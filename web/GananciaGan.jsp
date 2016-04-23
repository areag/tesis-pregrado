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
<script type="text/javascript" src="js_FunGenericas.js"></script>
        <link rel="stylesheet" href="css/FormCarga.css">       
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.7.2.custom.css" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>

        <title>Ganancia a la fecha Ganadería</title>
    </head>
    <body>

        <div class="form">

            <h3>Generar Ganancia entre Fechas</h3>

            <form name="miformGan" method="post" action="" target="central" > <br>



             
                

                <span class="red">* Campos obligatorios</span><br /><br />

                <input type="hidden" name="variableDesvio">

                <input type="button" name="boton" value="Generar Ganancia" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="verificarVacios()"/><br>
                <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                       onmouseout="this.style.color = 'black'" class="BotonLargo" onclick="volver()"/><br /><br />



            </form>

        </div>

    </body>
</html>
