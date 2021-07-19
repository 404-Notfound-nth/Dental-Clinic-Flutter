package com.prm.project.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prm.project.dto.DentistryDTO;
import com.prm.project.entity.Dentistry;
import com.prm.project.repository.DentistryRepository;
import com.prm.project.service.DentistryService;



@Service
public class DentistryServiceImpl implements DentistryService{

	private DentistryRepository dentistryRepository;
	
	
	
	public DentistryServiceImpl( DentistryRepository dentistryRepository) {
		super();
		this.dentistryRepository = dentistryRepository;
	}

	@Autowired
	private ModelMapper modelMapper;
	
	@Override
	public List<DentistryDTO> getListDentistry() {
		// TODO Auto-generated method stub
		List<Dentistry> listDentistry = dentistryRepository.findAll();
		List<DentistryDTO> listDentistryDTO = modelMapper.map(listDentistry, new TypeToken<List<Dentistry>>() {
		}.getType());
		return listDentistryDTO;
	}

	@Override
	public DentistryDTO getDentistry(String address) {
		// TODO Auto-generated method stub
		Dentistry dentistry = dentistryRepository.findById(address).get();
		DentistryDTO dentistryDTO = modelMapper.map(dentistry, DentistryDTO.class);
		return dentistryDTO;
	}

}
