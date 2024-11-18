package vn.nmcnpm.quanlysinhvien.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.TeacherService;
import vn.nmcnpm.quanlysinhvien.service.UploadService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

@Controller
public class TeacherController {

    private UserService userService;
    private UploadService uploadService;
    private TeacherService teacherService;
    private PasswordEncoder passwordEncoder;

    public TeacherController(UserService userService, UploadService uploadService, TeacherService teacherService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.teacherService = teacherService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/teacher")
    public String getTeacherPage(Model model,
            @RequestParam(name = "query", required = false) String query) {
        List<Teacher> teachers = this.teacherService.getAllTeachersByFullName(query);
        model.addAttribute("teachers", teachers);
        return "admin/teacher/show";
    }

    @GetMapping("/admin/teacher/{id}")
    public String getStudentDetailPage(Model model, @PathVariable long id) {
        Teacher teacher = this.teacherService.getTeacherById(id).get();
        model.addAttribute("id", id);
        model.addAttribute("teacher", teacher);
        return "admin/teacher/detail";
    }

    @GetMapping("/admin/teacher/create")
    public String getCreateTeacherPage(Model model) {
        model.addAttribute("newTeacher", new Teacher());
        return "admin/teacher/create";
    }

    @PostMapping(value = "/admin/teacher/create")
    public String createTeacherPage(Model model,
            @ModelAttribute("newTeacher") @Valid Teacher teacher,
            BindingResult newTeacherBindingResult,
            @RequestParam("teacherAvatarFile") MultipartFile file) {

        if (newTeacherBindingResult.hasErrors()) {
            return "admin/teacher/create";
        }

        String avatar = this.uploadService.handleSaveUpload(file, "teacher");
        String hashPassword = this.passwordEncoder.encode(teacher.getUser().getPassword());

        User user = new User();
        user.setEmail(teacher.getUser().getEmail());
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName(teacher.getUser().getRole().getName()));
        this.userService.handleSaveUser(user);

        teacher.setAvatar(avatar);
        teacher.setUser(user);
        this.teacherService.handleSaveTeacher(teacher);

        return "redirect:/admin/teacher";
    }

    @GetMapping("/admin/teacher/update/{id}")
    public String getUpdateTeacherPage(Model model, @PathVariable long id) {
        Teacher currentTeacher = this.teacherService.getTeacherById(id).get();
        model.addAttribute("newTeacher", currentTeacher);
        return "admin/teacher/update";
    }

    @PostMapping("/admin/teacher/update")
    public String updateTeacherPage(Model model,
            @ModelAttribute("newTeacher") Teacher teacher,
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

        return "redirect:/admin/teacher";
    }

    @GetMapping("/admin/teacher/delete/{id}")
    public String getDeleteTeacherPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newTeacher", new Teacher());
        return "admin/teacher/delete";
    }

    @PostMapping("/admin/teacher/delete")
    public String postDeleteTeacherPage(Model model, @ModelAttribute("newTeacher") Teacher teacher) {
        this.teacherService.deleteTeacherById(teacher.getId());
        return "redirect:/admin/teacher";
    }
}
