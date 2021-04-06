<%-- 
    Document   : visualizagrupo
    Created on : 01/03/2021, 21:18:42
    Author     : Almeidas
--%>

<%@page import="br.recife.edu.ifpe.model.classes.Grupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo cadastrado</title>
    </head>
    <body>
        <h1>Grupo cadastrado</h1>
         <% 
            Grupo grup = (Grupo)request.getAttribute("grupo");
            if( grup != null){
        %>
        <table>
            <tr>
                <th>ID</th><td><%= grup.getId()%></td>
            </tr>
            <tr>
                <th>Denominação</th><td><%= grup.getDenominacao()%></td>
            </tr>
            <tr>
                <th>Idade mínima</th><td><%= grup.getIdadeMinima() %></td>
            </tr>
            <tr>
                <th>Idade máxima</th><td><%= grup.getIdadeMaxima() %></td>
            </tr>
        </table>
            <% }%>
    </body>
</html>
