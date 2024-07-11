package com.EmployeeRecruitmentMedicaps.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.entities.PersonalInformation;
import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.models.OptionalPersonal;
import com.EmployeeRecruitmentMedicaps.models.PersonalDetailsModel;
import com.EmployeeRecruitmentMedicaps.repositories.PersonalRepo;

@Service
public class EmployeeService {

	@Autowired
    public PersonalRepo personalRepo;
	
	ApiResponse res =null;
	public ApiResponse savePersonal(PersonalDetailsModel model) { 
		
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
                
                res = new ApiResponse(true, "data Saved",pi);
            }
			
			
			
            
		catch(Exception e) {
			System.err.println(e.getMessage());
			res = new ApiResponse(false, "data not Saved");
			
		}
		return res;	
	}
	
	public void saveResearcherDataForUser(OptionalPersonal model) {  
		
		try {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user = (User)principal;
			
			 Optional<PersonalInformation> op = personalRepo.findByUser(user);
	            if (op.isPresent()) {
	                PersonalInformation pi = op.get();
	                
	                // Update the fields in the PersonalInformation object
	                if (model.getResearcherId() != null) {
	                    pi.setResearcherId(model.getResearcherId());
	                }
	                if (model.getScopusId() != null) {
	                    pi.setScopusId(model.getScopusId());
	                }
	                if (model.getOrcid() != null) {
	                    pi.setOrcid(model.getOrcid());
	                }

	                // Save the updated PersonalInformation object
	                personalRepo.save(pi);
	            } else {
	                System.out.println("Personal information not found for the user");
	            }
	        } catch (Exception e) {
	            System.err.println(e.getMessage());
	        }
	}

	
	
}
