package vn.nmcnpm.quanlysinhvien.controller.client.teacher;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.ClassCourseService;
import vn.nmcnpm.quanlysinhvien.service.ClasseService;
import vn.nmcnpm.quanlysinhvien.service.TeacherService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

@Controller
public class TeacherDashboardController {

    private final ClasseService classeService;
    private final ClassCourseService classCourseService;
    private final UserService userService;
    private final TeacherService teacherService;

    public TeacherDashboardController(ClasseService classeService, ClassCourseService classCourseService,
            UserService userService, TeacherService teacherService) {
        this.classeService = classeService;
        this.classCourseService = classCourseService;
        this.userService = userService;
        this.teacherService = teacherService;
    }

    @GetMapping("/teacher")
    public String getTeacherDashboard(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Teacher currentTeacher = this.teacherService.getTeacherByUser(currentUser);

        model.addAttribute("countClassesByTeacher", this.classeService.countClassesByTeacher(currentTeacher));
        model.addAttribute("countClassCoursesByTeacher",
                this.classCourseService.countClassCoursesByTeacher(currentTeacher));

        return "client/teacher/dashboard/show";
    }
}
