<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ProfileBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Submission Details</title>
    <link rel="stylesheet" href="style.css"> 
</head>
<body>
<div class="main-wrapper">

    <div class="card sidebar-profile-card">
        <img src="logo.png" alt="Profile Logo" class="avatar"> 
        <div class="name">Submission Received!</div>
        <div class="username">Success</div>
        <div class="upload-info" style="margin-top: 10px;">
            <p>Details successfully processed by the ProfileServlet.</p>
        </div>
    </div>

    <div class="card main-content-card">
        <h1>Submission Details</h1>

        <%
            ProfileBean profile = (ProfileBean) request.getAttribute("profile");
            if(profile != null){
        %>
        <div class="intro-box">
            <h3>Submitted Profile</h3>
            <div class="detail-row"><strong>Name:</strong> <%= profile.getName() %></div>
            <div class="detail-row"><strong>Student ID:</strong> <%= profile.getStudentID() %></div>
            <div class="detail-row"><strong>Program:</strong> <%= profile.getProgram() %></div>
            <div class="detail-row"><strong>Email:</strong> <%= profile.getEmail() %></div>
            <div class="detail-row"><strong>Hobbies:</strong> <%= profile.getHobbies() %></div>

            <h3 style="margin-top: 20px;">Self Introduction:</h3>
            <p><%= profile.getSelfIntroduction() %></p>
        </div>
        <% } %>

        <div class="action-links">
            <a href="index.jsp" class="back-button">Back to Form</a>
            <a href="viewProfiles.jsp" class="history-link">View All Profiles</a>
        </div>
    </div>
</div>
</body>
</html>
