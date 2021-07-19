package com.prm.project.api;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.prm.project.dto.ServiceDTO;
import com.prm.project.entity.Service;
import com.prm.project.repository.ServiceRepository;

@RestController
@RequestMapping("api/service")
public class ApiServiceController {
	
	@Autowired
	private ServiceRepository serviceRepository;
	
	@Autowired
	private ModelMapper modelmapper;
	
	@GetMapping("")
	public ResponseEntity<Object> getListService(){
		try {
			List<Service> listService = serviceRepository.findAll();
			List<ServiceDTO> listServiceDTO = modelmapper.map(listService, new TypeToken<List<ServiceDTO>>() {
			}.getType());
			return new ResponseEntity<Object>(listServiceDTO,HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<Object>(HttpStatus.BAD_GATEWAY);
		}
	}
	
	@GetMapping("{id}")
	public ResponseEntity<Object> getService(@PathVariable("id") String id){
		try {
			Service service = serviceRepository.findById(id).get();
			ServiceDTO serviceDTO = modelmapper.map(service, ServiceDTO.class);
			return new ResponseEntity<Object>(serviceDTO,HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<Object>(HttpStatus.BAD_GATEWAY);
		}
	}
	
}
