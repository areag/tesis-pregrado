<%-- 
    Document   : Login
    Created on : 03/01/2016, 13:06:51
    Author     : Guille
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/main.css" rel="stylesheet"/>
        <script type="text/javascript" src="js_FunGenericas.js"></script>
        <title>JSP Page</title>

        <%
            session.setAttribute("user_session", "");
            session.setAttribute("pass_session", "");
            session.setAttribute("connection", "0");

        %>

    <div class="login1">      
    <form  method="post" action="MenuDefecto.jsp" target="menudefecto">
        <label  class="Texto" >Usuario:</label>
        
        <input name="usuario" type="text" class="ComboLogin" id="usuario" value="" align="rigth" />
       
        <label  class="Texto">Contraseña:</label>        
        <input name="password" type="password" class="ComboLogin" id="password" align="rigth"/> 

        <input name="ingresa_b" type="submit" class="BotonLogin" onmouseover="this.style.color = 'green'"   
               onMouseOut="this.style.color = 'black'" value="Ingresar" /> 
           
    </form>
</div> 
</head>
<script>
                               function init() {
                                   window.document.getElementById("usuario").focus();
                               }
                               
</script>
<body onload="init()">
    
    
</body>

</html>
