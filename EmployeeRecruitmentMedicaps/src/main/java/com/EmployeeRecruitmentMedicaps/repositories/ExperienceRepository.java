package com.EmployeeRecruitmentMedicaps.repositories;


import com.EmployeeRecruitmentMedicaps.entities.Experience;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ExperienceRepository extends JpaRepository<Experience, Integer> {

   // List<Experience> findByPersonalInformationPersonalInformationId(Integer personalInformationId);
   // List<Experience> findByPersonalInformationId(Integer personalInformationId);
    // You can define other custom queries or methods here if needed
	
	 List<Experience> findByPersonalInformationId(Integer personalInformationId);
}