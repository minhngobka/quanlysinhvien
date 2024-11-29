package vn.nmcnpm.quanlysinhvien.controller.client.student;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import vn.nmcnpm.quanlysinhvien.domain.Grade;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.domain.dto.StudentGradeDTO;
import vn.nmcnpm.quanlysinhvien.service.GradeService;
import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentGradeController {

    private final StudentService studentService;
    private final UserService userService;
    private final GradeService gradeService;

    public StudentGradeController(StudentService studentService, UserService userService, GradeService gradeService) {
        this.studentService = studentService;
        this.userService = userService;
        this.gradeService = gradeService;
    }

    @GetMapping("/student/student-course-grade")
    public String getStudentGradePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Student currentStudent = this.studentService.getStudentByUser(currentUser);
        List<Grade> grades = currentStudent.getGrades();
        List<StudentGradeDTO> studentGradeDTOs = new ArrayList<>();
        int countStudentCredits = 0;
        for (Grade grade : grades) {
            if (grade.getMidtermSorce() != -1 || grade.getFinalSorce() != -1) {
                studentGradeDTOs.add(this.gradeService.gradeToStudentGradeDTO(grade));
                countStudentCredits += grade.getClassCourse().getCourse().getTheoreticalCredits();
            }
        }
        studentGradeDTOs.sort(Comparator.comparing((StudentGradeDTO s) -> s.getSemester()).reversed());

        model.addAttribute("countStudentCourses", studentGradeDTOs.size());
        model.addAttribute("countStudentCredits", countStudentCredits);
        model.addAttribute("studentGradeDTOs", studentGradeDTOs);

        return "client/student/grade/studentcoursegrade";
    }

    @GetMapping("/student/student-check-input-grade-term")
    public String getStudentCheckInputGradeTermPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Student currentStudent = this.studentService.getStudentByUser(currentUser);

        List<Grade> grades = this.gradeService.getGradeByStudentAndSemester(currentStudent, "20241");
        List<StudentGradeDTO> studentGradeDTOs = new ArrayList<>();
        for (Grade grade : grades) {
            studentGradeDTOs.add(this.gradeService.gradeToStudentGradeDTO(grade));
        }
        model.addAttribute("studentGradeDTOs", studentGradeDTOs);

        return "client/student/grade/studentcheckinputgradeterm";
    }

}
