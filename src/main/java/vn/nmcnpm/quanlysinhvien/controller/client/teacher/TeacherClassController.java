package vn.nmcnpm.quanlysinhvien.controller.client.teacher;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nmcnpm.quanlysinhvien.domain.Classe;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.ClasseService;
import vn.nmcnpm.quanlysinhvien.service.TeacherService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

@Controller
public class TeacherClassController {

    private final TeacherService teacherService;
    private final ClasseService classeService;
    private final UserService userService;

    public TeacherClassController(TeacherService teacherService, ClasseService classeService, UserService userService) {
        this.teacherService = teacherService;
        this.classeService = classeService;
        this.userService = userService;
    }

    @GetMapping("/teacher/class")
    public String getTeacherClassPage(Model model, HttpServletRequest request,
            @RequestParam(name = "query", required = false) String query) {
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Teacher currentTeacher = this.teacherService.getTeacherByUser(currentUser);

        List<Classe> classes = this.classeService.getAllClassesByTeacherAndClassId(currentTeacher, query);

        model.addAttribute("classes", classes);
        return "client/teacher/class/show";
    }

    @GetMapping("/teacher/class/{id}")
    public String getClassStudentPage(Model model, @PathVariable long id) {
        Classe classe = this.classeService.getClasseById(id).get();

        List<Student> students = classe == null ? new ArrayList<>() : classe.getStudents();
        model.addAttribute("students", students);
        return "client/teacher/class/detail";
    }
}
