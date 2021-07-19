package com.prm.project.service;

import java.util.List;

import com.prm.project.dto.DentistryDTO;

public interface DentistryService {
	List<DentistryDTO> getListDentistry();
	DentistryDTO getDentistry(String address);
}
