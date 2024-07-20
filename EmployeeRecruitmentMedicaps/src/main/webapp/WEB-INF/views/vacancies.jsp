<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Portal</title>
    <link rel="stylesheet" href="/assets/css/teaching.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


    <link
    rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
  />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <nav>
        <img src="/assets/img/medicaps logo.png" alt="Medi-Caps Logo" /> <!-- Add the Medi-Caps logo -->
        <div class="navigation">
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#about">View Vacancy</a></li>
                <li><a href="#academics">Applied Applications</a></li>       
                <li><a href="/home/registration">Sign Up/Login</a></li>
            </ul>
        </div>
        <div class="hamburger">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </nav>
    <section class="background-image-section">
        <div class="background-content">
            <div class="vacancy-options">
                <input type="text" class="search-bar" placeholder="Search Vacancies...">
                <button class="search-btn">
                    <i class="fas fa-search"></i> Search
                </button>
            </div>
            <div class="vacancy-options">
                <button class="academic-btn" id="academic-btn">
                    <i class="fas fa-book"></i> Academic
                </button>
                <button class="non-academic-btn">
                    <i class="fas fa-briefcase"></i> Non-Academic
                </button>
            </div>
            
           
                <div class="container-display" id="container-display">
                    <div class="row">
                    <c:forEach var="vacancy" items="${vacancies}">
                      <div class="col-sm-4 mb-4]">
                        <div class="box-container">
                          <div id="card-container" class="card-container">
                            <div class="card">
                              <div class="card-content">
                                <h3>${vacancy.faculty}</h3>
                                <br>
                                <p>${vacancy.department}</p>
                                <p>${vacancy.postAppliedFor}</p>
                                <p>${vacancy.vlast}</p>
                              </div>
                              <div class="card-popup">
                                <button class="eligibility-button">ELIGIBILITY</button>
                                <form action="/user/apply">
                                 <input type="hidden" name="vacancyId" value="${vacancy.id}"/>
                                <button class="apply-button" >APPLY</button>
                                </form>
                                
                              </div>
                            </div>
              
                            <!-- Cards will be dynamically inserted here -->
                          </div>
                        </div>
                      </div>
                      </c:forEach>
                      
                     
                    
                     
                      
                            <!-- Cards will be dynamically inserted here -->
                           
                          </div>
                        </div>
                      </div>
                    
            </section>
       

    <!--Home-->
    <section id="home"></section>

    <!--Footer-->
    <footer class="medicap-footer">
        <div class="footer-container">
            <div class="footer-box">
                <img src="/assets/img/footer-logo.png" alt="logo" class="footer-logo">
                <div class="footer-img-row">
                    <a href="#">
                        <div style="display: flex; align-items: center; margin-bottom: 5px;">
                            <!-- <i class="fa-solid fa-location-dot"></i>
                            <h4>Medi-Caps University</h4> -->
                        </div>
                        <p class="foot-ads">A.B. Road, Pigdamber, Rau Indore - 453331</p>
                    </a>
                    <a href="tel:0731-4259500">
                        <i class="fa-solid fa-phone"></i>
                        <p>07313111500 , 07313111501 </p>
                    </a>
                    <a href="mail:info@medicaps.ac.in">
                        <i class="fa-solid fa-envelope"></i>
                        <p style="text-transform: lowercase;">info@medicaps.ac.in</p>
                    </a>
                </div>
            </div>

            <div class="footer-social">
                <a href="https://wa.me/7723019450"><i class="fab fa-whatsapp"></i></a>
                <a href="https://www.facebook.com/Mediuniv/"><i class="fab fa-facebook"></i></a>
                <a href="https://www.instagram.com/medicaps_university/"><i class="fab fa-instagram"></i></a>
                <a href="https://twitter.com/caps_medi"><i class="fab fa-twitter"></i></a>
                <a href="https://www.linkedin.com/school/medi-caps-university-indore/"><i class="fab fa-linkedin"></i></a>
                <a href="https://www.youtube.com/channel/UCSeSaSzuPcLY8f0Zov01ZuQ/videos"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 Medi-Caps University. All rights reserved.</p>
        </div>
    </footer>
    <script src="/assets/JS/teaching.js"></script>
</body>
</html>


