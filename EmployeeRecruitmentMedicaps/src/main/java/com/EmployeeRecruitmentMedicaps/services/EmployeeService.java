package com.EmployeeRecruitmentMedicaps.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.entities.Education;
import com.EmployeeRecruitmentMedicaps.entities.Experience;
import com.EmployeeRecruitmentMedicaps.entities.Journal;
import com.EmployeeRecruitmentMedicaps.entities.PersonalInformation;
import com.EmployeeRecruitmentMedicaps.entities.PhdEducation;
import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.entities.Vacancy;
import com.EmployeeRecruitmentMedicaps.models.EducationDetailsModel;
import com.EmployeeRecruitmentMedicaps.models.ExperienceModel;
import com.EmployeeRecruitmentMedicaps.models.JournalDetailsModel;
import com.EmployeeRecruitmentMedicaps.models.OptionalPersonal;
import com.EmployeeRecruitmentMedicaps.models.PHDdetailsModel;
import com.EmployeeRecruitmentMedicaps.models.PersonalDetailsModel;
import com.EmployeeRecruitmentMedicaps.repositories.EducationRepository;
import com.EmployeeRecruitmentMedicaps.repositories.ExperienceRepository;
import com.EmployeeRecruitmentMedicaps.repositories.JournalRepository;
import com.EmployeeRecruitmentMedicaps.repositories.PHDRepository;
import com.EmployeeRecruitmentMedicaps.repositories.PersonalRepo;
import com.EmployeeRecruitmentMedicaps.repositories.UserRepository;

@Service
public class EmployeeService {
	@Autowired
	public EducationRepository educationRepo;
	
	@Autowired
	public PHDRepository phdRepo;
	@Autowired
    public PersonalRepo personalRepo;
	
	@Autowired
	public JournalRepository journalRepo;
	
	@Autowired
    private ExperienceRepository experienceRepository;
	
	@Autowired
    private UserRepository userRepo;
	
	
	ApiResponse res =null;
	public ApiResponse savePersonal(PersonalDetailsModel model) { 
		
		try {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user = (User)principal;
			user.setName(model.getName());
			user.setNumber(model.getPhone());
			userRepo.save(user);
			
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
            user.setName(model.getName());
			user.setNumber(model.getPhone());
			userRepo.save(user);

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
                    

                    pi.setUser(user);
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
    
    public ApiResponse updateEducation(@RequestParam("educationId") Integer eId,EducationDetailsModel emodel,Model model) {
    	try
    	{
    		Optional<Education> edu = educationRepo.findById(eId);
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    		Date c = sdf.parse(emodel.getPassing_year());
    		 if (edu != null) 
    		 {
    			 Education e = edu.get();
    			 if(emodel.getField_of_study()!=null)
    			 {
    				 e.setInstitutionName(emodel.getSchool_name());
    		          e.setCompletionYear(c);
    		          e.setCourseType(emodel.getCourseType());
    		          e.setEducationClass(emodel.getBoard_name());
    		          e.setFieldOfStudy(emodel.getField_of_study());
    		          
    				 
    			 }
    			 else
    			 {
    				 e.setInstitutionName(emodel.getSchool_name());
    		          e.setCompletionYear(c);
    		          e.setCourseType(emodel.getCourseType());
    		          e.setEducationClass(emodel.getBoard_name());
    				 
    			 }
    	          educationRepo.save(e);
    	          res = new ApiResponse(true, "Education Data updated successfully");
    	          }
    		 else
    		 {
    			 res = new ApiResponse(true, "Education Data not found");
    		 }
    	}
    	
    		 catch(Exception e) {
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
	        	return res = new ApiResponse(true, "Education present", education);
	        }
	        else
	        {
	        	return res = new ApiResponse(false, "Education not present");
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
               
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date p = sdf.parse(model.getPassing_year());
                
                if(model.getField_of_study() !=null)
                {
Education  education = new Education(model.getSchool_name(),model.getBoard_name(),p, model.getPercentage(), model.getCourseType(), personalInformation);
                educationRepo.save(education);
                personalInformation.getEducations().add(education);
                
                }
                else {
                Education	educatio= new Education(model.getSchool_name(), model.getBoard_name(),p, model.getPercentage(),  model.getField_of_study(),model.getCourseType(), personalInformation);
                	educationRepo.save(educatio);
                	  personalInformation.getEducations().add(educatio);
                      
                    
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



	
	public ApiResponse fetchPHDByPersonalInformationId(Integer personalid) {
		List<PhdEducation> PHDeducation = phdRepo.findByPersonalInformationId(personalid);
        boolean status = !PHDeducation.isEmpty();
        
        if(status==true)
        {
        	return res = new ApiResponse(true, "PHD is Present", PHDeducation);
        }
        else
        {
        	return res = new ApiResponse(false, "experience not present");
        }
	}


	public ApiResponse savePHDeducation(PHDdetailsModel model) {
		try {
            // Get the authenticated user
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            User user = (User) principal;

            Optional<PersonalInformation> op = personalRepo.findByUser(user);

            
            if (op.isPresent())
            {
                PersonalInformation personalInformation = op.get();
               
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date s = sdf.parse(model.getPhD_year_of_passing());
                
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
                Date e = sdf1.parse(model.getJoiningYear());
                
                if(model.getPhDSummary() !=null)
                {
                PhdEducation phd=new PhdEducation(model.getPhDInstitution_name(), model.getPhD_Thesis_topic(), model.getPercentage(), model.getPhD_Field_name(), s, e, model.getPhD_Supervisor_name(),  model.getPhDSummary(), personalInformation);
                phdRepo.save(phd);
                personalInformation.getPhd().add(phd); 
                }
                else {
                PhdEducation phd1= new PhdEducation(model.getPhDInstitution_name(), model.getPhD_Thesis_topic(), model.getPercentage(), model.getPhD_Field_name(),s ,e , model.getPhD_Supervisor_name(), personalInformation);
                
                		phdRepo.save(phd1);
                	  personalInformation.getPhd().add(phd1);
                      
                    
                }
              
                                
                personalRepo.save(personalInformation);
                res= new ApiResponse(true, "PHD details saved successfully");
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



	public ApiResponse fetchJournalsByPersonalInformationId(Integer personalid) {
		List<Journal> journal = journalRepo.findByPersonalInformationId(personalid);
        boolean status = !journal.isEmpty();
        
        if(status==true)
        {
        	return res = new ApiResponse(true, "PHD is Present", journal);
        }
        else
        {
        	return res = new ApiResponse(false, "experience not present");
        }
	}



	public ApiResponse saveJournal(JournalDetailsModel model) {
		try {
            // Get the authenticated user
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            User user = (User) principal;

            Optional<PersonalInformation> op = personalRepo.findByUser(user);

            
            if (op.isPresent())
            {
                PersonalInformation personalInformation = op.get();
               
                SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
                Date f = sdf3.parse(model.getYear());
                
                Journal journal= new Journal(model.getPublicationTitle(),model.getJournalName(), model.getVolume(), model.getIndexing(), f, personalInformation);
                journalRepo.save(journal);
                personalInformation.getJournals().add(journal);
                               
                personalRepo.save(personalInformation);
                res= new ApiResponse(true, "Journal details saved successfully");
    }
                else 
                {
                    res = new ApiResponse(false, "Journal information of user not found ");
                }
               
            

        } catch (Exception e) {
            System.err.println(e.getMessage());
            res = new ApiResponse(false, "Data not updated");
        }

        return res;

	}



	



	
	
	
	

	
	
}
