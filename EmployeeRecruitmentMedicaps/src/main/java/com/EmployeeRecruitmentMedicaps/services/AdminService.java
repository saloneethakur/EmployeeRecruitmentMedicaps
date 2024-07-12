package com.EmployeeRecruitmentMedicaps.services;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.models.VacancyModel;
import com.EmployeeRecruitmentMedicaps.repositories.VacancyRepository;
import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.entities.Vacancy;

@Service
public class AdminService {
	@Autowired
	public VacancyRepository vacancyRepo;

	public ApiResponse addVacancy(VacancyModel model) {
		
		ApiResponse res=null;
		try
		{
			
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user = (User)principal;
			System.out.println("inside add vacancy");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date Vstart = sdf.parse(model.getVstart());
			
			Date Vlast = sdf.parse(model.getVlast());
			
			Vacancy v=new Vacancy(model.getType(),model.getFaculty(),model.getDepartment(),model.getPostAppliedFor(),Vstart,Vlast,user);
			System.out.println("data saved in object");
			System.out.println(v);
			if(v != null) {
			vacancyRepo.save(v);
			res = new ApiResponse(true, "Vacancy Created ");
			}
			return res;
		}
		catch(Exception e) {
			System.err.println(e.getMessage());
			res = new ApiResponse(false, "Customer Save Failed !", e.getMessage());
			return res;
		}
		
	}

}
