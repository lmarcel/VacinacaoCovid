<%-- 
    Document   : cadastropaciente
    Created on : 05/04/2021, 19:41:36
    Author     : Almeidas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ifpe" uri="br.recife.edu.ifpe.customtags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Paciente</title>
    </head>
    <body>
        <h1>Cadastro de Paciente</h1>
        <ifpe:carregagrupos/>

        <table border="1">
            <tr>
                <th>Id</th>
                <th>Denominação</th>
                <th>Idade mínima</th>
                <th>Idade máxima</th>
                <th>Selecionar</th>
            </tr>
            
                <c:forEach var="gAux" items="${grupos}">
                    <tr>
                        <td>${gAux.id}</td>
                        <td>${gAux.denominacao}</td>
                        <td>${gAux.idadeMinima}</td>
                        <td>${gAux.idadeMaxima}</td>
                        <td><a href="#" class ="plus"  style="text-decoration: none;" onclick="myFunction(${gAux.id})">+</a></td>                   
                    </tr>

                </c:forEach>

            </table>
        
        <br>
        <form method="post" action="PacienteServlet">

            Id: <input type="text" name="id" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?paciente.id:''}"/><br/>        
            Nome: <input type="text" name="nome" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?paciente.nome:''}"/><br/>
            Data de Nascimento: <input type="date" name="datanascimento" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?paciente.dataNascimento:''}"/><br/>
            Caracteristicas Individuais: <input type="text" name="caracteristicasIndividuais" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?paciente.caracteristicasIndividuais:''}"/><br/>
            Id do grupo: <input type="number" id="campogrupo" name="groupId" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?paciente.grupo.id:''}"/><br/>
            
            <input type="hidden" name="${(param.redirect != null && param.redirect eq 'atualiza')?'atualizar':'cadastrar'}" value="atualizar"/>

            <input type="submit" value="${(param.redirect != null && param.redirect eq 'atualiza')?'atualizar':'cadastrar'}"/><br/>

        </form>



    </body>
</html>
