<%-- 
    Document   : visualizapaciente
    Created on : 06/04/2021, 11:08:33
    Author     : Almeidas
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="br.recife.edu.ifpe.model.classes.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Paciente cadastrado</h1>
        <%
            Paciente pac = (Paciente) request.getAttribute("paciente");
            if (pac != null) {
        %>
        <table>
            <tr>
                <th>Id</th><td><%= pac.getId()%></td>
            </tr>
            <tr>
                <th>Nome</th><td><%= pac.getNome()%></td>
            </tr>
            <tr>
                <th>Nascimento</th><td><fmt:formatDate value="<%=pac.getDataNascimento()%>"/></td>
            </tr>
            <tr>
                <th>Características</th><td><%= pac.getCaracteristicasIndividuais()%></td>
            </tr>
            <tr>
                <th>Grupo</th><td><%= pac.getGrupo().getDenominacao()%></td>
            </tr>
        </table>
        <% }%>
    </body>
</html>
