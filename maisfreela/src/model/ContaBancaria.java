package model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name = "conta_bancaria") 
public class ContaBancaria {
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_conta")
	private long id;
	public ContaBancaria(){
		
	}
	
	private int banco;
	private int agencia;
	private int contaCorrente;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "id_desenvolvedor")
	private Desenvolvedor dev;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "id_empresario")
	private Empresario emp;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getBanco() {
		return banco;
	}
	public void setBanco(int banco) {
		this.banco = banco;
	}
	public int getAgencia() {
		return agencia;
	}
	public void setAgencia(int agencia) {
		this.agencia = agencia;
	}
	public int getContaCorrente() {
		return contaCorrente;
	}
	public void setContaCorrente(int contaCorrente) {
		this.contaCorrente = contaCorrente;
	}
	public Desenvolvedor getDev() {
		return dev;
	}
	public void setDev(Desenvolvedor dev) {
		this.dev = dev;
	}
	public Empresario getEmp() {
		return emp;
	}
	public void setEmp(Empresario emp) {
		this.emp = emp;
	}
	
	
	
	

}
