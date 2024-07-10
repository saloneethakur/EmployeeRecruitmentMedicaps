package com.EmployeeRecruitmentMedicaps.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.EmployeeRecruitmentMedicaps.entities.Education;
import com.EmployeeRecruitmentMedicaps.entities.User;

@Repository
public interface EducationRepo extends JpaRepository<Education , Integer>{
		Optional<Education> findByUser(User user);
} 
