package model;

import java.io.Serializable;

public class ProfileBean implements Serializable {
    private String name;
    private String studentID;
    private String program;
    private String email;
    private String hobbies;
    private String selfIntroduction;

    public ProfileBean() {}

    public ProfileBean(String name, String studentID, String program, String email, String hobbies, String selfIntroduction) {
        this.name = name;
        this.studentID = studentID;
        this.program = program;
        this.email = email;
        this.hobbies = hobbies;
        this.selfIntroduction = selfIntroduction;
    }

    // Getters and Setters
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getStudentID() { return studentID; }
    public void setStudentID(String studentID) { this.studentID = studentID; }

    public String getProgram() { return program; }
    public void setProgram(String program) { this.program = program; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getHobbies() { return hobbies; }
    public void setHobbies(String hobbies) { this.hobbies = hobbies; }

    public String getSelfIntroduction() { return selfIntroduction; }
    public void setSelfIntroduction(String selfIntroduction) { this.selfIntroduction = selfIntroduction; }
}
