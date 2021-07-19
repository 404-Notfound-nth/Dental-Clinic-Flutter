package com.prm.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prm.project.entity.Doctors;

@Repository
public interface DoctorRepository extends JpaRepository<Doctors, String>{
		List<Doctors> findByStatusId(String status);
}
