package com.prm.project.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DentistryDTO implements Serializable {
	/**
		 * 
		 */
	private static final long serialVersionUID = 1L;

	private String address;

	private String phone;

	private String name;

	private int kilometer;

	private float rating;

	private String image;

	private String email;
	

}
