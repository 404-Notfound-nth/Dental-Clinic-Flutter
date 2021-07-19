package com.prm.project.dto;

import java.io.Serializable;

import com.prm.project.entity.Booking;
import com.prm.project.entity.Doctors;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookingDetailsDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	private String booking_id;

	private String doctor_id;

//	private Booking booking;
//
//	private Doctors doctor;
}
