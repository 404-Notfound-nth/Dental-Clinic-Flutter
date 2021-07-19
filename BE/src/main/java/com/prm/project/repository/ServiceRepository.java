package com.prm.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.prm.project.entity.Service;

@Repository
public interface ServiceRepository extends JpaRepository<Service, String>{
//	Service findById(String serviceID);
	
	@Query(value = "SELCT * FROM service WHERE service_id= ?1", nativeQuery = true)
	List<Service> getServiceName(String serviceID);
	
	//List<Service> findById(String id);
}
