package com.prm.project.service.impl;

import java.util.List;
import java.util.UUID;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prm.project.dto.AccountDTO;
import com.prm.project.dto.DoctorsDTO;
import com.prm.project.dto.RateDTO;
import com.prm.project.entity.Rate;
import com.prm.project.repository.RateRepository;
import com.prm.project.service.RateService;

@Service
public class RateServiceImpl implements RateService{

	@Autowired
	private RateRepository rateRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Override
	public void rateDoctor(RateDTO rateDTO) {
		// TODO Auto-generated method stub
		Rate entity = null;
		DoctorsDTO doctor = new DoctorsDTO();
		AccountDTO account = new AccountDTO();
		rateDTO.setId(UUID.randomUUID().toString());
		rateDTO.setDoctorNumberRating(rateDTO.getDoctorNumberRating());
		rateDTO.setDoctor(doctor);
		rateDTO.setAccount(account);
		
		entity = modelMapper.map(rateDTO, Rate.class);
		rateRepository.save(entity);
		
	}

	@Override
	public List<RateDTO> getRateByDoctor(String doctorID) {
		// TODO Auto-generated method stub
		List<Rate> listRate = rateRepository.findByDoctorId(doctorID);
		List<RateDTO> listRateDTO = modelMapper.map(listRate, new TypeToken<List<RateDTO>>() {
		}.getType());
		return listRateDTO;
	}

	@Override
	public List<RateDTO> getAllRating() {
		// TODO Auto-generated method stub
		List<Rate> rate = rateRepository.findAll();
		List<RateDTO> rateDTO = modelMapper.map(rate, new TypeToken<List<RateDTO>>() {}.getType());
		//System.err.println(rateDTO);
		return rateDTO;
	}

	

}
