<%-- 
    Document   : cadastroprofissionalEnfermagem
    Created on : 02/03/2021, 11:30:17
    Author     : Almeidas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Profissional de Enfermagem</title>
    </head>
    <body>
        <h1>Cadastro de Profissional de Enfermagem</h1>
         <form method="post" action="ProfissionalEnfermagemServlet">
            
            Nome: <input type="text" name="nome" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?profissionalEnfermagem.nome:''}"/><br/>
            Coren: <input type="text" name="coren" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?profissionalEnfermagem.coren:''}"/><br/>
            Ano de formação: <input type="text" name="anoFormacao" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?profissionalEnfermagem.anoFormacao:''}"/><br/>
            Contato: <input type="text" name="contato" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?profissionalEnfermagem.contato:''}"/><br/>
            ID: <input type="text" name="id" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?profissionalEnfermagem.id:''}"/><br/>           
            <input type="hidden" name="${(param.redirect != null && param.redirect eq 'atualiza')?'atualizar':'cadastrar'}" value="atualizar"/>
            
            <input type="submit" value="${(param.redirect != null && param.redirect eq 'atualiza')?'atualizar':'cadastrar'}"/><br/>
           
        </form>
    </body>
</html>
