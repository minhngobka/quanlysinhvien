package vn.nmcnpm.quanlysinhvien.domain.dto;

public class StudentGradeDTO {

    private String studentId;
    private String courseId;
    private String classCourseId;
    private String courseName;
    private int credits;
    private String coursePoint;
    private String midtermPoint;
    private String statusMidtermPoint;
    private String finalPoint;
    private String statusFinalPoint;
    private String semester;
    private String processWeight;

    public String getStatusMidtermPoint() {
        return statusMidtermPoint;
    }

    public void setStatusMidtermPoint(String statusMidtermPoint) {
        this.statusMidtermPoint = statusMidtermPoint;
    }

    public String getStatusFinalPoint() {
        return statusFinalPoint;
    }

    public void setStatusFinalPoint(String statusFinalPoint) {
        this.statusFinalPoint = statusFinalPoint;
    }

    public String getProcessWeight() {
        return processWeight;
    }

    public void setProcessWeight(String processWeight) {
        this.processWeight = processWeight;
    }

    public String getMidtermPoint() {
        return midtermPoint;
    }

    public void setMidtermPoint(String midtermPoint) {
        this.midtermPoint = midtermPoint;
    }

    public String getFinalPoint() {
        return finalPoint;
    }

    public void setFinalPoint(String finalPoint) {
        this.finalPoint = finalPoint;
    }

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

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getClassCourseId() {
        return classCourseId;
    }

    public void setClassCourseId(String classCourseId) {
        this.classCourseId = classCourseId;
    }

}
