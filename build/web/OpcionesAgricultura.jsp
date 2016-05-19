<%-- 
    Document   : OpcionesAgricultura
    Created on : 15/01/2016, 19:02:55
    Author     : nulia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/main.css">
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <title>Op. Agricultura</title>
    </head>
    <body>        
        <% if (session.getAttribute("connection").equals("1")) { %>        
        <div class="opciones">
            <h2>Bienvenido a la Seccion Agrícultura</h2>
            <form  name="form1" target="central">               
                <h4> Opciones:</h4>                            
                <select name="funciones">
                    <option value="OpcionesAgricultura.jsp">» Seleccionar «</option>
                    <option value="Lotes.jsp">Lotes</option>
                    <option value="VentasAgri.jsp">Ventas</option>
                    <option value="selecVenta.jsp">Gastos Comercializacion</option>
                    <option value="GPAgri.jsp">Gastos de Produccion</option>
                    <option>Ganancia a la fecha
                    <option>Reporte de existencia de semillas
                    <option>Estado de Resultados Anual
                    <option>Registro historico de siembra
                    <option>Ganancia en agricultura por ha. propia y alquilada                                
                </select>
                <input class="BotonNormal" type="button" value="Aceptar" onmouseover="this.style.color = 'green'"   
                       onMouseOut="this.style.color = 'black'" onClick="abrepagina()"/>                  
            </form>
        </div> 
        
        
        
        <%} else { %>
        <script>
            alert("La sesion ha finalizado.");
        </script>
        <%}%>
    </body>
</html>