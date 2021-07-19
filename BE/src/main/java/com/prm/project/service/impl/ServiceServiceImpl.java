package com.prm.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prm.project.dto.ServiceDTO;
import com.prm.project.repository.ServiceRepository;
import com.prm.project.service.ServiceService;

@Service
public class ServiceServiceImpl implements ServiceService{

	@Autowired
	private ServiceRepository serviceRepository;
	
	@Override
	public List<ServiceDTO> listServiceDTOs() {
		// TODO Auto-generated method stub
		//List<Service> listService = serviceRepository.findAll();
		return null;
	}

}
