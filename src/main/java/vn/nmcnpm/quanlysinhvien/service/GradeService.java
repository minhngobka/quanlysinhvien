package vn.nmcnpm.quanlysinhvien.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;
import vn.nmcnpm.quanlysinhvien.domain.Grade;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.dto.StudentGradeDTO;
import vn.nmcnpm.quanlysinhvien.repository.GradeReposity;

@Service
public class GradeService {

    private final GradeReposity gradeReposity;

    public GradeService(GradeReposity gradeReposity) {
        this.gradeReposity = gradeReposity;
    }

    public Optional<Grade> getGradeById(long id) {
        return this.gradeReposity.findById(id);
    }

    public Grade getGradeByStudentAndClassCourse(Student student, ClassCourse classCourse) {
        return this.gradeReposity.findByStudentAndClassCourse(student, classCourse);
    }

    public List<Grade> getGradeByStudentAndSemester(Student student, String semester) {
        List<Grade> grades = student.getGrades();
        List<Grade> currentGrades = new ArrayList<>();
        for (Grade grade : grades) {
            if (grade.getClassCourse().getSemester().equals(semester)) {
                currentGrades.add(grade);
            }
        }
        return currentGrades;
    }

    public void handleSaveGrade(Grade grade) {
        this.gradeReposity.save(grade);
    }

    public void deleteGradeById(long id) {
        this.gradeReposity.deleteById(id);
    }

    public StudentGradeDTO gradeToStudentGradeDTO(Grade grade) {
        StudentGradeDTO studentGradeDTO = new StudentGradeDTO();
        studentGradeDTO.setCourseId(grade.getClassCourse().getCourse().getCourseId());
        studentGradeDTO.setCourseName(grade.getClassCourse().getCourse().getName());
        studentGradeDTO.setCredits(grade.getClassCourse().getCourse().getTheoreticalCredits());
        studentGradeDTO.setSemester(grade.getClassCourse().getSemester());
        if (grade.getFinalSorce() < 4)
            studentGradeDTO.setCoursePoint("F");
        else if (grade.getFinalSorce() < 5)
            studentGradeDTO.setCoursePoint("D");
        else if (grade.getFinalSorce() < 5.5)
            studentGradeDTO.setCoursePoint("D+");
        else if (grade.getFinalSorce() < 6.5)
            studentGradeDTO.setCoursePoint("C");
        else if (grade.getFinalSorce() < 7)
            studentGradeDTO.setCoursePoint("C+");
        else if (grade.getFinalSorce() < 8)
            studentGradeDTO.setCoursePoint("B");
        else if (grade.getFinalSorce() < 8.5)
            studentGradeDTO.setCoursePoint("B+");
        else if (grade.getFinalSorce() < 9)
            studentGradeDTO.setCoursePoint("A");
        else if (grade.getFinalSorce() < 10)
            studentGradeDTO.setCoursePoint("A+");

        return studentGradeDTO;
    }
}
