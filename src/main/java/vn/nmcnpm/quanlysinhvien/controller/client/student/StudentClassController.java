package vn.nmcnpm.quanlysinhvien.controller.client.student;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nmcnpm.quanlysinhvien.domain.Classe;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

@Controller
public class StudentClassController {

    private final StudentService studentService;
    private final UserService userService;

    public StudentClassController(StudentService studentService, UserService userService) {
        this.studentService = studentService;
        this.userService = userService;
    }

    @GetMapping("/student/class")
    public String getStudentClassPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Student currentStudent = this.studentService.getStudentByUser(currentUser);

        Classe currentClass = currentStudent.getClasse();
        List<Student> students = currentClass.getStudents();

        model.addAttribute("currentClass", currentClass);
        model.addAttribute("students", students);

        return "client/student/class/show";
    }
}
