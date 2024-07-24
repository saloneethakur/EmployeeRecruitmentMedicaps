package com.EmployeeRecruitmentMedicaps.services;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.entities.Otp;
import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.models.UserRegistrationModel;
import com.EmployeeRecruitmentMedicaps.repositories.OtpRepo;
import com.EmployeeRecruitmentMedicaps.repositories.UserRepository;



@Service
public class UserService implements UserDetailsService{
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private OtpService otpService;
	
	@Autowired
	private OtpRepo otprepo;
	
	
	

	@Autowired
	private MailService mailService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
         
		UserDetails user = userRepo.findByEmail(username).get();
		return user;
	}

	public ApiResponse saveUser(UserRegistrationModel model) {
		ApiResponse response = null;
		ApiResponse res = null;
		try {
			User user = new User(model.getName(),model.getEmail(),encoder.encode(model.getPassword()),"ROLE_USER",false,model.getNumber());
			
			if(user != null) {
				user = userRepo.save(user);
				
				response = new ApiResponse(true, "USER Saved !");
				res = sendOtp(model.getEmail(), user);
				if(res.getStatus())
				{
	
					
					return res;
					
				}
			}
			else {
				response = new ApiResponse(false, "User Registeration Failed !");
			}
		}
		catch (Exception e) {
			System.err.println(e.getMessage());
			response = new ApiResponse(false, "User Registeration Failed ", e.getMessage());
		}		
		return response;
	}
	
	public ApiResponse sendOtp(String email, User user) {
		Optional<User> op=userRepo.findByEmail(email);
		if(op.isPresent())
		{
			ApiResponse response = null;
			Otp ob = null;
			boolean status;
			try
			{
				Random random = new Random();
				
				int number = 100000 + random.nextInt(900000);
				String ot=String.valueOf(number);			
				Otp otp = otpService.findByUser(user);
				
				if(otp!=null)
				{
					otp.setOtpNumber(ot);
					otprepo.save(otp);
					status = true;
					mailService.verificationMail(email, ot);
					System.out.println("otp set");
					System.out.println(user);
					response = new ApiResponse(true, "otp set !");
				}
				else
				{
					ob = new Otp(user, ot);
					otprepo.save(ob);
					status = true;
					mailService.verificationMail(email, ot);
					response= new ApiResponse(true,"otp saved") ;
					System.out.println("otp saved");
				}
				
			}
			catch(Exception ex){	
				System.out.println(" error");
				System.out.println(user);
				System.out.println(ex.getMessage());
				response = new ApiResponse(false, "otp was not sent !", ex.getMessage());
			}
			return response;	
		}
		else
		{
			ApiResponse response =null;
			response = new ApiResponse(false, "Email Not Found!");
			return response;
		}
		
	}
	public User findByEmail(String email) 
	{
		Optional<User> obj = userRepo.findByEmail(email);
		if(obj.isPresent()) {
			return obj.get();
		}
		else {
			return null;
		}
	}
	
	

}
