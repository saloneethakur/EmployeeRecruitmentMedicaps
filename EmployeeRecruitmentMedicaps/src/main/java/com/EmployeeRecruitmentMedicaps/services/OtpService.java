package com.EmployeeRecruitmentMedicaps.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.entities.*;
import com.EmployeeRecruitmentMedicaps.models.OtpVerifyModel;
import com.EmployeeRecruitmentMedicaps.repositories.OtpRepo;
import com.EmployeeRecruitmentMedicaps.repositories.UserRepository;

@Service
public class OtpService {

	@Autowired
	private OtpRepo otpRepo;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserRepository userRepo;

	public Otp findByUser(User user) {
		Optional<Otp> obj = otpRepo.findByUser(user);
		if(obj.isPresent())
			return obj.get();
		else
			return null;
	}

	public void deleteOtp(Otp otp) {
		otpRepo.delete(otp);		
	}
	
	
	
	public ApiResponse checkUser(OtpVerifyModel model,String mail) {
		ApiResponse response = null;
		User user = userService.findByEmail(mail);
		if(user!=null){
			Otp otp = findByUser(user);	
			if(otp!=null){
				Boolean b = otp.getOtpNumber().matches(model.otp);
				if(b){
					 response  = new ApiResponse(true, "OTP is Correct !");
					 user.setActiveStatus(true);
					 userRepo.save(user);
					 
					 System.out.println(response);
					if(response.getStatus())
						return response;
					
					
				}
				else{
					 response  = new ApiResponse(false, "OTP is Not Correct !");
					 return response;
					
				}
			}
			else{
				 response  = new ApiResponse(false, "User not Present !");
				 return response;
				
				}
			}
		else{
			 response  = new ApiResponse(false, "User not found !");
			 
		}
		return response;
		
		
	}


}