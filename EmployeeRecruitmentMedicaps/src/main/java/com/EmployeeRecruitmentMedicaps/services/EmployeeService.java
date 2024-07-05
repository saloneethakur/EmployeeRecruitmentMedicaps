package com.EmployeeRecruitmentMedicaps.services;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.entities.PersonalInformation;
import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.models.PersonalDetailsModel;
import com.EmployeeRecruitmentMedicaps.repositories.PersonalRepo;

@Service
public class EmployeeService {

	@Autowired
    public PersonalRepo personalRepo;
	public void savePersonal(PersonalDetailsModel model) {  
		try {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user = (User)principal;
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dob = sdf.parse(model.getDob());
			
			PersonalInformation pi;
            if (model.getExamQualified() != null) {
                pi = new PersonalInformation(
                    model.getAlternatePhoneNumber(),
                    dob,
                    model.getGender(),
                    model.getCaste(),
                    model.getAddress(),
                    model.getPincode(),
                    model.getDistrict(),
                    model.getState(),
                    model.getCountry(),
                    model.getExamQualified()
                );
            } else {
                pi = new PersonalInformation(
                    model.getAlternatePhoneNumber(),
                    dob,
                    model.getGender(),
                    model.getCaste(),
                    model.getAddress(),
                    model.getPincode(),
                    model.getDistrict(),
                    model.getState(),
                    model.getCountry()
                );
            }
            
            // Associate the user with the PersonalInformation
            pi.setUser(user);
            
            personalRepo.save(pi);
            
            
		}
		catch(Exception e) {
			System.err.println(e.getMessage());
			
		}
		
		
		
	}

	
	
}
