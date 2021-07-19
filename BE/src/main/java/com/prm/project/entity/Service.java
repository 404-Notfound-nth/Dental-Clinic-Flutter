package com.prm.project.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "service")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Service {

	@Id
	@GenericGenerator(name = "generator", strategy = "uuid2", parameters = {})
	@Column(name = "id", columnDefinition = "uniqueidentifier")
	private String id;
	
	@Column(name = "serviceName", columnDefinition = "nvarchar(255)")
	private String serviceName;
	
	@Column(name = "price")
	private int price;
	
	@OneToMany(mappedBy = "service", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Booking> booking;
	
}
