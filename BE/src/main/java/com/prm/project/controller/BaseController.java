package com.prm.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.prm.project.dto.BookingDTO;
import com.prm.project.dto.BookingDetailsDTO;
import com.prm.project.dto.DoctorsDTO;
import com.prm.project.dto.RateDTO;
import com.prm.project.service.BookingDetailService;
import com.prm.project.service.BookingService;
import com.prm.project.service.DoctorService;
import com.prm.project.service.RateService;

@Controller
public class BaseController {

	@Autowired
	private DoctorService doctorsService;

	@Autowired
	private BookingService bookingService;
	
	@Autowired
	private BookingDetailService bookingDetailService;

	@Autowired
	private RateService rateService;

	@RequestMapping("/home")
	public String welcome(Model model) {
		return "index";
	}

	@RequestMapping("/appointment")
	public String appointment(Model model) {
		// List<BookingDTO> booking = bookingService.getListBooking();
		List<BookingDTO> booking = bookingService.getListBooking();
		model.addAttribute("LIST_CUSTOMER", booking);
		return "appointment";
	}
	
	

	@RequestMapping("/dental_clinic")
	public String doctors(Model model) {
		return "dental_clinic";
	}

	@RequestMapping("/clinic_admin")
	public String clinic_admin(Model model) {
		List<DoctorsDTO> listDoctor = doctorsService.getAllListDoctor();
		model.addAttribute("LIST_DOCTOR", listDoctor);
		return "clinic_admin";
	}

	@GetMapping("/accept/{phone}")
	public String accept(@PathVariable("phone") String id, Model model) {
		bookingService.acceptCustomer(id);
		List<BookingDTO> booking = bookingService.getListBooking();
		model.addAttribute("LIST_CUSTOMER", booking);
		return "appointment";
	}

	@GetMapping("/deny/{phone}")
	public String deny(@PathVariable("phone") String id, Model model) {
		bookingService.denyCustomer(id);
		List<BookingDTO> booking = bookingService.getListBooking();
		model.addAttribute("LIST_CUSTOMER", booking);
		return "appointment";
	}
	

	@RequestMapping("/history")
	public String history(Model model) {
		return "history_appointment";
	}

	@RequestMapping("/rating")
	public String rating(Model model) {
		List<RateDTO> rate = rateService.getAllRating();
		model.addAttribute("LIST_RATE", rate);
		return "rating";
	}
	
	@RequestMapping("/booking")
	public String booking(Model model) {
		return "booking";
	}

	@RequestMapping("/bookingDetail")
	public String bookingDetail(Model model) {
		List<BookingDTO> listBookingDTO = bookingService.getListBooking();

		model.addAttribute("LIST_BOOKING", listBookingDTO);

		return "bookingDetail";
	}
	
	@GetMapping("/editStatus/{phone}")
	public String editStatus(@PathVariable("phone") String phone, Model model) {
		bookingService.editStatus(phone);
		List<BookingDTO> listBookingDTO = bookingService.getListBooking();

		model.addAttribute("LIST_BOOKING", listBookingDTO);
		return "bookingDetail";
	}


	@RequestMapping("/add-bookingDetail/{id}")
	public String addBookingDetail(@PathVariable("id") String id, Model model) {
		List<DoctorsDTO> listDoctorDTO = doctorsService.getListDoctorByStatus();
		BookingDetailsDTO bookingDetailsDTO = new BookingDetailsDTO();
		model.addAttribute("BOOKING_DETAILS", bookingDetailsDTO);
		model.addAttribute("LIST_DOCTOR", listDoctorDTO);
		model.addAttribute("booking_id", id);
		return "add-bookingDetail";
	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute("BOOKING_DETAILS") BookingDetailsDTO bookingDetailsDTO, Model model ) {
		bookingDetailService.add(bookingDetailsDTO);
		doctorsService.updateDoctorStatus(bookingDetailsDTO.getDoctor_id());
		return "redirect:bookingDetail";
	}
}
