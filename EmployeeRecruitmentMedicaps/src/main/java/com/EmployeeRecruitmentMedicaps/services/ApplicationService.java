package com.EmployeeRecruitmentMedicaps.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;
import com.EmployeeRecruitmentMedicaps.repositories.ApplicationRepository;

@Service
public class ApplicationService {
	
	@Autowired
	private ApplicationRepository appRepo;
	ApiResponse res = null;
	

	public ApiResponse deleteAllApplications() {
		try {
            appRepo.deleteAll(); 
            res= new ApiResponse(true,"All Applications deleted Successfully");
        } catch (Exception e) {
        	System.err.println(e.getMessage());
			res=new ApiResponse(false, "Applications Not deleted",e.getMessage());
        }
		return res;
	}


	public ApiResponse deleteSelectedApplicationOnly(Integer applicationId) {
		 try {
	            if (appRepo.existsById(applicationId)) {
	                appRepo.deleteById(applicationId);
	                res= new ApiResponse(true,"Success");
	            } else {
	                res=  new ApiResponse(false,"Error");
	            }
	        } catch (Exception e) {
	        	System.err.println(e.getMessage());
				res=new ApiResponse(false, "Data not uploaded",e.getMessage());
	        }
	    
	return res;
	}


	public ApiResponse deleteApplicationByVacancy(Integer vacancyId) {
		try {
            // Delete applications by vacancyId
            int deletedCount = appRepo.deleteByVacancyId(vacancyId);
            if (deletedCount > 0) {
                res = new ApiResponse(true, "Successfully deleted " + deletedCount + " applications for vacancy ID " + vacancyId + ".");
            } else {
                res = new ApiResponse(false, "No applications found for vacancy ID " + vacancyId + ".");
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
            res = new ApiResponse(false, "An error occurred: " + e.getMessage());
        } 
	    
	return res;
	}

}
