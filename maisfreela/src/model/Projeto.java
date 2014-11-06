package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name = "projeto")  
public class Projeto {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_projeto")
	private int id;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public float getValor() {
		return valor;
	}

	public void setValor(float valor) {
		this.valor = valor;
	}

	public int getPrazo() {
		return prazo;
	}

	public void setPrazo(int prazo) {
		this.prazo = prazo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<Lance> getLances() {
		return lances;
	}

	public void setLances(List<Lance> lances) {
		this.lances = lances;
	}

	public Desenvolvedor getDesenvolvedor() {
		return desenvolvedor;
	}

	public void setDesenvolvedor(Desenvolvedor desenvolvedor) {
		this.desenvolvedor = desenvolvedor;
	}

	public Empresario getEmpresario() {
		return empresario;
	}

	public void setEmpresario(Empresario empresario) {
		this.empresario = empresario;
	}

	public boolean isPagamento1() {
		return pagamento1;
	}

	public void setPagamento1(boolean pagamento1) {
		this.pagamento1 = pagamento1;
	}

	public boolean isPagamento2() {
		return pagamento2;
	}

	public void setPagamento2(boolean pagamento2) {
		this.pagamento2 = pagamento2;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	private String titulo;
	
	@OneToMany(mappedBy="projeto" , fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Tag> tags;
	
	private float valor;
	private int prazo;
	private String descricao;
	
	private String status; //arrumar depois!!! ENUM
	
	@OneToMany(mappedBy="projeto", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Lance> lances;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_desenvolvedor")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Desenvolvedor desenvolvedor;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_empresario")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Empresario empresario;
	
	@Column(nullable=true) 
	private boolean pagamento1;
	
	@Column(nullable=true)
	
	private boolean pagamento2;
	
	private Date dataInicio;
}
