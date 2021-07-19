package com.prm.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.prm.project.service.DoctorService;

@RestController
@RequestMapping("api/doctor")
public class ApiDoctorController {
	
	@Autowired
	private DoctorService doctorService;
	
	@GetMapping("")
	public ResponseEntity<Object> getListDoctor(){
		try {
			return new ResponseEntity<Object>(doctorService.getListDoctorByStatus(),HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<Object>(HttpStatus.BAD_GATEWAY);
		}
	}
}
