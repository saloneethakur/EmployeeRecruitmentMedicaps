package com.EmployeeRecruitmentMedicaps.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.EmployeeRecruitmentMedicaps.entities.Education;
import com.EmployeeRecruitmentMedicaps.entities.PersonalInformation;
import com.EmployeeRecruitmentMedicaps.entities.User;
@Repository
public interface PersonalRepo extends JpaRepository<PersonalInformation, Integer>{
 Optional<PersonalInformation> findByUser(User user);
 List<Education> findByEducations(Integer personalInformationId);
}
