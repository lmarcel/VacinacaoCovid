/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.controller.tags;

import br.recife.edu.ifpe.model.classes.ProfissionalEnfermagem;
import br.recife.edu.ifpe.model.repositorios.RepositorioProfissionalEnfermagem;
import java.io.IOException;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author Almeidas
 */
public class CarregaProfissionalTag extends SimpleTagSupport{

    @Override
    public void doTag() throws JspException, IOException {
        super.doTag(); //To change body of generated methods, choose Tools | Templates.
        
        List<ProfissionalEnfermagem> profissionais = RepositorioProfissionalEnfermagem.getCurrentInstance().readAll();
        
        getJspContext().setAttribute("profissionaisenfermagem", profissionais, PageContext.PAGE_SCOPE);
    }
    
}
