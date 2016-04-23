<%-- 
    Document   : ResulGananciasGan
    Created on : 23/04/2016, 20:35:52
    Author     : Guille
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
        
        <%
            String fecha_desde = request.getParameter("fecha_desde");
            String fecha_hasta = request.getParameter("fecha_hasta");
            
        %>
        
        <%=fecha_desde%>
        <%=fecha_hasta%>
        
        
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
