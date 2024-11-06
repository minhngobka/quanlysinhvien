package vn.nmcnpm.quanlysinhvien.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.TeacherService;

import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    private final StudentService studentService;
    private final TeacherService teacherService;

    public DashboardController(StudentService studentService, TeacherService teacherService) {
        this.studentService = studentService;
        this.teacherService = teacherService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countStudents", this.studentService.countStudents());
        model.addAttribute("countTeachers", this.teacherService.countTeachers());
        return "admin/dashboard/show";
    }

}
