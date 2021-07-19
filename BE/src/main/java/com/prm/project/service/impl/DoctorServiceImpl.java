package com.prm.project.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prm.project.dto.DoctorsDTO;
import com.prm.project.entity.Doctors;
import com.prm.project.repository.DoctorRepository;
import com.prm.project.service.DoctorService;

@Service
public class DoctorServiceImpl implements DoctorService{
	public static final String NOT_BOOKING_STATUS = "NOT BOOKING";
	public static final String BOOKING_STATUS = "BOOKING";
	
	@Autowired
	private DoctorRepository doctorRepository;
	
	@Autowired
	private ModelMapper modelmapper;
	
	@Override
	public List<DoctorsDTO> getListDoctorByStatus() {
		// TODO Auto-generated method stub
		List<Doctors> doctor = doctorRepository.findByStatusId(NOT_BOOKING_STATUS);
		List<DoctorsDTO> doctorDTO = modelmapper.map(doctor, new TypeToken<List<DoctorsDTO>>(){}.getType());
		return doctorDTO;
	}

	@Override
	public List<DoctorsDTO> getAllListDoctor() {
		// TODO Auto-generated method stub
		List<Doctors> doctor =  doctorRepository.findAll();
		List<DoctorsDTO> doctorDTO = modelmapper.map(doctor, new TypeToken<List<DoctorsDTO>>(){}.getType());
		return doctorDTO;
	}

	@Override
	public void updateDoctorStatus(String doctor_id) {
		// TODO Auto-generated method stub
		Doctors doctors = doctorRepository.findById(doctor_id).get();
		if(doctors != null) {
			doctors.setStatus_id(BOOKING_STATUS);
			doctorRepository.save(doctors);
		}
		
	}

}
