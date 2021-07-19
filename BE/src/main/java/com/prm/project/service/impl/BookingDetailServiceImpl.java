package com.prm.project.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prm.project.dto.BookingDetailsDTO;
import com.prm.project.entity.BookingDetails;
import com.prm.project.repository.BookingDetailsRepository;
import com.prm.project.service.BookingDetailService;

@Service
public class BookingDetailServiceImpl implements BookingDetailService{

	@Autowired
	private ModelMapper modelmapper;
	
	@Autowired
	private BookingDetailsRepository bookingDetailsRepository;
	
	@Override
	public BookingDetailsDTO getBookingDeatail() {
		// TODO Auto-generated method stub
		//BookingDetails bookingDetails = bookingDetailsRepository.findAll();
		return null;
	}

	@Override
	public void add(BookingDetailsDTO bookingDetailsDTO) {
		// TODO Auto-generated method stub
		bookingDetailsDTO.setBooking_id(bookingDetailsDTO.getBooking_id());
		bookingDetailsDTO.setDoctor_id(bookingDetailsDTO.getDoctor_id());
		
		BookingDetails bookingDetails = modelmapper.map(bookingDetailsDTO, BookingDetails.class);
		bookingDetailsRepository.save(bookingDetails);
	}

}
