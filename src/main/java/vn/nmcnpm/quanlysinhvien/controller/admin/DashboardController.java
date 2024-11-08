package vn.nmcnpm.quanlysinhvien.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import vn.nmcnpm.quanlysinhvien.service.CourseService;
import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.TeacherService;

import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    private final StudentService studentService;
    private final TeacherService teacherService;
    private final CourseService courseService;

    public DashboardController(StudentService studentService, TeacherService teacherService,
            CourseService courseService) {
        this.studentService = studentService;
        this.teacherService = teacherService;
        this.courseService = courseService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countStudents", this.studentService.countStudents());
        model.addAttribute("countTeachers", this.teacherService.countTeachers());
        model.addAttribute("countCourses", this.courseService.countCourses());
        return "admin/dashboard/show";
    }

}
