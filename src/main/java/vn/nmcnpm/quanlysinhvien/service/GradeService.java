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
        studentGradeDTO.setStudentId(grade.getStudent().getStudentId());
        studentGradeDTO.setCourseId(grade.getClassCourse().getCourse().getCourseId());
        studentGradeDTO.setClassCourseId(grade.getClassCourse().getClassCourseId());
        studentGradeDTO.setCourseName(grade.getClassCourse().getCourse().getName());
        studentGradeDTO.setCredits(grade.getClassCourse().getCourse().getTheoreticalCredits());
        String processWeight = grade.getClassCourse().getCourse().getCoefficient();
        studentGradeDTO.setProcessWeight(processWeight.substring(0, 3));
        studentGradeDTO.setSemester(grade.getClassCourse().getSemester());
        if (grade.getMidtermSorce() != -1) {
            studentGradeDTO.setMidtermPoint(grade.getMidtermSorce() + "");
            studentGradeDTO.setStatusMidtermPoint("mới nhập");
        } else {
            studentGradeDTO.setStatusMidtermPoint("chưa nhập");
            studentGradeDTO.setMidtermPoint("--");
        }
        if (grade.getFinalSorce() != -1) {
            studentGradeDTO.setFinalPoint(grade.getFinalSorce() + "");
            studentGradeDTO.setStatusFinalPoint("mới nhập");
        } else {
            studentGradeDTO.setFinalPoint("--");
            studentGradeDTO.setStatusFinalPoint("chưa nhập");
        }
        if (grade.getMidtermSorce() != -1 && grade.getFinalSorce() != -1) {
            if (grade.getTotalSorce() < 4)
                studentGradeDTO.setCoursePoint("F");
            else if (grade.getTotalSorce() < 5)
                studentGradeDTO.setCoursePoint("D");
            else if (grade.getTotalSorce() < 5.5)
                studentGradeDTO.setCoursePoint("D+");
            else if (grade.getTotalSorce() < 6.5)
                studentGradeDTO.setCoursePoint("C");
            else if (grade.getTotalSorce() < 7)
                studentGradeDTO.setCoursePoint("C+");
            else if (grade.getTotalSorce() < 8)
                studentGradeDTO.setCoursePoint("B");
            else if (grade.getTotalSorce() < 8.5)
                studentGradeDTO.setCoursePoint("B+");
            else if (grade.getTotalSorce() < 9.5)
                studentGradeDTO.setCoursePoint("A");
            else if (grade.getTotalSorce() <= 10)
                studentGradeDTO.setCoursePoint("A+");
        }

        return studentGradeDTO;
    }
}
