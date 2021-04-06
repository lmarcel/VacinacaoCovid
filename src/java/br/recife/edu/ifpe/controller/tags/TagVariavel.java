/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.controller.tags;

import java.io.IOException;
import java.io.StringWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author Almeidas
 */
public class TagVariavel extends SimpleTagSupport{
    
    int var;

    public void setVar(int var) {
        this.var = var;
    }

    @Override
    public void doTag() throws JspException, IOException {
        super.doTag(); //To change body of generated methods, choose Tools | Templates.
        
        StringWriter tagBody = new StringWriter();
        
        getJspBody().invoke(tagBody);
        
        getJspContext().getOut().write("<p>Id do Grupo "+this.var+"</P>");
    }
    
    
    
}
