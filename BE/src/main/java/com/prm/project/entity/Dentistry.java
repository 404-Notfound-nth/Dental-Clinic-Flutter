package com.prm.project.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name = "dentistry")
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dentistry {
	
	@Id
	@Column(name = "address", columnDefinition = "nvarchar(255)")
	private String address;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "name", columnDefinition = "nvarchar(MAX)")
	private String name;
	
	//@Column(name = "kilometer", columnDefinition = "float")
	private String kilometer;
	
	@Column(name = "rating", columnDefinition = "float")
	private float rating;
	
	@Column(name = "image")
	private String image;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "description", columnDefinition = "nvarchar(255)")
	private String description;
	
//	@OneToMany(mappedBy = "dentistry", fetch = FetchType.LAZY)
//	private List<Booking> booking;
//	
}
