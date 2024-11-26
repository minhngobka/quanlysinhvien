package vn.nmcnpm.quanlysinhvien.domain.dto;

public class StudentGradeDTO {

    private String courseId;
    private String courseName;
    private int credits;
    private String coursePoint;
    private String semester;

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public String getCoursePoint() {
        return coursePoint;
    }

    public void setCoursePoint(String coursePoint) {
        this.coursePoint = coursePoint;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

}
