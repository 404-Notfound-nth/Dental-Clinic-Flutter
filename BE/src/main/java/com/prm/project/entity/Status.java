package com.prm.project.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "status")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Status {
	@Id
	private String id;
	private String statusName;
	
	@OneToMany(mappedBy = "status",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Account> account;
	
	@OneToMany(mappedBy = "status",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Doctors> doctor;
	
	@OneToMany(mappedBy = "status",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Booking> booking;
}
