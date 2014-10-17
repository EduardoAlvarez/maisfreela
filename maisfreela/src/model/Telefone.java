package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Telefone {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_telefone")
	private long id;
	
	public int numero;
}
