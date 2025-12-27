<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Profile Form</title>
    <link rel="stylesheet" href="style.css"> 
    <link rel="icon" type="image/png" href="logo.png">
</head>
<body>

<div class="main-wrapper">
    
    <div class="card sidebar-profile-card">
        <img src="logo.png" alt="Profile Logo" class="avatar"> 
        <div class="name">Hi, Welcome!</div>
        <div class="username">Form Submission Page</div>
        
        <div class="upload-info" style="margin-top: 10px;">
            <p><strong>Note:</strong> Make sure to enter all the details and click 'Submit' to save your personal information.</p>
        </div>
    </div>

    <div class="card main-content-card">
        
        <h2>Personal Profile Form</h2>

        <ul class="tab-nav">
            <li class="tab-nav-item">
                <a href="#" class="tab-nav-link active">Personal Information</a>
            </li>
        </ul>

        <form action="ProfileServlet" method="post">
            
            <div class="form-row">
                <div class="form-col">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-col">
                    <label for="studentID">Student ID:</label>
                    <input type="text" id="studentID" name="studentID" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-col">
                    <label for="program">Program:</label>
                    <input type="text" id="program" name="program" required>
                </div>
                <div class="form-col">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
            </div>

            <div class="form-group">
                <label for="hobbies">Hobbies (e.g., Gaming, Reading, Travel):</label>
                <input type="text" id="hobbies" name="hobbies">
            </div>

            <div class="form-group">
                <label for="selfIntroduction">Short Self Introduction:</label>
                <textarea id="selfIntroduction" name="selfIntroduction" rows="4"></textarea>
            </div>

            <div class="action-links">
                <a href="viewProfiles.jsp" class="history-link">View Submission History</a>
                <button type="submit" class="btn-primary">Submit</button>
            </div>
            
        </form>
        
    </div>
</div>
</body>
</html>
