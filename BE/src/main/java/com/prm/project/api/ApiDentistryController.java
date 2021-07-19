package com.prm.project.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.prm.project.dto.DentistryDTO;
import com.prm.project.service.DentistryService;

@RestController
@RequestMapping("api/dentistry")
public class ApiDentistryController {

	@Autowired
	private DentistryService dentistryService;
	
	@GetMapping("")
	public ResponseEntity<Object> getListDentistry(){
		try {
			return new ResponseEntity<Object>(dentistryService.getListDentistry() ,HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<Object>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	@GetMapping("{address}")
	public ResponseEntity<Object> getDentistry(@PathVariable("address") String address){
		try {
			DentistryDTO dentistryDTO = dentistryService.getDentistry(address);
			return new ResponseEntity<Object>(dentistryDTO,HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<Object>(HttpStatus.BAD_GATEWAY);
		}
	}
}
