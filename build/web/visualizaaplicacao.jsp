<%-- 
    Document   : visualizaaplicacao
    Created on : 06/04/2021, 15:00:06
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
        <h1>Aplicações</h1>
        <%
            Paciente pacApp = (Paciente) request.getAttribute("paciente");
            if (pacApp != null) {
        %>
        <table>

            <tr>
                <th>Nome do paciente</th><td><%= pacApp.getNome()%></td>
            </tr>
            <c:forEach var="aAux" items="${paciente.aplicacoes}">

                <tr>
                    <th>data</th>
                    
                    <td><fmt:formatDate value="${aAux.data}" type="date"/></td>
                </tr>
                                <tr>
                    <th>hora</th>
                    
                    <td><fmt:formatDate value="${aAux.data}" type="time"/></td>
                </tr>
                <tr>
                    <th>aplicador</th>
                    <td>${aAux.aplicador.nome}</td>
                </tr>
                <tr>
                    <th>descrição</th>
                    <td>${aAux.descricao}</td>
                </tr>




            </c:forEach>

        </table>
        <% }%>
    </body>
</html>
