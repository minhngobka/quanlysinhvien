package vn.nmcnpm.quanlysinhvien.controller.client.teacher;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;
import vn.nmcnpm.quanlysinhvien.domain.CourseRegistration;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.ClassCourseService;
import vn.nmcnpm.quanlysinhvien.service.TeacherService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

@Controller
public class TeacherClassCourseController {
    private final TeacherService teacherService;
    private final UserService userService;
    private final ClassCourseService classCourseService;

    public TeacherClassCourseController(TeacherService teacherService, UserService userService,
            ClassCourseService classCourseService) {
        this.teacherService = teacherService;
        this.userService = userService;
        this.classCourseService = classCourseService;
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

    @GetMapping("/teacher/class-course/{id}")
    public String getTeacherClassCourseDetailPage(Model model, @PathVariable long id) {
        ClassCourse classCourse = this.classCourseService.getClassCourseById(id).get();
        List<CourseRegistration> courseRegistrations = classCourse.getCourseRegistrations();
        model.addAttribute("courseRegistrations", courseRegistrations);
        return "client/teacher/classcourse/detail";
    }
}
