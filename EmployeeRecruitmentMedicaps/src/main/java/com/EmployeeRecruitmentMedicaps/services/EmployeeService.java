package com.EmployeeRecruitmentMedicaps.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.entities.Education;
import com.EmployeeRecruitmentMedicaps.entities.Experience;
import com.EmployeeRecruitmentMedicaps.entities.PersonalInformation;
import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.models.EducationDetailsModel;
import com.EmployeeRecruitmentMedicaps.models.ExperienceModel;
import com.EmployeeRecruitmentMedicaps.models.OptionalPersonal;
import com.EmployeeRecruitmentMedicaps.models.PersonalDetailsModel;
import com.EmployeeRecruitmentMedicaps.repositories.EducationRepository;
import com.EmployeeRecruitmentMedicaps.repositories.ExperienceRepository;
import com.EmployeeRecruitmentMedicaps.repositories.PersonalRepo;

@Service
public class EmployeeService {

	public EducationRepository educationRepo;
	@Autowired
    public PersonalRepo personalRepo;
	
	@Autowired
    private ExperienceRepository experienceRepository;
	
	
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
	

   
    public ApiResponse updatePersonalDetails( PersonalDetailsModel model) {
        

        try {
            // Get the authenticated user
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            User user = (User) principal;

            Optional<PersonalInformation> op = personalRepo.findByUser(user);
            if (op.isPresent()) {
                PersonalInformation pi = op.get();
                if (pi != null) {
                    // Update the personal information fields
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date dob = sdf.parse(model.getDob());

                    if (model.getExamQualified() != null)
                    {
                    	pi.setAlternatePhoneNumber(model.getAlternatePhoneNumber());
                        pi.setDob(dob);
                        pi.setGender(model.getGender());
                        pi.setCaste(model.getCaste());
                        pi.setAddress(model.getAddress());
                        pi.setPincode(model.getPincode());
                        pi.setDistrict(model.getDistrict());
                        pi.setState(model.getState());
                        pi.setCountry(model.getCountry());
                        pi.setExamQualified(model.getExamQualified());
                    }
                    else
                    {
                    	pi.setAlternatePhoneNumber(model.getAlternatePhoneNumber());
                        pi.setDob(dob);
                        pi.setGender(model.getGender());
                        pi.setCaste(model.getCaste());
                        pi.setAddress(model.getAddress());
                        pi.setPincode(model.getPincode());
                        pi.setDistrict(model.getDistrict());
                        pi.setState(model.getState());
                        pi.setCountry(model.getCountry());
                    }
                    

                    // Save the updated personal information
                    personalRepo.save(pi);

                    res = new ApiResponse(true, "Data updated successfully", pi);
                } else {
                    res = new ApiResponse(false, "Personal information not found for the user");
                }
                //res = new ApiResponse(true, "data present",p);
            }
            // Find the existing personal information by user
           // PersonalInformation pi = personalRepo.findByUser(user);

            

        } catch (Exception e) {
            System.err.println(e.getMessage());
            res = new ApiResponse(false, "Data not updated");
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
	
	public ApiResponse fetchExperiencesByPersonalInformationId(Integer personalInformationId) {
        List<Experience> experiences = experienceRepository.findByPersonalInformationId(personalInformationId);
        boolean status = !experiences.isEmpty();
        
        if(status==true)
        {
        	return res = new ApiResponse(true, "experience present", experiences);
        }
        else
        {
        	return res = new ApiResponse(false, "experience not present");
        }
      
    }



	public ApiResponse saveExperience(ExperienceModel model) {
		
		try {
            // Get the authenticated user
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            User user = (User) principal;

            Optional<PersonalInformation> op = personalRepo.findByUser(user);
            if (op.isPresent())
            {
                PersonalInformation personalInformation = op.get();
                Experience experience;
                if (model.getEndDate() != null)
                {
                    experience = new Experience(model.getJobTitle(), model.getInstituteName(), model.getStartDate(), model.getEndDate(), personalInformation);
                }
                
                else 
                {
                    experience = new Experience(model.getJobTitle(), model.getInstituteName(), model.getStartDate(), personalInformation);
                }
                personalInformation.getExperiences().add(experience);
                // Save the experience entity
                experienceRepository.save(experience);
                // Save the personal information entity (if needed to persist the list change)
                personalRepo.save(personalInformation);
                
                res = new ApiResponse(true, "Data updated successfully");

                    }
                else 
                {
                    res = new ApiResponse(false, "Personal information of user not found ");
                }
               
            

        } catch (Exception e) {
            System.err.println(e.getMessage());
            res = new ApiResponse(false, "Data not updated");
        }

        return res;
    
	}


	private Date convertStringToDate(String dateStr) throws ParseException {
        return new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
    }
	
	public ApiResponse fetchEducationsByPersonalInformationId(Integer personalid) {
		 List<Education> education = educationRepo.findByPersonalInformationId(personalid);
	        boolean status = !education.isEmpty();
	        
	        if(status==true)
	        {
	        	return res = new ApiResponse(true, "experience present", education);
	        }
	        else
	        {
	        	return res = new ApiResponse(false, "experience not present");
	        }
	}
	public ApiResponse saveEducation(EducationDetailsModel model) {
		try {
            // Get the authenticated user
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            User user = (User) principal;

            Optional<PersonalInformation> op = personalRepo.findByUser(user);

            
            if (op.isPresent())
            {
                PersonalInformation personalInformation = op.get();
                Education education;
                Education education10 = new Education(model.getSchool_name10(),model.getBoard_name10(), convertStringToDate(model.getPassing_year10()), model.getPercentage10(), "School", personalInformation);
                educationRepo.save(education10);

                // Save 12th details
                Education education12 = new Education(model.getSchool_name12(),model.getBoard_name12(), convertStringToDate(model.getPassing_year12()), model.getPercentage12(), model.getField_of_study12(), "School", personalInformation);
                educationRepo.save(education12);

                // Save Diploma details (if provided)
                if (model.getDiplomaInstitutionName() != null) {
                    Education diploma = new Education(model.getDiplomaInstitutionName(),model.getDiploma_name(), convertStringToDate(model.getDiplomaCompletionYear()), model.getDiplomaPercentage(), model.getDiplomaFieldOfStudy(), "Diploma", personalInformation);
                    educationRepo.save(diploma);
                }

                // Save UG details
                Education educationUG = new Education(model.getUGInstitution_name(), model.getUGDegree_name(), convertStringToDate(model.getPassing_yearUG()), model.getPercentage_UG(), model.getUGField_name(), "UG", personalInformation);
                educationRepo.save(educationUG);

                // Save PG details
                Education educationPG = new Education(model.getPGInstitution_name(), model.getPGDegree_name(), convertStringToDate(model.getPassing_yearPG()), model.getPercentage_PG(), model.getPGField_name(), "PG", personalInformation);
                educationRepo.save(educationPG);

                // Save second PG details (if provided)
                if (model.getSecondPGInstitution_name() != null) {
                    Education secondPG = new Education(model.getSecondPGInstitution_name(), model.getSecondPGDegree_name(), convertStringToDate(model.getPassing_yearSecondPG()), model.getPercentage_SecondPG(), model.getSecondPGField_name(), "PG2", personalInformation);
                    educationRepo.save(secondPG);
                }

                // Save PhD details (if provided)
                if (model.getPhDInstitution_name() != null) {
                    Education phd = new Education(model.getPhDInstitution_name(), "PhD", convertStringToDate(model.getPhD_year_of_passing()), "", model.getPhD_Field_name(), "PhD", personalInformation);
                    educationRepo.save(phd);
                }
                
                personalRepo.save(personalInformation);
                res= new ApiResponse(true, "Education details saved successfully");
    }
                else 
                {
                    res = new ApiResponse(false, "Personal information of user not found ");
                }
               
            

        } catch (Exception e) {
            System.err.println(e.getMessage());
            res = new ApiResponse(false, "Data not updated");
        }

        return res;
	}



	
	
	
	

	
	
}
