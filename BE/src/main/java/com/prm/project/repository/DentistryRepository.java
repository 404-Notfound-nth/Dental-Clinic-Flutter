package com.prm.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prm.project.entity.Dentistry;

@Repository
public interface DentistryRepository extends JpaRepository<Dentistry, String>{
	

}
