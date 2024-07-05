package com.EmployeeRecruitmentMedicaps.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class Home {
	
	@RequestMapping(value ="/home1")
	public String registerPage()
	{
		return "home";
		
	}
	
	@RequestMapping(value ="/registration")
	public String registrationPage()
	{
		return "registration";
		
	}
	
	@RequestMapping(value ="/logins")
	public String loginPage()
	{
		return "logins";
		
	}
	

}
