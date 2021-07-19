package com.prm.project.service.impl;

import java.util.List;
import java.util.UUID;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prm.project.dto.BookingDTO;
import com.prm.project.entity.Booking;
import com.prm.project.repository.BookingRepository;
import com.prm.project.service.BookingService;

@Service
public class BookingServiceImpl implements BookingService{
	
	public static final String CANCEL_STATUS = "CANCEL";
	public static final String ACCEPT_STATUS = "ACCEPT";
	public static final String DENY_STATUS = "DENY";
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private BookingRepository bookingRepository;

	@Override
	public BookingDTO getByPhone(String phone) {
		// TODO Auto-generated method stub
		Booking booking = bookingRepository.findById(phone).get();		
		BookingDTO bookingDTO = modelMapper.map(booking, BookingDTO.class);
		return bookingDTO;
	}


	@Override
	public void cancelBooking(String phone) {
		// TODO Auto-generated method stub
		Booking booking = bookingRepository.findById(phone).get();
		long millis=System.currentTimeMillis();   
		java.util.Date date=new java.util.Date(millis);
		if(booking !=null) {
			booking.setStatus_id(CANCEL_STATUS);
			booking.setNote(booking.getNote());
			booking.setModifiedDate(date);
			
			bookingRepository.save(booking);
		}
	}


//	@Override
//	public List<BookingDTO> getListBooking(String doctorID) {
//		// TODO Auto-generated method stub
//		List<Booking> booking = bookingRepository.findByDoctorId(doctorID);
//		List<BookingDTO> bookingDTO = modelMapper.map(booking, new TypeToken<List<BookingDTO>>() {}.getType()); 
//		return bookingDTO;
//	}


	@Override
	public void booking(BookingDTO bookingDTO) {
		// TODO Auto-generated method stub
		long millis=System.currentTimeMillis();   
		java.util.Date date=new java.util.Date(millis);
		bookingDTO.setId(UUID.randomUUID().toString());
		bookingDTO.setAccount_phone(bookingDTO.getAccount_phone());
		bookingDTO.setCreateDate(date);
		bookingDTO.setService_id(bookingDTO.getService_id());
		bookingDTO.setStatus_id(bookingDTO.getStatus_id());
		bookingDTO.setNote(bookingDTO.getNote());
		
		Booking booking = modelMapper.map(bookingDTO, Booking.class);
		
		bookingRepository.save(booking);
	}


	@Override
	public void acceptCustomer(String phone) {
		// TODO Auto-generated method stub
		Booking booking = bookingRepository.findByAccountPhone(phone);
		if(booking != null) {
			booking.setStatus_id(ACCEPT_STATUS);
			bookingRepository.save(booking);
		}
	}


	@Override
	public void denyCustomer(String phone) {
		// TODO Auto-generated method stub
		Booking booking = bookingRepository.findByAccountPhone(phone);
		if(booking != null) {
			booking.setStatus_id(DENY_STATUS);
			bookingRepository.save(booking);
		}
	}


	@Override
	public List<BookingDTO> getListBooking() {
		// TODO Auto-generated method stub
		List<Booking> booking = bookingRepository.findAll();
		List<BookingDTO> bookingDTO = modelMapper.map(booking, new TypeToken<List<Booking>>() {
		}.getType());
		return bookingDTO;
	}


	@Override
	public BookingDTO getBooking(String phone) {
		// TODO Auto-generated method stub
		Booking booking = bookingRepository.findByAccountPhone(phone);
		BookingDTO bookingDTO = modelMapper.map(booking, BookingDTO.class);
		return bookingDTO;
	}


	@Override
	public void cancelBooking(String booking_id, String note) {
		// TODO Auto-generated method stub
		Booking booking = bookingRepository.findById(booking_id).get();
		long millis=System.currentTimeMillis();   
		java.util.Date date=new java.util.Date(millis);
		if(booking !=null) {
			booking.setStatus_id(CANCEL_STATUS);
			booking.setNote(note);
			booking.setModifiedDate(date);
			
			bookingRepository.save(booking);
		}
	}





}
