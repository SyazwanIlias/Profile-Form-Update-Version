package servlets;

import model.ProfileBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:derby://localhost:1527/student_profile";
    private static final String DB_USER = "app";
    private static final String DB_PASS = "app";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String studentID = request.getParameter("studentID");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String selfIntroduction = request.getParameter("selfIntroduction");

        ProfileBean profile = new ProfileBean(name, studentID, program, email, hobbies, selfIntroduction);

        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String sql = "INSERT INTO profiles (name, studentID, program, email, hobbies, selfIntroduction) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, profile.getName());
            stmt.setString(2, profile.getStudentID());
            stmt.setString(3, profile.getProgram());
            stmt.setString(4, profile.getEmail());
            stmt.setString(5, profile.getHobbies());
            stmt.setString(6, profile.getSelfIntroduction());
            stmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { if(stmt != null) stmt.close(); } catch(Exception ex) {}
            try { if(conn != null) conn.close(); } catch(Exception ex) {}
        }

        request.setAttribute("profile", profile);
        RequestDispatcher dispatcher = request.getRequestDispatcher("profileDisplay.jsp");
        dispatcher.forward(request, response);
    }
}
