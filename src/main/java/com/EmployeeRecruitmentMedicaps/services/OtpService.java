package com.EmployeeRecruitmentMedicaps.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.entities.*;
import com.EmployeeRecruitmentMedicaps.models.OtpVerifyModel;
import com.EmployeeRecruitmentMedicaps.repositories.OtpRepo;

@Service
public class OtpService {

	@Autowired
	private OtpRepo otpRepo;
	
	@Autowired
	private UserService userService;

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
	
	
	
	public ApiResponse checkUser(OtpVerifyModel model) {
		ApiResponse response = null;
		User user = userService.findByEmail(model.getMail());
		if(user!=null){
			Otp otp = findByUser(user);	
			if(otp!=null){
				Boolean b = otp.getOtpNumber().matches(model.otp);
				if(b){
					 response  = new ApiResponse(true, "OTP is Correct !");
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