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
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "role")
public class Role {
	
	@Id
	private String id;
	private String roleName;
	
	@OneToMany(mappedBy = "role", fetch = FetchType.LAZY ,cascade = CascadeType.ALL)
	private Set<Account> account;
}
