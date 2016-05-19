<%-- 
    Document   : DatosUsuario
    Created on : 05/01/2016, 11:32:36
    Author     : Guille
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.SQL"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/main.css" rel="stylesheet">
        <title>JSP Page</title>
        
        <% String error= request.getParameter("Error"); %>


    <div class="loginresult">

        <label class="Textologin"> <%out.println(request.getParameter("Usuario"));%> </label>&nbsp
        <label class="Textologin"><a href="index.html" target="_top" class="Texto" onclick="window.open('Login.jsp','login')" >
           <%session.setAttribute("conection", "0");
           if(error==null){%>     
           <font color="white"> Salir </font></label>
          <%}else{%>
          <font color="white">Volver</a></label>
          <%}%>

    </div>

</head>
<body>

</body>
</html>
