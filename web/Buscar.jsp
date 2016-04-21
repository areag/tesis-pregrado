<%-- 
    Document   : Buscar
    Created on : 15/03/2016, 17:54:31
    Author     : Guille
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/buscador.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <title>JSP Page</title>
    </head>
    <div class="container">           
    <body>
        
        <form method="get" action="/search" id="search">
            <input name="q" type="text" size="40" placeholder="Buscar... NO FUNCIONA " />
        </form>
        
        
        
        <form id="order" method="post" action="">           
           
            <div class="ordenar">              
            <ul>                
                <li>
                    <label for="titulo"> Ordenar por:</label>
                    <label for="ordenfecha">
                    <input type="checkbox" id="fecha">Fecha
                    </label>
                    <label for="ordencosto">
                    <input type="checkbox" id="costo">Costo
                    </label>
                    <label for="ordentipo">
                    <input type="checkbox" id="tipo">Tipos
                    </label>
                 </li>
                </ul>
            </div>         
        </form>
        </div>
    
    </body>
</html>
