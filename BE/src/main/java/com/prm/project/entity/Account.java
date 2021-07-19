package com.prm.project.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "account")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Account {

	@Id
	//@Pattern(regexp = "^[0-9]{10}$", message = "Phone is not format")
	@Column(name = "phone")
	private String phone;
	
	//@Size(min = 6, message = "username must be greater than 6 characters")
	@Column(name = "fullname", columnDefinition = "nvarchar(255)")
	private String fullname;
	
	//@Email(regexp = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$",message = "Email is not format")
	@Column(name = "email")
	private String email;
	
	//@Size(min = 6, max = 32, message = "the password must be 6 - 32 characters")
//	@Length(min = 6, max = 32, message = "the password must be 6 - 32 characters")
	@Column(name = "password")
	private String password;
	
	@Column(name = "birthday")
	//@Pattern(regexp = "^([0-2][0-9]|(3)[0-1])(\\/)(((0)[0-9])|((1)[0-2]))(\\/)\\d{4}$")
	private String birthday;
	
	@Column(name = "token", columnDefinition = "varchar(MAX)")
	private String token;
	
	@Column(name = "role_id")
	@JsonIgnoreProperties(value = "role_id", allowSetters = true, allowGetters = false)
	private String role_id;
	
	@Column(name = "status_id")
	@JsonIgnoreProperties(value = "status_id", allowSetters = true, allowGetters = false)
	private String status_id;
	
	private String image;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "status_id", insertable = false, updatable = false)
	private Status status;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "role_id", insertable = false, updatable = false)
	private Role role;
	
	@OneToMany(mappedBy = "account", fetch = FetchType.LAZY)
	private Set<Booking> booking;
}
