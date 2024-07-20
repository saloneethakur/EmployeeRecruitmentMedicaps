<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medi-Caps University Dashboard</title>
    <link rel="stylesheet" href="/assets/css/admindashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&display=swap"
        rel="stylesheet">
</head>

<body>
    <!-- Header section -->
    <header>
        <div class="logosec">
            <div class="logo">
                <img src="/assets/img/medicaps logo.png" alt="Medi-Caps Logo" style="width: 200px;">
            </div>
            <div class="hamburger">
                <i class="fa fa-bars"></i> <!-- Ensure this icon matches your design -->
            </div>
        </div>

        <div class="message">
            <div class="circle"></div>
            <div class="dp">
            </div>
        </div>
    </header>
    <div class="main-container">
        <div class="navcontainer" id="navcontainer">
            <nav class="nav">
                <div class="nav-upper-options">
                    <div class="nav-option option1" >
                        <h3>Dashboard</h3>
                    </div>

                    <div class="nav-option option2">
                        <a href=""> <h3>Profile</h3>
                        </a>
                    </div>

                    <div class="nav-option option3" onclick="toggleTeachingDetails()">
                        <h3>Teaching Vacancy</h3>
                    </div>

                    <div class="nav-option option4" onclick="toggleNonTeachingDetails()">
                        <h3>Non-Teaching Vacancy</h3>
                    </div>

                    <div class="nav-option option5 dropdown">
                        <h3>Create Vacancy <i class="fas fa-chevron-down"></i></h3>
                        <div class="dropdown-content">
                            <a onclick="location.href='/admin/vacancy'">Academic</a>
                            <a onclick="location.href='/admin/vacancy'">Non-Academic</a>
                        </div>
                    </div>

                    <div class="nav-option option7">
                        <a href=""> <h3>Download all CV</h3>
                        </a>
                    </div>

                    <div class="nav-option logout">
                        <a href=""> <h3>Logout</h3>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
        <div class="main">
            <div class="box-container">
                <div class="box box1">
                    <div class="text">
                        <h2 class="topic" onclick="toggleTeachingDetails()">Teaching Vacancies</h2>
                    </div>
                </div>
                <div class="box box2">
                    <div class="text">
                        <h2 class="topic" onclick="toggleNonTeachingDetails()">Non-Teaching Vacancies</h2>
                    </div>
                </div>
            </div>
            <div class="report-container" id="teachingDetails" style="display: none;">
                <div class="report-header">
                    <h1 class="recent-Articles">Teaching Applicant Details</h1>
                    <button class="view" onclick="toggleFilter('teachingFilter')">Filter</button>
                </div>
                <div class="report-body">
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Mobile No.</th>
                                <th>Post Applied For</th>
                                <th>Faculty</th>
                                <th>Department Name</th>
                                <th>Total Experience</th>
                                <th>Date of Application</th>
                                <th>View Resume</th>
                                <th>View Profile</th>
                                <th>Delete<i class="fas fa-trash-alt"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>John Doe</td>
                                <td>johndoe@example.com</td>
                                <td>123-456-7890</td>
                                <td>Professor</td>
                                <td>Engineering</td>
                                <td>Computer Science</td>
                                <td>10 years</td>
                                <td>2024-07-15</td>
                                <td><a href="#">View Resume</a></td>
                                <td><a href="#">View Profile</a></td>
                                <td><button class="delete-btn" onclick="deleteRow(this)"><i class="fas fa-trash-alt"></i> </button>
                                </td>
                            </tr>
                            <!-- Add more rows as needed -->
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="report-container" id="nonTeachingDetails" style="display: none;">
                <div class="report-header">
                    <h1 class="recent-Articles">Non-Teaching Applicant Details</h1>
                    <button class="view" onclick="toggleFilter('nonTeachingFilter')">Filter</button>
                </div>
                <div class="report-body">
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Mobile No.</th>
                                <th>Post Applied For</th>
                                <th>Faculty</th>
                                <th>Department Name</th>
                                <th>Total Experience</th>
                                <th>Date of Application</th>
                                <th>View Resume</th>
                                <th>View Profile</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Jane Smith</td>
                                <td>janesmith@example.com</td>
                                <td>987-654-3210</td>
                                <td>Lecturer</td>
                                <td>Science</td>
                                <td>Physics</td>
                                <td>5 years</td>
                                <td>2024-07-15</td>
                                <td><a href="#">View Resume</a></td>
                                <td><a href="#">View Profile</a></td>
                                <td><button class="delete-btn" onclick="deleteRow(this)"><i class="fas fa-trash-alt"></i></button>
                                </td>
                            </tr>
                            <!-- Add more rows as needed -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- Filter Popup for Teaching Vacancy -->
    <div class="filter-popup" id="teachingFilter">
        <div class="filter-content">
            <span class="close-filter" onclick="closeFilter('teachingFilter')">&times;</span>
            <h3>Teaching Vacancy Filter</h3>
            <form>
                <label for="faculty">Faculty:</label>
                <select id="faculty">
                    <option value="engineering">Engineering</option>
                    <option value="science">Science</option>
                    <option value="arts">Arts</option>
                </select>
                <label for="department">Department:</label>
                <select id="department">
                    <option value="computerScience">Computer Science</option>
                    <option value="physics">Physics</option>
                    <option value="chemistry">Chemistry</option>
                </select>
                <label for="post">Post:</label>
                <select id="post">
                    <option value="lecturer">Lecturer</option>
                    <option value="labAssistant">Lab Assistant</option>
                    <option value="adminStaff">Admin Staff</option>
                    <!-- Add more options as needed -->
                </select>
                <label for="applicationDate">Date of Application:</label>
                <input type="date" id="applicationDate">
                <div class="button-group">
                    <button type="button" class="filter-btn" onclick="applyFilter('teachingFilter')">Apply</button>
                    <button type="button" class="reset-btn" onclick="resetFilter('teachingFilter')">Reset</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Filter Popup for Non-Teaching Vacancy -->
    <div class="filter-popup" id="nonTeachingFilter">
        <div class="filter-content">
            <span class="close-filter" onclick="closeFilter('nonTeachingFilter')">&times;</span>
            <h3>Non-Teaching Vacancy Filter</h3>
            <form>
                <label for="faculty">Faculty:</label>
                <select id="faculty">
                    <option value="engineering">Engineering</option>
                    <option value="science">Science</option>
                    <option value="arts">Arts</option>
                </select>
                <label for="department">Department:</label>
                <select id="department">
                    <option value="computerScience">Computer Science</option>
                    <option value="physics">Physics</option>
                    <option value="chemistry">Chemistry</option>
                </select>
                <label for="post">Post:</label>
                <select id="post">
                    <option value="lecturer">Lecturer</option>
                    <option value="labAssistant">Lab Assistant</option>
                    <option value="adminStaff">Admin Staff</option>
                    <!-- Add more options as needed -->
                </select>
                <label for="applicationDate">Date of Application:</label>
                <input type="date" id="applicationDate">
                <div class="button-group">
                    <button type="button" class="filter-btn" onclick="applyFilter('nonTeachingFilter')">Apply</button>
                    <button type="button" class="reset-btn" onclick="resetFilter('nonTeachingFilter')">Reset</button>
                </div>
            </form>
        </div>
    </div>

    <script src="/assets/JS/admindashboard.js"></script>
    
</body>

</html>
