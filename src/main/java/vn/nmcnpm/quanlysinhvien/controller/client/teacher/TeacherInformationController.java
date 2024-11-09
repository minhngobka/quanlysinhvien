package vn.nmcnpm.quanlysinhvien.controller.client.teacher;

import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.TeacherService;
import vn.nmcnpm.quanlysinhvien.service.UploadService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

@Controller
public class TeacherInformationController {

    private final UserService userService;
    private final TeacherService teacherService;
    private final UploadService uploadService;

    public TeacherInformationController(UserService userService, TeacherService teacherService,
            UploadService uploadService) {
        this.userService = userService;
        this.teacherService = teacherService;
        this.uploadService = uploadService;
    }

    @GetMapping("/teacher/infor")
    public String getTeacherDashboard(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Teacher currentTeacher = this.teacherService.getTeacherByUser(currentUser);

        model.addAttribute("currentTeacher", currentTeacher);

        return "client/teacher/infor/show";
    }

    @GetMapping("/teacher/infor/update/{id}")
    public String getUpdateTeacherPage(Model model, @PathVariable long id) {
        Teacher currentTeacher = this.teacherService.getTeacherById(id).get();
        model.addAttribute("currentTeacher", currentTeacher);
        return "client/teacher/infor/update";
    }

    @PostMapping("/teacher/infor/update")
    public String updateTeacherPage(Model model,
            @ModelAttribute("currentTeacher") Teacher teacher,
            @RequestParam("teacherAvatarFile") MultipartFile file) {

        Optional<Teacher> teacherOptional = this.teacherService.getTeacherById(teacher.getId());
        if (teacherOptional.isPresent()) {
            Teacher currentTeacher = teacherOptional.get();
            if (!file.isEmpty()) {
                String imageProduct = this.uploadService.handleSaveUpload(file, "teacher");
                currentTeacher.setAvatar(imageProduct);
            }

            currentTeacher.setFullName(teacher.getFullName());
            currentTeacher.setPhone(teacher.getPhone());
            currentTeacher.setAddress(teacher.getAddress());
            currentTeacher.setBirthDate(teacher.getBirthDate());
            currentTeacher.setGender(teacher.getGender());

            this.teacherService.handleSaveTeacher(currentTeacher);
        }

        return "redirect:/teacher/infor";
    }
}
