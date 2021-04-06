/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.model.repositorios;

import br.recife.edu.ifpe.model.classes.Grupo;
import java.util.ArrayList;
import java.util.List;

public class RepositorioGrupo {
    
    private static RepositorioGrupo myself = null;
    
    private List<Grupo> grupos;
    
    private RepositorioGrupo(){
        this.grupos = new ArrayList<>();
    }
    
    public static RepositorioGrupo getCurrentInstance(){
        if(myself == null)
            myself = new RepositorioGrupo();
        
        return myself;
    }
    
    public void insert(Grupo grupo){
        this.grupos.add(grupo);
    }
    
    public void update(Grupo grupo){
        for(Grupo g: this.grupos){
            if(g.getId()==grupo.getId()){
                g.setDenominacao(grupo.getDenominacao());
                g.setIdadeMaxima(grupo.getIdadeMaxima());
                g.setIdadeMinima(grupo.getIdadeMinima());
                
                return;
            }
        }
    }
    
    public Grupo read(int id){
        for(Grupo g: this.grupos){
            if(g.getId() == id){
                return g;
            }
        }
        return null;
    }
    
    public void delete(Grupo grupo){
        this.grupos.remove(grupo);
    }
    
    public List<Grupo> readAll(){
        return this.grupos;
    }
    
}
