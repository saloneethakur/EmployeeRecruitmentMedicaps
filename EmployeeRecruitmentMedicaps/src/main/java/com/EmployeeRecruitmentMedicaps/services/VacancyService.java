package com.EmployeeRecruitmentMedicaps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.EmployeeRecruitmentMedicaps.entities.Vacancy;
import com.EmployeeRecruitmentMedicaps.repositories.VacancyRepository;

@Service
public class VacancyService {
	
	@Autowired
	public VacancyRepository vacancyRepo;

	public List<Vacancy> getAllVacancies() {
		
		return vacancyRepo.findAll();
	}
	

}
