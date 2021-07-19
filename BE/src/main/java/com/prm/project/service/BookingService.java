package com.prm.project.service;

import java.util.List;

import com.prm.project.dto.BookingDTO;

public interface BookingService {
	void cancelBooking(String phone);

	BookingDTO getByPhone(String phone);

	//List<BookingDTO> getListBooking(String doctorID);

	void booking(BookingDTO bookingDTO);

	void acceptCustomer(String phone);
	
	void denyCustomer(String phone);
	
	void cancelBooking(String booking_id,String note);
	
	List<BookingDTO> getListBooking();
	
	BookingDTO getBooking(String phone);
}
