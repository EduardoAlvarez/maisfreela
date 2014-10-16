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

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Projeto {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_projeto")
	private int id;
	private String titulo;
	
	@OneToMany(mappedBy="projeto", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Tag> tags = new ArrayList<Tag>();
	
	private double valor;
	private Date prazo;
	private String descricao;
	private String status; //arrumar depois!!!
	
	@OneToMany(mappedBy="projeto", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Lance> lances = new ArrayList<Lance>();
	
	public void setId(int id) {
		this.id = id;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public void setPrazo(Date prazo) {
		this.prazo = prazo;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setLances(List<Lance> lances) {
		this.lances = lances;
	}

	public void setPagamento1(boolean pagamento1) {
		this.pagamento1 = pagamento1;
	}

	public void setPagamento2(boolean pagamento2) {
		this.pagamento2 = pagamento2;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public void setDataTermino(Date dataTermino) {
		this.dataTermino = dataTermino;
	}

	public void setFreelancer(Usuario freelancer) {
		this.freelancer = freelancer;
	}

	public void setEmpresario(Usuario empresario) {
		this.empresario = empresario;
	}

	private boolean pagamento1;
	private boolean pagamento2;
	private Date dataInicio;
	private Date dataTermino;
	
	public int getId() {
		return id;
	}

	public String getTitulo() {
		return titulo;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public double getValor() {
		return valor;
	}

	public Date getPrazo() {
		return prazo;
	}

	public String getDescricao() {
		return descricao;
	}

	public String getStatus() {
		return status;
	}

	public List<Lance> getLances() {
		return lances;
	}

	public boolean isPagamento1() {
		return pagamento1;
	}

	public boolean isPagamento2() {
		return pagamento2;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public Date getDataTermino() {
		return dataTermino;
	}

	public Usuario getFreelancer() {
		return freelancer;
	}

	public Usuario getEmpresario() {
		return empresario;
	}

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_usuario")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Usuario freelancer = null; //pode começar sem..
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_usuario")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Usuario empresario;
	
	
}
