/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.model.classes;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Paciente {
    
    private int id;
    private String nome;
    private Date dataNascimento;
    private String caracteristicasIndividuais;
    private Grupo grupo;
    private List<Aplicacao> aplicacoes;
    
    
    
    public Paciente(){
        this.aplicacoes = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getCaracteristicasIndividuais() {
        return caracteristicasIndividuais;
    }

    public void setCaracteristicasIndividuais(String caracteristicasIndividuais) {
        this.caracteristicasIndividuais = caracteristicasIndividuais;
    }

    public Grupo getGrupo() {
        return grupo;
    }

    public void setGrupo(Grupo grupo) {
        this.grupo = grupo;
    }

    public List<Aplicacao> getAplicacoes() {
        return aplicacoes;
    }

    public void setAplicacoes(List<Aplicacao> aplicacoes) {
        this.aplicacoes = aplicacoes;
    }
    
    public void add(Aplicacao aplicacao){
        this.aplicacoes.add(aplicacao);
    }
}
