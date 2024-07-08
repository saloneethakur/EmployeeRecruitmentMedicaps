package com.EmployeeRecruitmentMedicaps.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.models.OptionalPersonal;
import com.EmployeeRecruitmentMedicaps.models.PersonalDetailsModel;
import com.EmployeeRecruitmentMedicaps.services.EmployeeService;
import com.EmployeeRecruitmentMedicaps.services.UserService;

@Controller
@RequestMapping("/user")
public class user { 
	@Autowired
	public EmployeeService empService;
	
	
	@RequestMapping(value ="/user_panel")
	public String registerPage()
	{
		return "user_panel";
		
	}
	@RequestMapping(value="/personalDetails")
	public void personalDetails(PersonalDetailsModel model)
	{
		
		empService.savePersonal(model);
	}
	@RequestMapping(value="/saveResearch")
	public void optionalPersonal(OptionalPersonal model)
	{
		
		 empService.saveResearcherDataForUser(model);
		
		
	
	}

	
}
