package com.prm.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.prm.project.dto.RateDTO;
import com.prm.project.service.RateService;

@RestController
@RequestMapping("api/rate")
public class ApiRateController {

	@Autowired
	private RateService rateService;
	
	@PostMapping("")
	public ResponseEntity<Object> rateDoctor(@RequestBody RateDTO rateDTO){
		try {
			rateService.rateDoctor(rateDTO);
			return new ResponseEntity<Object>("Rate Successfull !!!", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping("getRate/{doctorID}")
	public ResponseEntity<Object> getRateByDoctor(@PathVariable("doctorID") String doctorID){
		try {
			return new ResponseEntity<Object>( rateService.getRateByDoctor(doctorID),HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
		}
	}
}
