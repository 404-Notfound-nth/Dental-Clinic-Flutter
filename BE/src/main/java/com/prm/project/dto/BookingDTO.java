package com.prm.project.dto;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

import com.prm.project.entity.Service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookingDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	
	private Date createDate;
	
	private Date modifiedDate;

	private Time time;
	
	private Date date;
	
	private String note;

	private String status_id;

	private String account_phone;

	private String service_id;
	
	private String dentistry_address;
	
	private Service serviceDTO;

}
