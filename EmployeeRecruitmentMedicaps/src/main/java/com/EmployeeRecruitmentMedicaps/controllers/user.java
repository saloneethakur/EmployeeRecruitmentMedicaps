package com.EmployeeRecruitmentMedicaps.controllers;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
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
	    public String deleteEducation(@RequestParam("educationId") Integer eId)
	    {
	    	ApiResponse res=empService.deleteEducation(eId);
	    	return "redirect:/user/checkEducation";
	    }
	    
	@RequestMapping(value="/checkExperience")
	public String checkexperience(Model m)
	{
		Optional<PersonalInformation> pi = personalRepo.findById(personalid);
		 if(pi.isPresent())
		 {
			 PersonalInformation personal = pi.get();
			 m.addAttribute("personalInformation", personal);
			 
		 }
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
	public String experience(ExperienceModel model)
	{
		ApiResponse res = empService.saveExperience(model);
		return "redirect:/user/checkExperience";
	
	}
	
	@RequestMapping(value = "/updateExperience")
	public String updateExperience(@RequestParam("experience_id") Integer expID,ExperienceModel model )
	{
		ApiResponse res=empService.updateExperience(expID,model);
		return "redirect:/user/checkExperience";
	}
	
	@RequestMapping(value = "/deleteExperience")
	public String deleteExperience(@RequestParam("experience_id") Integer expId)
	{
		ApiResponse res=empService.deleteExperience(expId);
		return "redirect:/user/checkExperience";
	}
	
	 
	   


	    @RequestMapping(value="/savePHDeducation")
	    public String PHDeducation(PHDdetailsModel model)
	    {
	        ApiResponse res = empService.savePHDeducation(model);
	        return "redirect:/user/checkEducation";
	        
	    }
	    
	    @RequestMapping(value = "/updatePHD")
	    public String updatePHD(@RequestParam("id") Integer phdId,PHDdetailsModel model)
	    {
	    	ApiResponse res=empService.updatePHD(phdId,model);
	    	return "redirect:/user/checkEducation";
	    }
	    
	    @RequestMapping(value="/deletePHD")
	    public String deletePHD(@RequestParam("id")Integer pId)
	    {
	    	ApiResponse res=empService.deletePHD(pId);
	    	return "redirect:/user/checkEducation";
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
		    public String updatePHD(@RequestParam("journal_id") Integer jourId, JournalDetailsModel model)
		    {
		    	ApiResponse res =empService.updateJournal(jourId,model);
		    	return "redirect:/user/checkJournal";
		    }
		    
		    @RequestMapping(value="/deleteJournal")
		    public String deleteJournal(@RequestParam("journal_id") Integer rId)
		    {
		    	ApiResponse res=empService.deleteJournal(rId);
		    	return "redirect:/user/checkJournal";
		    }

	@RequestMapping(value="/profile")
	public String goProfile()
	{
		return "/userfolder/profile";
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
	
	/*@RequestMapping(value = "/getPdf",method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> load(@RequestParam(name = "file")String path) 
	{					
		HttpHeaders headers = new HttpHeaders();
	    headers.add("Content-Disposition", "attachment; filename=stock.pdf");
		
		
			String pic;
			try {
				File file = new File(path);

	         	FileInputStream fis = new FileInputStream(file);            
	            int size = fis.available();
	            byte arr[] = new byte[size];
	            
	            fis.read(arr);
	            fis.close();
	            
	            return ResponseEntity
                .ok()
                .headers(headers)
                .body(new InputStreamResource(new ByteArrayInputStream(arr)));
	            
			} catch (IOException e) 
			{
				System.out.println(e.getMessage());
				return null;
			}
	}
	*/

	@RequestMapping(value="/cv")
	    public String viewResume(ModelMap model) {
	        try {
	            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	            User user = (User) principal;

	            Optional<PersonalInformation> op = personalRepo.findByUser(user);

	            if (op.isPresent()) {
	                PersonalInformation pi = op.get();
	                String filePath = pi.getResume();
	                if (filePath != null) {
	                    // Extract the relative path from the full path
	                    String relativePath = extractRelativePath(filePath);
	                    model.addAttribute("resumePath", relativePath);
	                    
	                }
	            }

	            model.addAttribute("error", "Resume not found.");
	            return "/userfolder/cv";
	        } catch (Exception e) {
	            model.addAttribute("error", e.getMessage());
	            return "error";
	        }
	    }
	private String extractRelativePath(String fullPath) {
	    // Assuming the relative path always starts after 'static/'
		return fullPath.substring(fullPath.lastIndexOf("\\") + 1);
	}
	@RequestMapping(value = "/saveApplication")
	public void saveApplication(Model m)
	{
		ApiResponse res=empService.viewAppication(personalid,vid);
		m.addAttribute("Application",res);
	}
		
	
}