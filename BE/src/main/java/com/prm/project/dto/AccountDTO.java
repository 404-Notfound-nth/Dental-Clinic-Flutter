package com.prm.project.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountDTO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	private String phone;

	private String fullname;
	
	private String email;

	private String role_id;
	
	private String status_id;

	private String password;

	private String birthday;
	
	private String token;
	
//	private Role role;
	


}
