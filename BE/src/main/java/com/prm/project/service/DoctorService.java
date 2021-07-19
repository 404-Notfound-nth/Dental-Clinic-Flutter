package com.prm.project.service;

import java.util.List;

import com.prm.project.dto.DoctorsDTO;

public interface DoctorService {
	List<DoctorsDTO> getListDoctorByStatus();
	List<DoctorsDTO> getAllListDoctor();
	void updateDoctorStatus(String doctor_id);
}
