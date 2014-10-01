package br.senac.sp.hibernate.model;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;



@Entity
public class Produto {
	
	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	private int id;
	
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

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	public Collection<Comentario> getComentarios() {
		return comentarios;
	}

	public void addComentario(Comentario comentario) {
		this.comentarios.add(comentario);
	}

	private String nome;
	
	private String descricao;
	
	private Double preco;
	
	
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_fornecedor")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Fornecedor fornecedor;
	
	
	@OneToMany(fetch=FetchType.LAZY)
	@Cascade(value={CascadeType.DELETE, CascadeType.SAVE_UPDATE})
	private Collection<Comentario> comentarios = new ArrayList<Comentario>();
}
