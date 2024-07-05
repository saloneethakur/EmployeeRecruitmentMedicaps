package com.EmployeeRecruitmentMedicaps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.EmployeeRecruitmentMedicaps.entities.PersonalInformation;
@Repository
public interface PersonalRepo extends JpaRepository<PersonalInformation, Integer>{

}
