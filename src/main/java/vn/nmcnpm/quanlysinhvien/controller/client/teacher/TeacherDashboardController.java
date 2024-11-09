package vn.nmcnpm.quanlysinhvien.controller.client.teacher;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TeacherDashboardController {

    @GetMapping("/teacher")
    public String getTeacherDashboard(Model model) {
        return "client/teacher/dashboard/show";
    }
}
