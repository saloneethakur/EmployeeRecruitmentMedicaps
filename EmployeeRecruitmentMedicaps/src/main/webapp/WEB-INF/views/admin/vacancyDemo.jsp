<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Vacancy Form</title>
    <style>
        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Vacancy Form</h2>
        <form action="/admin/addVacancy" method="post">
            <div class="form-group">
                <label for="faculty">Faculty:</label>
                <input type="text" id="faculty" name="faculty" required>
            </div>
            <div class="form-group">
                <label for="department">Department:</label>
                <input type="text" id="department" name="department" required>
            </div>
            <div class="form-group">
                <label for="postAppliedFor">Post Applied For:</label>
                <input type="text" id="postAppliedFor" name="postAppliedFor" required>
            </div>
            <div class="form-group">
                <label for="vstart">Vacancy Start Date:</label>
                <input type="date" id="vstart" name="vstart" required>
            </div>
            <div class="form-group">
                <label for="vlast">Vacancy Last Date:</label>
                <input type="date" id="vlast" name="vlast" required>
            </div>
            <div class="form-group">
                <button type="submit">Submit</button>
            </div>
        </form>
    </div>
</body>
</html>
