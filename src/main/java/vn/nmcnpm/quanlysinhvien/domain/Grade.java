package vn.nmcnpm.quanlysinhvien.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "grades")
public class Grade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private double midtermSorce;
    private double finalSorce;
    private double totalSorce;
    private String coefficient;
    private String comment;
    private String gradeEntryDate;

    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;

    @ManyToOne
    @JoinColumn(name = "class_course_id")
    private ClassCourse classCourse;

    @ManyToOne
    @JoinColumn(name = "teacher_id")
    private Teacher teacher;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public double getMidtermSorce() {
        return midtermSorce;
    }

    public void setMidtermSorce(double midtermSorce) {
        this.midtermSorce = midtermSorce;
    }

    public double getFinalSorce() {
        return finalSorce;
    }

    public void setFinalSorce(double finalSorce) {
        this.finalSorce = finalSorce;
    }

    public double getTotalSorce() {
        return totalSorce;
    }

    public void setTotalSorce(double totalSorce) {
        this.totalSorce = totalSorce;
    }

    public String getCoefficient() {
        return coefficient;
    }

    public void setCoefficient(String coefficient) {
        this.coefficient = coefficient;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getGradeEntryDate() {
        return gradeEntryDate;
    }

    public void setGradeEntryDate(String gradeEntryDate) {
        this.gradeEntryDate = gradeEntryDate;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public ClassCourse getClassCourse() {
        return classCourse;
    }

    public void setClassCourse(ClassCourse classCourse) {
        this.classCourse = classCourse;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

}
