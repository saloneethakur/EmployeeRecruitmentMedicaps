package com.EmployeeRecruitmentMedicaps.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.EmployeeRecruitmentMedicaps.entities.PersonalInformation;
import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.entities.Vacancy;
@Repository
public interface VacancyRepository extends JpaRepository<Vacancy, Integer>{
	Optional<Vacancy> findByUser(User user);
}
