<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Profiles</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="main-wrapper">

    <div class="card sidebar-profile-card">
        <img src="logo.png" alt="Profile Logo" class="avatar"> 
        <div class="name">All Profiles</div>
        <div class="username">Database Records</div>
        <div class="upload-info" style="margin-top: 10px;">
            <p>You can search profiles by name or filter by program below.</p>
        </div>
    </div>

    <div class="card main-content-card">
        <h2>View Profiles</h2>

        <%
            // --- Database Setup ---
            List profileList = new ArrayList();
            List programList = new ArrayList();
            String dbURL = "jdbc:derby://localhost:1527/student_profile";
            String dbUser = "app";
            String dbPass = "app";

            String searchName = request.getParameter("searchName");
            String filterProgram = request.getParameter("filterProgram");

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // --- Get unique programs for dropdown ---
                stmt = conn.prepareStatement("SELECT DISTINCT program FROM profiles ORDER BY program ASC");
                rs = stmt.executeQuery();
                while(rs.next()) {
                    programList.add(rs.getString("program"));
                }
                rs.close();
                stmt.close();

                // --- profile list SQL---
                String sql = "SELECT * FROM profiles WHERE 1=1";
                if(searchName != null && searchName.trim().length() > 0) {
                    sql += " AND LOWER(name) LIKE ?";
                }
                if(filterProgram != null && filterProgram.trim().length() > 0) {
                    sql += " AND program = ?";
                }
                sql += " ORDER BY id ASC";

                stmt = conn.prepareStatement(sql);

                int paramIndex = 1;
                if(searchName != null && searchName.trim().length() > 0) {
                    stmt.setString(paramIndex++, "%" + searchName.toLowerCase() + "%");
                }
                if(filterProgram != null && filterProgram.trim().length() > 0) {
                    stmt.setString(paramIndex++, filterProgram);
                }

                rs = stmt.executeQuery();

                while(rs.next()){
                    Map p = new HashMap();
                    p.put("name", rs.getString("name"));
                    p.put("studentID", rs.getString("studentID"));
                    p.put("program", rs.getString("program"));
                    p.put("email", rs.getString("email"));
                    p.put("hobbies", rs.getString("hobbies"));
                    p.put("selfIntroduction", rs.getString("selfIntroduction"));
                    profileList.add(p);
                }

            } catch(Exception e) {
                out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                try { if(rs != null) rs.close(); } catch(Exception ex) {}
                try { if(stmt != null) stmt.close(); } catch(Exception ex) {}
                try { if(conn != null) conn.close(); } catch(Exception ex) {}
            }
        %>

        <!-- Search & Filter Form -->
        <form method="get" action="viewProfiles.jsp" style="margin-bottom:20px;">
            Name: <input type="text" name="searchName" placeholder="Search by name" value="<%= (searchName != null) ? searchName : "" %>">
            Program: 
            <select name="filterProgram">
                <option value="">All</option>
                <%
                    for(int i=0; i<programList.size(); i++) {
                        String prog = (String) programList.get(i);
                        String selected = "";
                        if(filterProgram != null && filterProgram.equals(prog)) selected = "selected";
                %>
                    <option value="<%= prog %>" <%= selected %>><%= prog %></option>
                <%
                    }
                %>
            </select>
            <button type="submit" class="btn-primary">Search / Filter</button>
        </form>

        <%
            if(!profileList.isEmpty()){
                for(int i=0; i<profileList.size(); i++){
                    Map p = (Map) profileList.get(i);
        %>
                    <div class="intro-box">
                        <h3>Profile #<%= i+1 %></h3>
                        <div class="detail-row"><strong>Name:</strong> <%= p.get("name") %></div>
                        <div class="detail-row"><strong>Student ID:</strong> <%= p.get("studentID") %></div>
                        <div class="detail-row"><strong>Program:</strong> <%= p.get("program") %></div>
                        <div class="detail-row"><strong>Email:</strong> <%= p.get("email") %></div>
                        <div class="detail-row"><strong>Hobbies:</strong> <%= p.get("hobbies") %></div>
                        <p style="margin-top: 10px;"><strong>Self Introduction:</strong></p>
                        <p><%= p.get("selfIntroduction") %></p>
                    </div>
        <%
                }
            } else {
        %>
                <p>No profiles found.</p>
        <%
            }
        %>

        <div class="action-links">
            <a href="index.jsp" class="back-button">Back to Form</a>
        </div>
    </div>
</div>

</body>
</html>
