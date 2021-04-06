<%-- 
    Document   : aplicacao
    Created on : 06/04/2021, 14:03:30
    Author     : Almeidas
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ifpe" uri="br.recife.edu.ifpe.customtags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplicação</title>
        <style>
            .plus{
                font-size: 15pt;
                text-decoration: none;
                color: blue;
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <h1>Aplicar</h1>
        <h3><c:out value="${msg}"/></h3>

        <c:remove var="msg" scope="session"/>
        <ifpe:carregaprofissionais/>
        <ifpe:carregavacinas/>

        <h2>Vacinas</h2>
        <table  border="1">
            <tr>
                <th>Id</th>
                <th>Nome</th>
                <th>fabricante</th>
                <th>Tempo entre aplicações</th>
                <th>Quantidade de doses</th>
                <th>Inserir</th>
            </tr>
            <c:forEach var="vAux" items="${vacinas}">
                <tr>
                    <td>${vAux.id}</td>
                    <td>${vAux.nome}</td>
                    <td>${vAux.fabricante}</td>
                    <td>${vAux.tempoEntreAplicacoes}</td>
                    <td>${vAux.quantidadeAplicacoes}</td>
                    <td><a href="#" class="plus" onclick="adicionaVacId(${vAux.id}, '${vAux.nome}')"> +</a></td>
                </tr>
            </c:forEach>   <br>             
        </table>
        <h2>Profissionais de Enfermagem</h2>
        <table  border="1">
            <tr>
                <th>Id</th>
                <th>Nome</th>
                <th>coren</th>
                <th>ano de Formaçãoo</th>
                <th>contato</th>
                <th>Inserir</th>
            </tr>
            <c:forEach var="pAux" items="${profissionaisenfermagem}">
                <tr>
                    <td>${pAux.id}</td>
                    <td>${pAux.nome}</td>
                    <td>${pAux.coren}</td>
                    <td>${pAux.anoFormacao}</td>
                    <td>${pAux.contato}</td>
                    <td><a href="#" class="plus" onclick="adicionaProId(${pAux.id}, '${pAux.nome}')"> +</a></td>
                </tr>
            </c:forEach>                
        </table>
        <form method="post" action="AplicacaoServlert">
            <p>Paciente: ${(param.redirect != null && param["redirect"] eq 'aplica')?paciente.nome:''}</p>
            Id da Vacina: <input type="text" id="idvacina" name="idvacina"  value="${(param.redirect != null && param["redirect"] eq 'aplica')?vacina.id:''}"/><br/>        
            Nome da Vacina: <input type="text" id="nomevacina" name="nomevacina" value="${(param.redirect != null && param["redirect"] eq 'aplica')?vacina.nome:''}"/><br/>
            Id do Profissional: <input type="text" id="idprofissional" name="idprofissional" value="${(param.redirect != null && param["redirect"] eq 'aplica')?profissional.id:''}"/><br/>
            Nome Profissional: <input type="text" id="nomeprofissional" name="nomeprofissional" /><br/> 
            Descrição: <input type="text"  name="descricaoaplicacao" /><br/>  
            <input type="hidden" name="id" value="${(param.redirect != null && param["redirect"] eq 'aplica')?paciente.id:''}"/>
            <input type="hidden" name="${(param.redirect != null && param.redirect eq 'aplica')?'aplicar':'inserir'}" value="aplicar"/>

            <input type="submit" value="${(param.redirect != null && param.redirect eq 'aplica')?'aplicar':'cadastrar'}"/><br/>

        </form>

    </body>
</html>
