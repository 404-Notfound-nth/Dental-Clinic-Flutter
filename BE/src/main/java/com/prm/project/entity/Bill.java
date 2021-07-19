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
@Table(name = "bill")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Bill {
	
	@Id
	@GenericGenerator(name = "generator", strategy = "uuid2", parameters = {})
	@Column(name = "id", columnDefinition = "uniqueidentifier")
	private String id;
	
	@Column(name = "totalPrice")
	private Long totalPrice;
	
//	@ManyToOne
//	@JsonIgnore
//	@JoinColumn(name = "service_id",insertable = false, updatable = false)
//	private Service service;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "booking_id",insertable = false, updatable = false)
	private Booking booking;
}
