package com.EmployeeRecruitmentMedicaps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.EmployeeRecruitmentMedicaps.models.OtpVerifyModel;
import com.EmployeeRecruitmentMedicaps.models.UserRegistrationModel;
import com.EmployeeRecruitmentMedicaps.services.*;

import com.EmployeeRecruitmentMedicaps.Utils.*;
import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.entities.Vacancy;
import com.EmployeeRecruitmentMedicaps.entities.Otp;

@Controller
@RequestMapping("/medicaps")
public class medicaps {
	
	@Autowired
	public UserService userService;
	
	@Autowired
	public VacancyService vacancyService;
	
	public Boolean status;
	
	@Autowired
	public OtpService otpService;
	@RequestMapping(value="/user_reg")
	public String signUp(UserRegistrationModel model, ModelMap map,Model m) {
		m.addAttribute("mail",model.getEmail());
		//m.addAttribute("status", res)
	
		ApiResponse res = null;
		 res= userService.saveUser(model);
		if (res.getStatus())
		{
			status = res.getStatus();
			m.addAttribute("status", status);
			return "successful";
		}
			
		else
			return "dummy";
		
	}
	
	@RequestMapping(value="/verifyOtp")
	public String checkOtp(OtpVerifyModel model,Model m)
	{
		ApiResponse res = null;
		res = otpService.checkUser(model);
		// res= otpService.checkUser(model);
		 System.out.println(res.getStatus());
		 if(res.getStatus())
			 return "login";
		 else
		 {
			 m.addAttribute("verify", res.getMessage());
			 return "successful";
		 }
			 

		
		
	}
	
	@RequestMapping(value ="/register")
	public String registerPage()
	{
		return "register";
		
	}
	@RequestMapping(value ="/loginpage")
	public String loginPage()
	{
		return "login";
		
	}
	
	@RequestMapping(value = "/login")	
	public String login(ModelMap model, String error, String logout) 
	{
		System.out.println(error);
		if (error != null)
		{
			System.err.println(error);
			model.addAttribute("errorMsg", "Your username and password are invalid.");
			
		}
		if (logout != null)
			model.addAttribute("msg", "You have been logged out successfully.");

		return "login";
	}
	
	/*@RequestMapping(value = "/home")	
	public String home(ModelMap map) 
	{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User)principal;
		System.out.println(user);
		return "loginSuccessful";
	}
	*/
	@RequestMapping("/logout")
	public String logout() {
		return "redirect:/medicaps/login";
	}
	
	@RequestMapping(value = "/home")	
	public String home(ModelMap map,Model model) 
	{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User)principal;
		System.out.println(user);
		
		System.out.println(user.getRole());
		if(user.getActiveStatus()== true)
		{
			if(user.getRole().equals("ROLE_USER"))
				return "loginSuccessful";
			else if(user.getRole().equals("ROLE_ADMIN"))
				return "/admin/adminHome";
			
			else
				return "register";
		}
		else
		{
			model.addAttribute("mail", user.getEmail());
			userService.sendOtp(user.getEmail(), user);
			return "successful";
		     // model.addAttribute("status", "Email Already Exist,please verify the otp");
			
		      
		}
		
	}
	
	@RequestMapping("/vacancies")
    public String getAllVacancies(Model model) {
        List<Vacancy> vacancies = vacancyService.getAllVacancies();
        model.addAttribute("vacancies", vacancies);
        return ""
        		+ "vacancies";
    }
	

}
