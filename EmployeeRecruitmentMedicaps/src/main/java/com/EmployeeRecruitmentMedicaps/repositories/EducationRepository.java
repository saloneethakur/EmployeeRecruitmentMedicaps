package com.EmployeeRecruitmentMedicaps.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.EmployeeRecruitmentMedicaps.entities.Education;
import com.EmployeeRecruitmentMedicaps.entities.PersonalInformation;

@Repository
public interface EducationRepository extends JpaRepository<Education, Integer>{
	
		List<Education> findByPersonalInformationId(Integer personalInformationId);

		

}