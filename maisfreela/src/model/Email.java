package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Email {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_email")
	private long id;
	public String email;
}
