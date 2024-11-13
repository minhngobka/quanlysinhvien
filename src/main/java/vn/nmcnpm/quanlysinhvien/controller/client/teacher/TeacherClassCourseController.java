package vn.nmcnpm.quanlysinhvien.controller.client.teacher;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.TeacherService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

@Controller
public class TeacherClassCourseController {
    private final TeacherService teacherService;
    private final UserService userService;

    public TeacherClassCourseController(TeacherService teacherService, UserService userService) {
        this.teacherService = teacherService;
        this.userService = userService;
    }

    @GetMapping("/teacher/class-course")
    public String getTeacherClassCoursePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Teacher currentTeacher = this.teacherService.getTeacherByUser(currentUser);

        List<ClassCourse> classCourses = currentTeacher.getClassCourses();
        model.addAttribute("classCourses", classCourses);
        return "client/teacher/classcourse/show";
    }
}
