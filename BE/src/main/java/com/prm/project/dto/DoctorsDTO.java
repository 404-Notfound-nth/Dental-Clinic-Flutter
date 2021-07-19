package com.prm.project.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DoctorsDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String doctorName;

	private String phone;

	private String dentistry_address;

	private String email;

	private String gender;

	private String address_doctor;

	private String status_id;

}
