<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Fixed Navigation Bar with Sections</title>
    <link rel="stylesheet" href="/assets/css/usercorrection.css" />
    <!-- Font Awesome CDN -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
  </head>
  <body>
    <!-- Navigation Bar -->
    <nav class="navbar">
      <div class="navbar-left">
        <img src="/assets/img/medicaps logo.png" alt="Institute Logo" class="logo" />
        <span class="institute-name">MEDICAPS UNIVERSITY</span>
      </div>
      <div class="navbar-right">
        <a href="#home">Home</a>
        <a href="#view-applications">View Applications</a>
        <a href="#my-profile" class="profile-link">
          <i class="fas fa-user"></i>
          My Profile
        </a>
      </div>
    </nav>

    <div class="section-content">
      <!-- Section 1 with Sidebar -->
      <div class="section section-1">
        <div class="sidebar">
        <!--<div class="sidebar-heading">-->
        <h1>Dashboard</h1>
        <!--</div>-->
        <a
          href="#personal-details"
          class="sidebar-link"
          data-target="personal-details-form"
          >Personal Details</a
        >
        <a
          href="#educational-details"
          class="sidebar-link"
          data-target="educational-details-form"
          >Educational Details</a
        >
        <a
          href="#work-experience"
          class="sidebar-link"
          data-target="work-experience-form"
          >Work Experience</a
        >
        <a href="#research" class="sidebar-link" data-target="research-form"
          >Research</a
        >
        <a href="#resume" class="sidebar-link" data-target="resume-form"
          >Resume</a
        >
      </div>
       </div
      <!-- Section 2 -->
      <div class="section section-2">
        <div class="profile-header">
          <h1>Profile</h1>
          <button class="edit-button"><i class="fas fa-edit"></i> Edit</button>
        </div>
        <!-- Personal Details Form -->
        <div
          id="personal-details-form"
          class="form-section"
          style="display: none">
          <div class="personal-container">
          <h2>Personal Details</h2>

          <form>
            <div class="personal-row">
              <div class="personal-input-group">
                <label for="full-name">Full Name<span>*</span></label>
                <input
                  type="text"
                  id="full-name"
                  name="full-name"
                  required
                  disabled
                />
              </div>
              <div class="personal-input-group">
                <label for="email">Email<span>*</span></label>
                <input type="email" id="email" name="email" required disabled />
              </div>
            </div>
            <div class="personal-row">
              <div class="personal-input-group">
                <label for="phone">Phone Number<span>*</span></label>
                <input type="tel" id="phone" name="phone" required />
              </div>
              <div class="personal-input-group">
                <label for="alt-phone">Alternate Phone Number</label>
                <input type="tel" id="alt-phone" name="alt-phone" />
              </div>
            </div>
            <div class="personal-row">
              <div class="personal-input-group">
                <label for="dob">DOB<span>*</span></label>
                <input type="date" id="dob" name="dob" />
              </div>
  
              <div class="personal-input-group">
                <div class="personal-category-field">
                  <label for="category">Category:<span>*</span></label>
                  <select id="category" name="category">
                    <option value=""></option>
                    <option value="general" selected>General</option>
                    <option value="OBC">OBC</option>
                    <option value="ST">ST</option>
                    <option value="SC">SC</option>
                    <option value="other">Other</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="personal-input-group">
              <div class="personal-gender-field">
                <label for="gender" class="gender-label"
                  >Gender:<span>*</span></label
                >
                <label class="personal-radio-option">
                  <input
                    type="radio"
                    id="male"
                    name="gender"
                    value="male"
                    disabled
                    checked
                  />Male
                </label>
                <label class="radio-option">
                  <input
                    type="radio"
                    id="female"
                    name="gender"
                    value="female"
                    disabled
                  />Female
                </label>
                <label class="radio-option">
                  <input
                    type="radio"
                    id="other"
                    name="gender"
                    value="other"
                    disabled
                  />Other
                </label>
              </div>
            </div>
  
            <div class="personal-row">
              <div class="personal-input-group">
                <label for="area">Address<span>*</span></label>
                <input type="text" id="area" name="area" required />
              </div>
            </div>
            <div class="personal-row">
              <div class="personal-input-group">
                <label for="district">District<span>*</span></label>
                <input
                  type="text"
                  id="district"
                  name="district"
                  required
                  disabled
                />
              </div>
  
              <div class="personal-input-group">
                <label for="pincode">Pincode<span>*</span></label>
                <input
                  type="text"
                  id="pincode"
                  name="pincode"
                  required
                  disabled
                />
              </div>
            </div>
            <div class="personal-row">
              <div class="personal-input-group">
                <label for="country">Country<span>*</span></label>
                <input id="country" name="country" required />
              </div>
              <div class="personal-input-group">
                <label for="state">State<span>*</span></label>
                <input id="state" name="state" required />
              </div>
            </div>
  
            <!-- <button type="submit" id="country-save" class="save-btn" disabled>
              Save
            </button> -->
            <div id="additionalFields">
              <div class="personal-input-group">
                <label for="research-id">Researcher Id</label>
                <input type="text" id="research-id" name="research-id" />
              </div>
              <!-- <button type="submit" id="research_save" class="save-btn" disabled>
                Save
              </button> -->
              <div class="personal-input-group">
                <label for="scopus-id">Scopus Id</label>
                <input type="text" id="scopus-id" name="scopus-id" />
              </div>
              <!-- <button type="submit" id="scopus_save" class="save-btn" disabled>
                Save
              </button> -->
              <div class="personal-input-group">
                <label for="orcid">ORCID</label>
                <input type="text" id="orcid" name="orcid" />
              </div>
              <!-- <button type="submit" id="orc_save" class="save-btn">Save</button> -->
            </div>
          </section>
          </form>
        </div>
        </div>
        <!-- Educationalforms -->
        <div
          id="educational-details-form"
          class="form-section"
          style="display: none"
        >
          <h2>Educational Details</h2>
          <form>
            <!--education 10    -->
            <div class="education-section" id="section-10th">
              <div class="section-header">
                <h3>10th Grade</h3>
                <div class="edu-section-details" id="10th-details">
                  <div class="edu">
                    <label for="10thSchoolName">School Name</label>
                    <input
                      type="text"
                      id="10thSchoolName"
                      name="10thSchoolName"
                      required
                    />

                    <label for="10thBoard">Board</label>
                    <input
                      type="text"
                      id="10thBoard"
                      name="10thBoard"
                      required
                    />

                    <label for="10thYear">Passing Year</label>
                    <input
                      type="date"
                      id="10th-date"
                      name="10th-date"
                      required
                    />

                    <label for="10thGrade">Percentage/Grade</label>
                    <input
                      type="text"
                      id="10thGrade"
                      name="10thGrade"
                      required
                    />

                    <label for="10thField">Field of Study</label>
                    <input
                      type="text"
                      id="10thField"
                      name="10thField"
                      required
                    />
                  </div>
                </div>
              </div>
              <button
                type="submit"
                value="Save"
                class="save-button"
                style="display: none"
                disabled
              />
            </div>

            <!--education 12-->
            <div class="education-section" id="section-12th">
              <div class="section-header">
                <h3>12th Grade</h3>
                <div class="edu-section-details" id="12th-details">
                  <div class="edu">
                    <label for="12thSchoolName">School Name</label>
                    <input
                      type="text"
                      id="12thSchoolName"
                      name="12thSchoolName"
                      required
                    />

                    <label for="12thBoard">Board</label>
                    <input
                      type="text"
                      id="12thBoard"
                      name="12thBoard"
                      required
                    />

                    <label for="12thYear">Passing Year</label>
                    <input
                      type="date"
                      id="12th-date"
                      name="12th-date"
                      required
                    />

                    <label for="12thGrade">Percentage/Grade</label>
                    <input
                      type="text"
                      id="12thGrade"
                      name="12thGrade"
                      required
                    />

                    <label for="12thField">Subject</label>
                    <select id="12thField" name="12thField" required>
                      <option value="">Select Subject</option>
                      <option value="PCM">PCM</option>
                      <option value="PCB">PCB</option>
                      <option value="PCMB">PCMB</option>
                      <option value="Commerce">Commerce</option>
                      <option value="CommerceMaths">Commerce + Maths</option>
                      <option value="Others">Others</option>
                    </select>
                  </div>
                </div>
              </div>
              <button
                type="submit"
                value="Save"
                class="save-button"
                style="display: none"
                disabled
              />
            </div>

            <!--education ug-->
            <div class="education-section" id="section-UG">
              <div class="section-header">
                <h3>Undergraduate (UG)</h3>
                <div class="edu-section-details" id="UG-details">
                  <div class="edu">
                    <label for="UGDegree">Degree</label>
                    <select id="UGDegree" name="UGDegree" required>
                      <option value="">Select Degree</option>
                      <option value="Engineering">Engineering</option>
                      <option value="Management">Management</option>
                      <option value="BA">BA</option>
                      <option value="BSc">BSc</option>
                      <option value="Others">Others</option>
                    </select>

                    <div id="UGFieldContainer">
                      <label for="UGField">Specialization</label>
                      <select id="UGField" name="UGField">
                        <option value="">Select Field</option>
                      </select>
                    </div>

                    <label for="UGInstitution">Institution Attended</label>
                    <input
                      type="text"
                      id="UGInstitution"
                      name="UGInstitution"
                      required
                    />

                    <label for="UGYear">Year of Completion</label>
                    <input type="date" id="UG-date" name="UG-date" required />

                    <label for="UGGrade">Percentage/Grade</label>
                    <input type="text" id="UGGrade" name="UGGrade" required />
                  </div>
                </div>
              </div>
              <button
                type="submit"
                value="Save"
                class="save-button"
                style="display: none"
                disabled
              />
            </div>

            <!--education pg-->
            <div class="education-section" id="section-PG">
              <div class="section-header">
                <h3>Postgraduate (PG)</h3>
                <div class="edu-section-details" id="PG-details">
                  <div class="edu">
                    <label for="PGDegree">Degree</label>
                    <select id="PGDegree" name="PGDegree" required>
                      <option value="">Select Degree</option>
                      <option value="MBA">MBA</option>
                      <option value="MSc">MSc</option>
                      <option value="MTech">MTech</option>
                      <option value="Others">Others</option>
                    </select>

                    <div id="PGFieldContainer">
                      <label for="PGField">Field of Study</label>
                      <select id="PGField" name="PGField">
                        <option value="">Select Field</option>
                      </select>
                    </div>

                    <label for="PGInstitution">Institution Attended</label>
                    <input
                      type="text"
                      id="PGInstitution"
                      name="PGInstitution"
                      required
                    />

                    <label for="PGYear">Year of Completion</label>
                    <input type="date" id="PG-date" name="PG-date" required />

                    <label for="PGGrade">Percentage/Grade</label>
                    <input type="text" id="PGGrade" name="PGGrade" required />
                  </div>
                </div>
              </div>
              <button
                type="submit"
                value="Save"
                class="save-button"
                style="display: none"
                disabled
              />
            </div>

            <!--education phd-->
            <div class="education-section" id="section-PhD">
              <div class="section-header">
                <h3>PhD</h3>
                <div class="edu-section-details" id="PhD-details">
                  <div class="edu">
                    <label for="PhDField">Field of Study</label>
                    <input type="text" id="PhDField" name="PhDField" required />

                    <label for="PhDInstitution">Institution Attended</label>
                    <input
                      type="text"
                      id="PhDInstitution"
                      name="PhDInstitution"
                      required
                    />

                    <label for="PhDJoiningYear">Joining Year</label>
                    <input
                      type="date"
                      id="PhD-joining-date"
                      name="PhD-joining-date"
                      required
                    />

                    <label for="PhDPassingYear">Passing Year</label>
                    <input
                      type="date"
                      id="PhD-passing-date"
                      name="PhD-passing-date"
                      required
                    />

                    <label for="PhDGrade">Percentage</label>
                    <input type="text" id="PhDGrade" name="PhDGrade" required />

                    <label for="PhDSupervisor"
                      >Supervisor's Name (optional)</label
                    >
                    <input
                      type="text"
                      id="PhDSupervisor"
                      name="PhDSupervisor"
                    />

                    <label for="PhDThesis">Thesis Title (optional)</label>
                    <input type="text" id="PhDThesis" name="PhDThesis" />

                    <label for="PhDSummary">Research Summary (optional)</label>
                    <textarea
                      id="PhDSummary"
                      name="PhDSummary"
                      rows="4"
                    ></textarea>
                  </div>
                </div>
              </div>
              <button
                type="submit"
                value="Save"
                class="save-button"
                style="display: none"
                disabled
              />
            </div>

            <!--education qualified exams-->
            <div class="education-section" id="section-exam">
              <div class="section-header">
                <h3>Exams Qualified</h3>
                <div class="edu-section-details" id="exam-details">
                  <div class="edu-row">
                    <div class="edu">
                      <label for="examFieldGATE">GATE</label>
                      <input
                        type="text"
                        id="examFieldGATE"
                        name="examFieldGATE"
                        required
                      />
                      <label for="examYearGATE">Year</label>
                      <input
                        type="text"
                        id="examYearGATE"
                        name="examYearGATE"
                        required
                      />

                      <div class="edu-row">
                        <label for="examFieldNET">NET</label>
                        <input
                          type="text"
                          id="examFieldNET"
                          name="examFieldNET"
                          required
                        />
                        <label for="examYearNET">Year</label>
                        <input
                          type="text"
                          id="examYearNET"
                          name="examYearNET"
                          required
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <button
                type="submit"
                value="Save"
                class="save-button"
                style="display: none"
                disabled
              />
            </div>
          </form>
        </div>

        <!--work experience-->
        <div
          id="work-experience-form"
          class="form-section"
          style="display: none"
        >
          <h2>Work Experience</h2>
          <form>
            <h3>Experience (Latest to Oldest)</h3>
            <div id="workExperienceSections">
              <div class="work-section">
                <div class="work-flex-container">
                  <div class="work-flex-item">
                    <label for="jobTitle1">Job Title:</label>
                    <input
                      type="text"
                      id="jobTitle1"
                      name="jobTitle1"
                      required
                    />
                  </div>
                  <div class="work-flex-item">
                    <label for="instituteName1">Institute Name:</label>
                    <input
                      type="text"
                      id="instituteName1"
                      name="instituteName1"
                      required
                    />
                  </div>
                </div>
                <div class="work-flex-container">
                  <div class="work-flex-item">
                    <label for="startDate1">Start Date:</label>
                    <input
                      type="date"
                      id="startDate1"
                      name="startDate1"
                      required
                    />
                  </div>
                  <div class="work-flex-item">
                    <label for="endDate1">End Date:</label>
                    <input type="date" id="endDate1" name="endDate1" required />
                  </div>
                </div>
              </div>
            </div>
            <button type="button" id="addSectionBtn">Add Experience</button>
            <!-- <button type="submit" id="nextbtn">Next</button>-->
            <button
              type="submit"
              value="Save"
              class="save-button"
              style="display: none"
              disabled
            />
          </form>
        </div>

        <!--research-->
        <div id="research-form" class="form-section" style="display: none">
          <h2>Research</h2>
          <form>
            <div id="research-sections">
              <h2>Journal Publications</h2>
              <div class="research-section" id="research-1">
                <div class="research-field">
                  <label for="research-title-1">Publication Title</label>
                  <input type="text" id="research-title-1" />
                </div>
                <div class="research-field">
                  <label for="research-name-1">Journal Name</label>
                  <input type="text" id="research-name-1" />
                </div>
                <div class="research-inline-fields">
                  <div class="reserch-field" style="flex: 1">
                    <label for="research-volume-1">Issue no., Volume</label>
                    <input type="text" id="research-volume-1" />
                  </div>
                  <div class="research-field" style="flex: 1">
                    <label for="research-year-1">Year</label>
                    <select id="research-year-1">
                      <option value="" disabled selected>Select year</option>
                      <!-- Add more years as needed -->
                      <option value="2024">2024</option>
                      <option value="2023">2023</option>
                      <option value="2022">2022</option>
                    </select>
                  </div>
                </div>
                <div class="research-field">
                  <label for="research-indexing-1">Indexing</label>
                  <select id="research-indexing-1">
                    <option value="">Select</option>
                    <option value="Engineering">Engineering</option>
                    <option value="Management">Management</option>
                    <option value="BA">BA</option>
                    <option value="BSc">BSc</option>
                  </select>
                </div>
              </div>
              <div>
                <button class="add-section" id="add-research">
                  Add Research
                </button>
              </div>
            </div>
            <button
              type="submit"
              value="Save"
              class="save-button"
              style="display: none"
              disabled
            />
          </form>
        </div>

        <div id="resume-form" class="form-section" style="display: none">
          <h2>Resume</h2>
          <form>
            <label for="resume-file">Resume File:</label>
            <input
              type="file"
              id="resume-file"
              name="resume-file"
              disabled
            /><br /><br />
            <button
              type="submit"
              value="Save"
              class="save-button"
              style="display: none"
              disabled
            />
          </form>
        </div>
      </div>
    </div>

    <!-- Link to JavaScript file -->
    <script src="/assets/JS/useragain.js"></script>
  </body>
</html>
