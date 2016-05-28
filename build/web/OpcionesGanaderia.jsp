<%-- 
    Document   : inicioGanaderia
    Created on : 10/01/2016, 11:36:09
    Author     : Guille
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/main.css" rel="stylesheet">
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <title>Op. Ganadería</title>
      
    </head>
    <body>
        
        <% if (session.getAttribute("connection").equals("1")) { %>
        
        <div class="opciones">
            
            <h2>Bienvenido a la Seccion Ganadería</h2>
            <form name="form1" target="central">

                <h4> Opciones:</h4> 
                <select name="funciones">
                    <option value="OpcionesGanaderia.jsp">» Selecciona «</option>
                    <option value="GastosGanaderia.jsp">Gastos de Produccion y Alimentacion</option>
                    <option value="ComprasGanaderia.jsp">Compras</option>
                    <option value="VentasGanaderia.jsp">Ventas</option>
                    <option value="ExistenciasGan.jsp"> Existencias</option>                    
                    <option value="GananciaGan.jsp">Ganancia a la Fecha</option>
                    <option>Estado de Resultado Anual</option>
                    <option>Registro Histórico Compra y Venta, Animales</option>
                    <option>Gastos de Producción por Animal</option>
                </select>
                <input class="BotonNormal" type="button" value="Aceptar" onmouseover="this.style.color = 'green'"   
               onMouseOut="this.style.color = 'black'" onClick="abrepagina()">

            </form>

        </div>


        <%} else { %>
        <script>
            alert("La sesion ha finalizado.");
        </script>
        <%
            session.setAttribute("connection", "2");
            response.sendRedirect("index.html");} 
        %>
            
    </body>
</html>
