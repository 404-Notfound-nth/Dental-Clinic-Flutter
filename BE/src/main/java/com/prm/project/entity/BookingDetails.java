package com.prm.project.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "bookingDetails")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookingDetails {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@GenericGenerator(name = "generator", strategy = "uuid2", parameters = {})
	@Column(name = "booking_id", columnDefinition = "uniqueidentifier")
	private String booking_id;
	
	@GenericGenerator(name = "generator", strategy = "uuid2", parameters = {})
	@Column(name = "doctor_id", columnDefinition = "uniqueidentifier")
	private String doctor_id;
	
	@ManyToOne
	@JoinColumn(name = "booking_id", insertable = false, updatable = false)
	@JsonIgnore
	private Booking booking;
	
	@ManyToOne
	@JoinColumn(name = "doctor_id", insertable = false, updatable = false)
	@JsonIgnore
	private Doctors doctor;
}
