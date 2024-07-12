package com.EmployeeRecruitmentMedicaps.controllers;

import java.util.List;
import java.util.Optional;

import org.eclipse.jetty.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.EmployeeRecruitmentMedicaps.models.OtpVerifyModel;
import com.EmployeeRecruitmentMedicaps.models.UserRegistrationModel;
import com.EmployeeRecruitmentMedicaps.repositories.UserRepository;
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
	@Autowired
	public UserRepository userRepo;
	
	public Boolean status;
	
	@Autowired
	public OtpService otpService;
	
	@RequestMapping(value="/user_reg")
	public String signUp(UserRegistrationModel model, ModelMap map,Model m) {
		m.addAttribute("mail",model.getEmail());
		//m.addAttribute("status", res)
	
		ApiResponse res = null;
		//if()
		Optional<User> op = userRepo.findByEmail(model.getEmail());
		if(op.isPresent())
		{
			m.addAttribute("response", "Email Already Registered,Please Login!");
			return "registration";
		}
		else
		{
			 res= userService.saveUser(model);
				if (res.getStatus())
				{
					status = res.getStatus();
					m.addAttribute("status", status);
					return "successful";
				}
					
				else
				{
					m.addAttribute("msg", res.getMessage());
					return "registration";
				}
					//return "dummy";
		}
		
		
	}
	
	
	
	@RequestMapping(value="/verifyOtp")
	public String checkOtp(OtpVerifyModel model,Model m)
	{
		ApiResponse res = null;
			String mail = model.getMail();
			m.addAttribute("mail", mail);
		res = otpService.checkUser(model,mail);
		// res= otpService.checkUser(model);
		 System.out.println(res.getStatus());
		 if(res.getStatus())
			 return "userPanel";
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

		return "logins";
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
				return "/userPanel";
			else if(user.getRole().equals("ROLE_ADMIN"))
				return "/admin/adminHome";
			
			else
				return "register";
		}
		else
		{
			System.out.println("else block");
			System.out.println(user);
			ApiResponse res=null;
			model.addAttribute("mail", user.getEmail());
		res =	userService.sendOtp(user.getEmail(), user);
		if(res.getStatus()== true)
		{
			System.out.println(user);
			return "successful";
		}
			
		else 
			return "dummy";
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
