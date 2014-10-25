package model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name = "notificacao")  
public class Notificacao {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_notificacao")
	private int id;
	
	private String titulo;
	
	private String descricao;
	
	private Date data;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_usuario")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Usuario usuario;
	
	
	
	
	
}
