package com.prm.project.service;

import java.util.List;

import com.prm.project.dto.RateDTO;

public interface RateService {
	void rateDoctor(RateDTO rateDTO);
	List<RateDTO> getRateByDoctor(String doctorID);
	List<RateDTO> getAllRating();
}
