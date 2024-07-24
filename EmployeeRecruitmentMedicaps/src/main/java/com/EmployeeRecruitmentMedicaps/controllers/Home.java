package com.EmployeeRecruitmentMedicaps.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.models.UpdatePasswordModel;
import com.EmployeeRecruitmentMedicaps.repositories.UserRepository;
import com.EmployeeRecruitmentMedicaps.services.UserService;

@Controller
@RequestMapping("/home")
public class Home {
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserRepository userRepo;
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
	
	@RequestMapping(value ="/forget_pass")
	public String updatePassword( UpdatePasswordModel model,Model m )
	{
		Optional<User> op=userRepo.findByEmail(model.getEmail());
		if(op.isPresent())
		{
			User user = op.get();
			ApiResponse response= userService.sendOtp(model.getEmail(),user);
			if (response.getStatus())
				return "otp";
			else
				return "email";
		}
		else{
			ApiResponse response=  new ApiResponse(false, "email not found !");
			m.addAttribute("error", response.getMessage());
			return "email";

		}
		
			
	}
	

}
