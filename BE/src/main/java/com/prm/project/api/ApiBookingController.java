package com.prm.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.prm.project.dto.BookingDTO;
import com.prm.project.service.BookingService;

@RestController
@RequestMapping("api/booking")
public class ApiBookingController {
	
	@Autowired
	private BookingService bookingService;
	
	@PutMapping("cancel/{booking_id}/{note}")
	public ResponseEntity<Object> cancelBooking(@PathVariable("booking_id") String booking_id,@PathVariable("note") String note) {
		try {
			bookingService.cancelBooking(booking_id,note);
			return new ResponseEntity<Object>("OK", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping("")
	public ResponseEntity<Object> booking(@RequestBody BookingDTO bookingDTO){
		try {
			bookingService.booking(bookingDTO);
			return new ResponseEntity<Object>("OK", HttpStatus.CREATED);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@PutMapping("accept/{phone}")
	public ResponseEntity<Object> accpectBooking(@PathVariable("phone") String phone) {
		try {
			bookingService.acceptCustomer(phone);
			return new ResponseEntity<Object>("OK", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@PutMapping("deny/{phone}")
	public ResponseEntity<Object> denyBooking(@PathVariable("phone") String phone) {
		try {
			bookingService.denyCustomer(phone);
			return new ResponseEntity<Object>("OK", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping("get-booking/{accountphone}")
	public ResponseEntity<Object> getBooking(@PathVariable("accountphone") String accountPhone){
		try {
			BookingDTO bookingDTO = bookingService.getBooking(accountPhone);
			return new ResponseEntity<Object>(bookingDTO,HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<Object>(HttpStatus.BAD_GATEWAY);
		}
	}
}
