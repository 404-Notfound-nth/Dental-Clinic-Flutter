package com.prm.project.service;

import com.prm.project.dto.BookingDetailsDTO;

public interface BookingDetailService {
	BookingDetailsDTO getBookingDeatail();
	void add(BookingDetailsDTO bookingDetailsDTO);
	
}
