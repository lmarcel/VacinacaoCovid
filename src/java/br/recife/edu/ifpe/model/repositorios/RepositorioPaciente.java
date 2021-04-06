/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.model.repositorios;

import br.recife.edu.ifpe.model.classes.Paciente;
import java.util.ArrayList;
import java.util.List;


/*
    A responsabilidade pelo tratamento dos dados das aplicações é do repositório de Paciente.
    Isto ocorre, porque Aplicação está composta em Paciente.
*/
public class RepositorioPaciente {
    private static RepositorioPaciente myself = null;
    
    private List<Paciente> pacientes;
    
    private RepositorioPaciente(){
        this.pacientes = new ArrayList<>();
    }
    
    public static RepositorioPaciente getCurrentInstance(){
        if(myself == null)
            myself = new RepositorioPaciente();
        
        return myself;
    }
    
    public void insert(Paciente paciente){
        this.pacientes.add(paciente);
    }
    
    public void update(Paciente paciente){
        for(Paciente p: this.pacientes){
            if(p.getId()==paciente.getId()){
                
                p.setCaracteristicasIndividuais(paciente.getCaracteristicasIndividuais());
                p.setDataNascimento(paciente.getDataNascimento());
                p.setGrupo(paciente.getGrupo());
                p.setNome(paciente.getNome());
                
                return;
            }
        }
    }
    
    public Paciente read(int id){
        for(Paciente p: this.pacientes){
            if(p.getId() == id){
                return p;
            }
        }
        return null;
    }
    
    public void delete(Paciente paciente){
        this.pacientes.remove(paciente);
    }
    
    public List<Paciente> readAll(){
        return this.pacientes;
    }
    
}
