<%-- 
    Document   : cadastrovacina
    Created on : 02/03/2021, 11:27:01
    Author     : Almeidas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Vacina</title>
    </head>
    <body>
        <h1>Cadastro de Vacina</h1>
         <form method="post" action="VacinaServlet">
            
            Nome: <input type="text" name="nome" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?vacina.nome:''}"/><br/>
            Fabricante <input type="text" name="fabricante" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?vacina.fabricante:''}"/><br/>
            tempo entre aplicacoes: <input type="text" name="tempoEntreAplicacoes" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?vacina.tempoEntreAplicacoes:''}"/><br/>
            quantidade de Aplicacoes: <input type="text" name="quantidadeAplicacoes" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?vacina.quantidadeAplicacoes:''}"/><br/>
            ID: <input type="text" name="id" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?vacina.id:''}"/><br/>
            <input type="hidden" name="${(param.redirect != null && param.redirect eq 'atualiza')?'atualizar':'cadastrar'}" value="atualizar"/>
            
            <input type="submit" value="${(param.redirect != null && param.redirect eq 'atualiza')?'atualizar':'cadastrar'}"/><br/>
           
        </form>
    </body>
</html>
