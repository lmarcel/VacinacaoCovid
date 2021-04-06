/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.model.classes;

public class Vacina {
    
    private int id;
    private String nome;
    private String fabricante;
    private String tempoEntreAplicacoes;
    private int quantidadeAplicacoes;

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

    public String getFabricante() {
        return fabricante;
    }

    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }

    public String getTempoEntreAplicacoes() {
        return tempoEntreAplicacoes;
    }

    public void setTempoEntreAplicacoes(String tempoEntreAplicacoes) {
        this.tempoEntreAplicacoes = tempoEntreAplicacoes;
    }

    public int getQuantidadeAplicacoes() {
        return quantidadeAplicacoes;
    }

    public void setQuantidadeAplicacoes(int quantidadeAplicacoes) {
        this.quantidadeAplicacoes = quantidadeAplicacoes;
    }
    
    
    
}
