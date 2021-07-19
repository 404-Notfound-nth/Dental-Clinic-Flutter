package com.prm.project.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "rate")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Rate {
	
	@Id
	@GenericGenerator(name = "generator", strategy = "uuid2", parameters = {})
	@Column(name = "id", columnDefinition = "uniqueidentifier")
	private String id;
	
	@Column(name = "doctorNumberRating")
	private Integer doctorNumberRating;
	
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "doctor_id", insertable = false, updatable = false)
	private Doctors doctor;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "account_phone", insertable = false, updatable = false)
	private Account account;

}
