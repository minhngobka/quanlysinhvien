package vn.nmcnpm.quanlysinhvien.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "class_courses")
public class ClassCourse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String classCourseId;
    private String semester;
    private String classRoom;
    private String preiod;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    @ManyToOne
    @JoinColumn(name = "teacher_id")
    private Teacher teacher;

    @OneToMany(mappedBy = "classCourse")
    private List<Grade> grades;

    @OneToOne(mappedBy = "classCourse")
    private CourseRegistration courseRegistration;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getClassCourseId() {
        return classCourseId;
    }

    public void setClassCourseId(String classCourseId) {
        this.classCourseId = classCourseId;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getClassRoom() {
        return classRoom;
    }

    public void setClassRoom(String classRoom) {
        this.classRoom = classRoom;
    }

    public String getPreiod() {
        return preiod;
    }

    public void setPreiod(String preiod) {
        this.preiod = preiod;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public List<Grade> getGrades() {
        return grades;
    }

    public void setGrades(List<Grade> grades) {
        this.grades = grades;
    }

    public CourseRegistration getCourseRegistration() {
        return courseRegistration;
    }

    public void setCourseRegistration(CourseRegistration courseRegistration) {
        this.courseRegistration = courseRegistration;
    }

}
