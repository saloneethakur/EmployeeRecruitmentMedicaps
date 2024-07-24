package com.EmployeeRecruitmentMedicaps.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.models.VacancyModel;
import com.EmployeeRecruitmentMedicaps.repositories.ApplicationRepository;
import com.EmployeeRecruitmentMedicaps.repositories.VacancyRepository;
import com.EmployeeRecruitmentMedicaps.entities.Application;
import com.EmployeeRecruitmentMedicaps.entities.PersonalInformation;
import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.entities.Vacancy;

@Service
public class AdminService {
	@Autowired
	public VacancyRepository vacancyRepo;
	@Autowired
	public ApplicationRepository applicationRepo;
	ApiResponse res =null;

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

	public ApiResponse updateVacancy(Integer id, VacancyModel vmodel) {
		try {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
         User user = (User) principal;

         Optional<Vacancy> op = vacancyRepo.findByUser(user);
         if(op.isPresent()) {
        	 Vacancy v=op.get();
        	 if(op!=null)
        	 {
        		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                 Date VstartDate = sdf.parse(vmodel.getVstart());
                 Date VendDate = sdf.parse(vmodel.getVlast());
                 
        		 
        		 v.setType(vmodel.getType());
        		 v.setFaculty(vmodel.getFaculty());
        		 v.setDepartment(vmodel.getDepartment());
        		 v.setPostAppliedFor(vmodel.getPostAppliedFor());
        		 v.setVstart(VstartDate);
        		 v.setVlast(VendDate);
        		 
        		 v.setUser(user);
        		 vacancyRepo.save(v);
        		 res=new ApiResponse(true,"Data Uploaded Successfully",v);
        		
        	 }
        	 else {
        		 res = new ApiResponse(false, "Personal information not found for the user");
             }
         }
        
         
         
		}catch (Exception e) {
            System.err.println(e.getMessage());
            res = new ApiResponse(false, "Data not updated");
        }
		
		return res;
	}

	public List<Application> getAllApplication() {
		
		return applicationRepo.findAll();
	}

	public List<Application> getVacancyApplication(Integer vId) {
		Optional<Vacancy> vac=  vacancyRepo.findById(vId);
		Vacancy v=vac.get();
		
		return applicationRepo.findByVacancy(v);
		
	}

	public List<Vacancy> getMyvacanciesApplications() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User)principal;
		List<Vacancy> vac=vacancyRepo.findAllByUser(user);
		
		
		return vac;
	}

	

}
