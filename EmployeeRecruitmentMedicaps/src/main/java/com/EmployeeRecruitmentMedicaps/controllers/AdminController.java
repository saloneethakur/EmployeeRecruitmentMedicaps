package com.EmployeeRecruitmentMedicaps.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.entities.Application;
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
	
	@GetMapping("/viewAllApplication")
    public String displayItems(Model model) {
        List<Application> application = adminService.getAllApplication();
       
        model.addAttribute("application", application);
        return "/admin/viewAllApplication";
    }
	@RequestMapping(value="/viewvVacancyApplication")
	public String viewVacancyApplication(@RequestParam("vId") Integer vId,Model m) {
		List<Application> application = adminService.getVacancyApplication(vId);
        m.addAttribute("application", application);
			
		
		return "/admin/viewVacancyApplication";
		
	}
	
	@RequestMapping(value ="/viewMyVacanciesApplications")
	public String viewMyVacanciesApplications(Model m)
	{
		List<Vacancy> vacancy= adminService.getMyvacanciesApplications();
		m.addAttribute("My vacancy",vacancy);
		
		return "/admin/viewMyVacanciesApplication";
	}
	

}
