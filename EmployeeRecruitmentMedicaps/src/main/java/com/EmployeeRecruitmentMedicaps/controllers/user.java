package com.EmployeeRecruitmentMedicaps.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
import com.EmployeeRecruitmentMedicaps.repositories.PersonalRepo;
import com.EmployeeRecruitmentMedicaps.repositories.VacancyRepository;
import com.EmployeeRecruitmentMedicaps.services.EmployeeService;
import com.EmployeeRecruitmentMedicaps.services.UserService;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/user")
public class user { 
	@Autowired
	public EmployeeService empService;
	
	@Autowired
	public PersonalRepo personalRepo;
	
	@Autowired
	public VacancyRepository vacancyRepo;
	
	@Autowired
	public EducationRepository educationRepo;
	
	Integer vid;
	Integer personalid;
	
	ApiResponse res = null;
	
	@RequestMapping(value ="/user_panel")
	public String registerPage()
	{
		return "user_panel";
		
	}
	
	@RequestMapping(value ="/vacanciespage")
	public String vacancyPage()
	{
		return "vacancies";
		
	}
	
	@RequestMapping(value ="/apply")
	public String apply(@RequestParam("vacancyId") Integer vacancyId,Model model)
	{
		vid = vacancyId;
		Optional<Vacancy> vacancy = vacancyRepo.findById(vid);
		 if (vacancy != null) 
		 {
			 Vacancy v = vacancy.get();
	            model.addAttribute("vacancy", v);
		 }
		
		System.out.println(vid);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User)principal;
		if (user != null)
		{
            model.addAttribute("user", user);
	    }
		
		
		Optional<PersonalInformation> op = personalRepo.findByUser(user);
        if (op.isPresent()) {
        	
            PersonalInformation p = op.get();
            personalid = p.getId();
            res = new ApiResponse(true, "data present",p);
        }
        else
        {
        	 res = new ApiResponse(false, "data not present");
        }
        model.addAttribute("res", res);
		return "/userfolder/personal";
		
	}
	
	@RequestMapping(value ="/Apply")
	public String apply(Model model)
	{
		
		Optional<Vacancy> vacancy = vacancyRepo.findById(vid);
		 if (vacancy != null) 
		 {
			 Vacancy v = vacancy.get();
	            model.addAttribute("vacancy", v);
		 }
		
		System.out.println(vid);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User)principal;
		if (user != null)
		{
            model.addAttribute("user", user);
	    }
		
		
		Optional<PersonalInformation> op = personalRepo.findByUser(user);
        if (op.isPresent()) {
        	
            PersonalInformation p = op.get();
            personalid = p.getId();
            res = new ApiResponse(true, "data present",p);
        }
        else
        {
        	 res = new ApiResponse(false, "data not present");
        }
        model.addAttribute("res", res);
		return "/userfolder/personal";
		
	}
	
	
	@RequestMapping(value="/personalDetails")
	public String personalDetails(PersonalDetailsModel model)
	{
		
		ApiResponse res = empService.savePersonal(model);
		return "redirect:/user/checkEducation";
		
		
	}
	
	@RequestMapping(value="/updatepersonalDetails")
	public String updatepersonalDetails(PersonalDetailsModel model)
	{
		
		ApiResponse res = empService.updatePersonalDetails(model);
		 return "redirect:/user/Apply";
		
	}
	
	
	 @RequestMapping(value="/checkEducation")
	   
	 public String checkeducation(Model m)
	    {
		 Optional<PersonalInformation> pi = personalRepo.findById(personalid);
		 if(pi.isPresent())
		 {
			 PersonalInformation personal = pi.get();
			 m.addAttribute("personalInformation", personal);
			 
		 }
		 
		 
	         
	         return "/userfolder/education";
	    }

	    @RequestMapping(value="/saveEducation")
	    public String education(EducationDetailsModel model)
	    {
	        ApiResponse response = empService.saveEducation(model);
	        return "redirect:/user/checkEducation";
	        
	    }
	    
	    @RequestMapping(value="/updateEducation")
	    public String updateEducation(@RequestParam("id") Integer eId,EducationDetailsModel model)
	    {
	    	ApiResponse res=empService.updateEducation(eId,model);
	    	return "redirect:/user/checkEducation";
	    }
	    
	    @RequestMapping(value="/deleteEducation")
	    public void deleteEducation(@RequestParam("educationId") Integer eId)
	    {
	    	ApiResponse res=empService.deleteEducation(eId);
	    }
	    
	    
	    
	    
	@RequestMapping(value="/saveResearch")
	public void optionalPersonal(OptionalPersonal model)
	{
		 empService.saveResearcherDataForUser(model);
	
	}
	
	
	
	
	
	@RequestMapping(value="/checkExperience")
	public String checkexperience(Model m)
	{
		
	     res =	empService.fetchExperiencesByPersonalInformationId(personalid); 
	     m.addAttribute("res", res);
	     
	     if (res.getStatus()== true)
	     {
	         List<Experience> experiences = (List<Experience>) res.getData();
	         int totalYears = 0;

	         for (Experience exp : experiences) {
	             Date end = (exp.getEndDate() == null) ? new Date() : exp.getEndDate();
	             long diffInMillies = Math.abs(end.getTime() - exp.getStartDate().getTime());
	             long diff = diffInMillies / (1000L * 60 * 60 * 24 * 365);
	             totalYears += diff;
	      }

	         m.addAttribute("totalYears", totalYears);
	     }
	     return "/userfolder/experience";
	
	}
	@RequestMapping(value="/saveExperience")
	public void experience(ExperienceModel model)
	{
		ApiResponse res = empService.saveExperience(model);
	
	}
	
	@RequestMapping(value = "/updateExperience")
	public void updateExperience(@RequestParam("experience_id") Integer expID,ExperienceModel model )
	{
		ApiResponse res=empService.updateExperience(expID,model);
	}
	
	@RequestMapping(value = "/deleteExperience")
	public void deleteExperience(@RequestParam("experience_id") Integer expId)
	{
		ApiResponse res=empService.deleteExperience(expId);
	}
	
	 @RequestMapping(value="/checkPHD")
	   
	 public String checkPHD(Model m)
	    {
	         res = empService.fetchPHDByPersonalInformationId(personalid); 
	         m.addAttribute("res", res);
	         
	         

	         if (res.getStatus() == true)
	         {
	             List<PhdEducation> phdEducation = (List<PhdEducation>) res.getData();
	             m.addAttribute("phdEducation", phdEducation);
	         }
	         return "/user/phdEducation";
	    }

	    @RequestMapping(value="/savePHDeducation")
	    public void PHDeducation(PHDdetailsModel model)
	    {
	        ApiResponse res = empService.savePHDeducation(model);
	    }
	    
	    @RequestMapping(value = "/updatePHD")
	    public void updatePHD(@RequestParam("id") Integer phdId,PHDdetailsModel model)
	    {
	    	ApiResponse res=empService.updatePHD(phdId,model);
	    }
	    
	    @RequestMapping(value="/deletePHD")
	    public void deletePHD(@RequestParam("id")Integer pId)
	    {
	    	ApiResponse res=empService.deletePHD(pId);
	    }
	    
	    
	    
	    @RequestMapping(value="/checkJournal")
		public String checkJournal(Model m)
		    {
	    	 Optional<PersonalInformation> pi = personalRepo.findById(personalid);
			 if(pi.isPresent())
			 {
				 PersonalInformation personal = pi.get();
				 m.addAttribute("personalInformation", personal);
				 
			 }
		         return "/userfolder/journals";
		    }

		    @RequestMapping(value="/saveJournal")
		    public String journal(JournalDetailsModel model)
		    {
		        ApiResponse res = empService.saveJournal(model);
		        return "redirect:/user/checkJournal";
		    }
		    
		    @RequestMapping(value = "/updateJournal")
		    public void updatePHD(@RequestParam("journal_id") Integer jourId, JournalDetailsModel model)
		    {
		    	ApiResponse res =empService.updateJournal(jourId,model);
		    }
		    
		    @RequestMapping(value="/deleteJournal")
		    public void deleteJournal(@RequestParam("journal_id") Integer rId)
		    {
		    	ApiResponse res=empService.deleteJournal(rId);
		    }

	@RequestMapping(value="/profile")
	public String goProfile()
	{
		return "/userfolder/profile";
	}
	
	@RequestMapping(value="/cv")
	public String goToCv() {
		return "/userfolder/cv";
	}
	
	@RequestMapping("/add_resume")
	public String addReport(@RequestParam("file")MultipartFile file, ModelMap map) {
    	ApiResponse response =null;
			
		try {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            User user = (User) principal;
           

            Optional<PersonalInformation> op = personalRepo.findByUser(user);
            
                PersonalInformation pi = op.get();
                
                byte arr[] = file.getBytes();
        		
        		String fileName = file.getOriginalFilename();		
        		String extension = fileName.substring(fileName.lastIndexOf("."));
        		String uploadFile =  UUID.randomUUID().toString()+extension;	
        		File fileObj = new File("C:\\Users\\HP\\git\\git\\EmployeeRecruitmentMedicaps\\EmployeeRecruitmentMedicaps\\src\\main\\resources\\static\\assets\\resume", uploadFile);
        		FileOutputStream fos = new FileOutputStream(fileObj);
        		fos.write(arr);
        		fos.flush();
        		fos.close();		
        		String filePath =  fileObj.getAbsolutePath();
        		pi.setResume(filePath);
				personalRepo.save(pi);
			
			
			return "home";

		}
		catch(Exception e) {
			System.err.println(e.getMessage());
			return "home";
		}	
	}
	
	
		
	
}