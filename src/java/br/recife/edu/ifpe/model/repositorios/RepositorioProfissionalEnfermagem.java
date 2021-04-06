/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.model.repositorios;

import br.recife.edu.ifpe.model.classes.ProfissionalEnfermagem;
import java.util.ArrayList;
import java.util.List;

public class RepositorioProfissionalEnfermagem {
    
    private static RepositorioProfissionalEnfermagem myself = null;
    
    private List<ProfissionalEnfermagem> profissionais;
    
    private RepositorioProfissionalEnfermagem(){
        this.profissionais = new ArrayList<>();
    }
    
    public static RepositorioProfissionalEnfermagem getCurrentInstance(){
        if(myself == null)
            myself = new RepositorioProfissionalEnfermagem();
        
        return myself;
    }
    
    public void insert(ProfissionalEnfermagem profissional){
        this.profissionais.add(profissional);
    }
    
    public void update(ProfissionalEnfermagem profissional){
        for(ProfissionalEnfermagem p: this.profissionais){
            if(p.getId()==profissional.getId()){
                
                p.setAnoFormacao(profissional.getAnoFormacao());
                p.setContato(profissional.getContato());
                p.setCoren(profissional.getCoren());
                p.setNome(profissional.getNome());
                
                return;
            }
        }
    }
    
    public ProfissionalEnfermagem read(int id){
        for(ProfissionalEnfermagem p: this.profissionais){
            if(p.getId() == id){
                return p;
            }
        }
        return null;
    }
    
    public void delete(ProfissionalEnfermagem profissional){
        this.profissionais.remove(profissional);
    }
    
    public List<ProfissionalEnfermagem> readAll(){
        return this.profissionais;
    }
    
}
