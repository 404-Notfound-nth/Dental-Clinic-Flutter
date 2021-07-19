package com.prm.project.entity;

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
@Table(name = "doctor")
@AllArgsConstructor
@NoArgsConstructor
public class Doctors {
	
	@Id
	@GenericGenerator(name = "generator", strategy = "uuid2", parameters = {})
	@Column(name = "id", columnDefinition = "uniqueidentifier")
	private String id;
	
	@Column(name = "doctorName", columnDefinition = "nvarchar(255)")
	private String doctorName;

	private String phone;
	
	@Column(name = "dentistry_address", columnDefinition = "nvarchar(255)")
	private String dentistry_address;
	
	@Column(name = "email", columnDefinition = "varchar(255)")
	private String email;
	
	@Column(name = "gender", columnDefinition = "nvarchar(5)")
	private String gender;
	
	@Column(name = "address_doctor", columnDefinition = "nvarchar(255)")
	private String address_doctor;
	
	private String status_id;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "status_id", insertable = false, updatable = false)
	private Status status;
	
	@OneToMany(mappedBy = "doctor", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<BookingDetails> bookingDetails;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "dentistry_address", insertable = false, updatable = false)
	private Dentistry dentistry;
	
//	@OneToMany(mappedBy = "doctor", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//	private Set<Booking> booking;
}
