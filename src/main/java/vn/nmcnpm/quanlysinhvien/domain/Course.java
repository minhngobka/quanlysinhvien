package vn.nmcnpm.quanlysinhvien.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "courses")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull
    @NotEmpty(message = "Không để trống mã môn học")
    private String courseId;

    @NotNull
    @NotEmpty(message = "Không để trống tên môn học")
    private String name;

    @NotNull
    @Min(value = 1, message = "TCLT phải lớn hơn 0")
    private int theoreticalCredits;
    private int practicalCredits;

    @NotNull
    @Min(value = 1, message = "TCBT phải lớn hơn 0")
    private int execiseCredits;

    @NotNull
    @NotEmpty(message = "Không được để trống hệ số điểm")
    private String coefficient;

    @ManyToOne
    @JoinColumn(name = "department_id")
    private Department department;

    @OneToMany(mappedBy = "course")
    private List<ClassCourse> classCourses;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTheoreticalCredits() {
        return theoreticalCredits;
    }

    public void setTheoreticalCredits(int theoreticalCredits) {
        this.theoreticalCredits = theoreticalCredits;
    }

    public int getPracticalCredits() {
        return practicalCredits;
    }

    public void setPracticalCredits(int practicalCredits) {
        this.practicalCredits = practicalCredits;
    }

    public int getExeciseCredits() {
        return execiseCredits;
    }

    public void setExeciseCredits(int execiseCredits) {
        this.execiseCredits = execiseCredits;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public List<ClassCourse> getClassCourses() {
        return classCourses;
    }

    public void setClassCourses(List<ClassCourse> classCourses) {
        this.classCourses = classCourses;
    }

    public String getCoefficient() {
        return coefficient;
    }

    public void setCoefficient(String coefficient) {
        this.coefficient = coefficient;
    }

}
