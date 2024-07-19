package com.EmployeeRecruitmentMedicaps.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.models.UserRegistrationModel;
import com.EmployeeRecruitmentMedicaps.models.VacancyModel;
import com.EmployeeRecruitmentMedicaps.services.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	public AdminService adminService;
	
	@RequestMapping(value="/addVacancy")
	public String addvacancy(VacancyModel model, ModelMap map,Model m) {
		System.out.println("admin add vacancy enter");
		ApiResponse res = null;
		res=adminService.addVacancy(model);
		
		System.out.println(res.getStatus());
		if (res.getStatus())
			return "vacancyDemo";
		else
			return "dummy";
		
	}
	

	@RequestMapping(value="/home")
	public String home() {
		
			return "/admin/adminHome";
		
	}
	
	@RequestMapping(value="/vacancy")
	public String homee() {
		
			return "/admin/vacancy";
		
	}
	
	@RequestMapping(value="/updateVacancy")
	public void updateVacancy(@RequestParam("id") Integer id ,VacancyModel vmodel)
	{
		ApiResponse res = adminService.updateVacancy(id,vmodel);
		
	}

}
