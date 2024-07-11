function openOtpPopup(event) {
    // Prevent form submission
	document.getElementById('otpPopup').style.display = 'flex';

	 /*   var formData = new FormData(document.getElementById("registerForm"));
	    
	    fetch("/medicaps/user_reg", {
	        method: "POST",
	        body: formData
	    })
	    .then(response => response.json())
	    .then(data => {
	        document.getElementById("mail").value = data.mail; // Assuming your backend returns the mail
	        document.getElementById("otpPopup").style.display = "flex";
	    })
	    .catch(error => console.error("Error:", error));
	}*/
}

function closeOtpPopup() {
    document.getElementById('otpPopup').style.display = 'none';
}

function submitOtp() {
    const otp = document.getElementById('otpInput').value;
    if (otp.length === 6) {
        alert('OTP submitted successfully!');
        closeOtpPopup();
        document.getElementById('registerForm').submit(); // Submit the registration form
    } else {
        alert('Please enter a valid 6-digit OTP.');
    }
}

