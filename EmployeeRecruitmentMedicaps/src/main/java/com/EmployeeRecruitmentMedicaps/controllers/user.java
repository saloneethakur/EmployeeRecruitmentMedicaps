package com.EmployeeRecruitmentMedicaps.controllers;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.entities.Experience;
import com.EmployeeRecruitmentMedicaps.entities.PersonalInformation;
import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.models.ExperienceModel;
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
	int personalid;
	
	ApiResponse res = null;
	
	@RequestMapping(value ="/user_panel")
	public String registerPage()
	{
		return "user_panel";
		
	}
	
	@RequestMapping(value ="/vacanciespage")
	public String vacancyPage()
	{
		return "vacancies";
		
	}
	
	@RequestMapping(value ="/apply")
	public String apply(@RequestParam("vacancyId") int vacancyId,Model model)
	{
		vid = vacancyId;
		System.out.println(vid);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User)principal;
		
		Optional<PersonalInformation> op = personalRepo.findByUser(user);
        if (op.isPresent()) {
        	
            PersonalInformation p = op.get();
            personalid = p.getId();
            res = new ApiResponse(true, "data present",p);
        }
        else
        {
        	 res = new ApiResponse(false, "data not present");
        }
        model.addAttribute("res", res);
		return "/user/personal";
		
	}
	
	@RequestMapping(value="/personalDetails")
	public void personalDetails(PersonalDetailsModel model)
	{
		
		ApiResponse res = empService.savePersonal(model);
		
		
	}
	
	@RequestMapping(value="/updatepersonalDetails")
	public void updatepersonalDetails(PersonalDetailsModel model)
	{
		
		ApiResponse res = empService.updatePersonalDetails(model);
		
	}
	@RequestMapping(value="/saveResearch")
	public void optionalPersonal(OptionalPersonal model)
	{
		 empService.saveResearcherDataForUser(model);
	
	}
	
	@RequestMapping(value="/checkExperience")
	public String checkexperience(Model m)
	{
		
	     res =	empService.fetchExperiencesByPersonalInformationId(personalid); 
	     m.addAttribute("res", res);
	     
	     if (res.getStatus()== true)
	     {
	         List<Experience> experiences = (List<Experience>) res.getData();
	         int totalYears = 0;

	         for (Experience exp : experiences) {
	             Date end = (exp.getEndDate() == null) ? new Date() : exp.getEndDate();
	             long diffInMillies = Math.abs(end.getTime() - exp.getStartDate().getTime());
	             long diff = diffInMillies / (1000L * 60 * 60 * 24 * 365);
	             totalYears += diff;
	      }

	         m.addAttribute("totalYears", totalYears);
	     }
	     return "/user/experience";
	
	}
	@RequestMapping(value="/saveExperience")
	public void experience(ExperienceModel model)
	{
		ApiResponse res = empService.saveExperience(model);
	
	}

	
}