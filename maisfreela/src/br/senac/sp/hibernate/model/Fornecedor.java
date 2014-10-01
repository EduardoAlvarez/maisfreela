package br.senac.sp.hibernate.model;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Fornecedor {

	
	private String nome;
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int id;
	
	@OneToMany(mappedBy="fornecedor", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private Collection<Produto> produtos = new ArrayList<Produto>();

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public Collection<Produto> getProdutos(){
		return this.produtos;
	}
	
	public void addProduto(Produto produto){
		this.produtos.add(produto);
	}
	
}
