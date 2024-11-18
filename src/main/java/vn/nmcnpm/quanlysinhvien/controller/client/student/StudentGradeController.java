package vn.nmcnpm.quanlysinhvien.controller.client.student;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import vn.nmcnpm.quanlysinhvien.domain.Course;
import vn.nmcnpm.quanlysinhvien.domain.Grade;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.domain.dto.CourseDTO;
import vn.nmcnpm.quanlysinhvien.service.CourseService;
import vn.nmcnpm.quanlysinhvien.service.GradeService;
import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentGradeController {

    private final StudentService studentService;
    private final UserService userService;
    private final GradeService gradeService;
    private final CourseService courseService;

    public StudentGradeController(StudentService studentService, UserService userService, GradeService gradeService,
            CourseService courseService) {
        this.studentService = studentService;
        this.userService = userService;
        this.gradeService = gradeService;
        this.courseService = courseService;
    }

    @GetMapping("/student/grade")
    public String getStudentGradePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Student currentStudent = this.studentService.getStudentByUser(currentUser);

        List<Grade> grades = currentStudent.getGrades();

        model.addAttribute("grades", grades);

        return "client/student/grade/show";
    }

    @GetMapping("/student/grade/{id}")
    public String getStudentDetailGradePage(Model model, @PathVariable long id) {
        Grade currentGrade = this.gradeService.getGradeById(id).get();
        Course course = currentGrade.getClassCourse().getCourse();

        CourseDTO courseDTO = this.courseService.courseToCourseDTO(course);

        model.addAttribute("courseDTO", courseDTO);
        model.addAttribute("currentGrade", currentGrade);

        return "client/student/grade/detail";
    }

}
