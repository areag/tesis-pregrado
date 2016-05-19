<%-- 
    Document   : GPAgri
    Created on : 22/02/2016, 00:03:23
    Author     : nulia
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
        
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <script type="text/javascript" src="js/js_GP.js"></script>
        
        <title>Gastos de Producción</title>
    </head>
    <body>
        <div class="form">
            <h3>Gastos de Produccion</h3>
            
            <form name="miformgp" method="post" action="ResultadoGPAgri.jsp" target="central" > <br>

                <label for="fecha" class="Texto"> Fecha: </label>
                <span class="red">*</span>
                <input type="text" name="fecha" id="fecha" readonly="readonly" /><br /><br />

                <label for="selecTipo" class="Texto"> Seleccione un Gasto de Producción: </label>            
                <select id="selecgp" name="selecgp" class="Texto" onchange="habilitarInput(this.value)">
                    <option value="1">» Seleccionar «</option>
                    <option value="Arrendamiento">Arrendamiento</option>
                    <option value="Gasoil">Gasoil</option>
                    <option value="UTA">UTA</option>
                    <option value="Seguros">Seguros</option>
                    <option value="Impuestos">Impuestos</option>
                    <option value="8">Insumos</option>
                    <option value="9">Laboreos</option>
                    <option value="10">Otro</option>
                </select><span class="red">*</span><br /><br />
                
                <label id="etiquetaOtros" for="desc" class="TextoDes">Descripción: </label>
                <input type="text" id="desc" name="desc" maxlength="20" disabled class="ComboMedio" /><br /><br />

                <label id="etiquetaInsumos" for="Insumos"  class="TextoDes">Insumos: </label>
                <select id="Insumos" name="Insumos" class="TextoDes" disabled>
                    <option value="1">» Seleccionar «</option>
                    <option value="Semilla">Semilla</option>
                    <option value="Fertilizante">Fertilizante</option>
                    <option value="Curasemilla">Curasemilla</option>
                    <option value="Insecticida">Insecticida</option>
                    <option value="Herbicida">Herbicida</option>
                    <option value="Fungicida">Fungicida</option>
                    <option value="Inoculante">Inoculante</option>
                    <option value="Otro">Otro</option>
                </select><br /><br />

                <label id="etiquetaLaboreos" for="Laboreos"  class="TextoDes" >Laboreos: </label>
                <select id="Laboreos" name="Laboreos" class="TextoDes" disabled>
                    <option value="1">» Seleccionar «</option>
                    <option value="Siembra directa">Siembra directa</option>
                    <option value="Siembra convencional">Siembra convencional</option>
                    <option value="Desmalezada">Desmalezada</option>
                    <option value="Pulverizacion">Pulverización</option>
                    <option value="Fumigacion aerea">Fumigación aerea</option>
                    <option value="Fumigacion terrestre">Fumigación terrestre</option>
                    <option value="Arada">Arada</option>
                    <option value="Cosecha">Cosecha</option>
                    <option value="Otro">Otro</option>
                </select><br /><br />

                <label for="obser" class="Texto"> Observaciones: </label>
                <textarea name="obser" id="obser" rows="8" cols="40" class="ComboMedio"></textarea><br /><br />

                <label for="costo" class="Texto"> Costo total en $:</label>
                <span class="red">*</span>
                <input id="costo" name="costo" maxlength="5" class="ComboMedio" onKeyPress="return soloNumeros(event)"/><br /><br />
                <span class="red">* Campos obligatorios</span><br /><br />
                
                <input type="hidden" name="variableDesvio">
                
                <input type="button" name="boton" value="Guardar" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" class="BotonNormal" onclick="verificarVacios()"/><br>
                <input type="button" name="Volver" value="Volver" onmouseover="this.style.color = 'green'"
                       onmouseout="this.style.color = 'black'" class="BotonNormal" onclick="volver()"/><br /><br />
            </form>    
            
            
            
            <input type="button" name="boton" value="Ver Gastos de Producción" onmouseover="this.style.color = 'green'"   
                                onMouseOut="this.style.color = 'black'" class="BotonLargo" onclick="window.open('ResultadoGPAgri.jsp', 'central')"/><br>
        </div>
    </body>
</html>
