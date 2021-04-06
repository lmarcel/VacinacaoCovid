/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.model.repositorios;

import br.recife.edu.ifpe.model.classes.Vacina;
import java.util.ArrayList;
import java.util.List;

public class RepositorioVacina {
    private static RepositorioVacina myself = null;
    
    private List<Vacina> vacinas;
    
    private RepositorioVacina(){
        this.vacinas = new ArrayList<>();
    }
    
    public static RepositorioVacina getCurrentInstance(){
        if(myself == null)
            myself = new RepositorioVacina();
        
        return myself;
    }
    
    public void insert(Vacina vacina){
        this.vacinas.add(vacina);
    }
    
    public void update(Vacina vacina){
        for(Vacina v: this.vacinas){
            if(v.getId()==vacina.getId()){
                
                v.setFabricante(vacina.getFabricante());
                v.setNome(vacina.getNome());
                v.setQuantidadeAplicacoes(vacina.getQuantidadeAplicacoes());
                v.setTempoEntreAplicacoes(vacina.getTempoEntreAplicacoes());
                
                return;
            }
        }
    }
    
    public Vacina read(int id){
        for(Vacina v: this.vacinas){
            if(v.getId() == id){
                return v;
            }
        }
        return null;
    }
    
    public void delete(Vacina vacina){
        this.vacinas.remove(vacina);
    }
    
    public List<Vacina> readAll(){
        return this.vacinas;
    }
}
