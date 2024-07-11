package com.EmployeeRecruitmentMedicaps.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.entities.PersonalInformation;
import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.models.OptionalPersonal;
import com.EmployeeRecruitmentMedicaps.models.PersonalDetailsModel;
import com.EmployeeRecruitmentMedicaps.repositories.PersonalRepo;
import com.EmployeeRecruitmentMedicaps.services.EmployeeService;
import com.EmployeeRecruitmentMedicaps.services.UserService;

@Controller
@RequestMapping("/user")
public class user { 
	@Autowired
	public EmployeeService empService;
	
	@Autowired
	public PersonalRepo personalRepo;
	
	int vid;
	
	ApiResponse res = null;
	
	@RequestMapping(value ="/user_panel")
	public String registerPage()
	{
		return "user_panel";
		
	}
	
	@RequestMapping(value ="/apply")
	public String apply(@RequestParam("vacancyId") int vacancyId,Model model)
	{
		vid = vacancyId;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User)principal;
		
		Optional<PersonalInformation> op = personalRepo.findByUser(user);
        if (op.isPresent()) {
            PersonalInformation p = op.get();
            res = new ApiResponse(true, "data present",p);
        }
        else
        {
        	 res = new ApiResponse(false, "data not present");
        }
        model.addAttribute("res", res);
		return "dummy";
		
	}
	
	@RequestMapping(value="/personalDetails")
	public void personalDetails(PersonalDetailsModel model)
	{
		
		ApiResponse res = empService.savePersonal(model);
		
	}
	@RequestMapping(value="/saveResearch")
	public void optionalPersonal(OptionalPersonal model)
	{
		
		 empService.saveResearcherDataForUser(model);
		
		
	
	}

	
}