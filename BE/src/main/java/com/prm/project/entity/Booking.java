package com.prm.project.entity;

import java.sql.Time;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Table(name = "booking")
@NoArgsConstructor
@AllArgsConstructor
public class Booking {
	@Id
	@GenericGenerator(name = "generator", strategy = "uuid2", parameters = {})
	@Column(name = "id", columnDefinition = "uniqueidentifier")
	private String id;
	private Date createDate;
	private Date modifiedDate;
	
	@Column(name = "note", columnDefinition = "nvarchar(255)")
	private String note;
	
	@Column(name = "status_id")
	private String status_id;
	
	@Column(name = "account_phone")
	private String account_phone;
	
	@GenericGenerator(name = "generator", strategy = "uuid2", parameters = {})
	@Column(name = "service_id", columnDefinition = "uniqueidentifier")
	private String service_id;
	
	private Time time;
	
	@Column(name = "date", columnDefinition = "date")
	private Date date;
	
	@Column(columnDefinition = "nvarchar(255)")
	private String dentistry_address;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "account_phone", insertable = false, updatable = false)
	private Account account;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "status_id", insertable = false, updatable = false)
	private Status status;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "service_id",insertable = false, updatable = false)
	private Service service;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "dentistry_address", insertable = false, updatable = false)
	private Dentistry dentistry;
	
	@OneToMany(mappedBy = "booking", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Bill> bill;
	
	@OneToMany(mappedBy = "booking", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<BookingDetails> bookingDetails;
	
}
