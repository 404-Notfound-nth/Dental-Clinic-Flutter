package com.prm.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prm.project.entity.Rate;

@Repository
public interface RateRepository extends JpaRepository<Rate, String> {
	List<Rate> findByDoctorId(String doctorId);
}	
