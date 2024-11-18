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

import vn.nmcnpm.quanlysinhvien.domain.Classe;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.ClasseService;
import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.UploadService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

@Controller
public class StudentController {

    private final UserService userService;
    private final UploadService uploadService;
    private final StudentService studentService;
    private final PasswordEncoder passwordEncoder;
    private final ClasseService classeService;

    public StudentController(UserService userService, UploadService uploadService, StudentService studentService,
            PasswordEncoder passwordEncoder, ClasseService classeService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.studentService = studentService;
        this.passwordEncoder = passwordEncoder;
        this.classeService = classeService;
    }

    @GetMapping("/admin/student")
    public String getStudentPage(Model model,
            @RequestParam(name = "query", required = false) String query) {
        List<Student> students = this.studentService.getAllStudentsByStudentIdOrFullName(query);
        model.addAttribute("students", students);
        return "admin/student/show";
    }

    @GetMapping("/admin/student/{id}")
    public String getStudentDetailPage(Model model, @PathVariable long id) {
        Student student = this.studentService.getStudentById(id).get();
        model.addAttribute("id", id);
        model.addAttribute("student", student);
        return "admin/student/detail";
    }

    @GetMapping("/admin/student/create")
    public String getCreateStudentPage(Model model) {
        List<Classe> classes = this.classeService.getAllClasses();
        model.addAttribute("classes", classes);
        model.addAttribute("newStudent", new Student());
        return "admin/student/create";
    }

    @PostMapping(value = "/admin/student/create")
    public String createStudentPage(Model model,
            @ModelAttribute("newStudent") @Valid Student student,
            BindingResult newStudentBindingResult,
            @RequestParam("studentAvatarFile") MultipartFile file) {

        if (newStudentBindingResult.hasErrors()) {
            List<Classe> classes = this.classeService.getAllClasses();
            model.addAttribute("classes", classes);
            return "admin/student/create";
        }

        String avatar = this.uploadService.handleSaveUpload(file, "student");
        String hashPassword = this.passwordEncoder.encode(student.getUser().getPassword());

        User user = new User();
        user.setEmail(student.getUser().getEmail());
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("STUDENT"));
        this.userService.handleSaveUser(user);

        student.setAvatar(avatar);
        student.setUser(user);
        this.studentService.handleSaveStudent(student);

        return "redirect:/admin/student";
    }

    @GetMapping("/admin/student/update/{id}")
    public String getUpdateStudentPage(Model model, @PathVariable long id) {
        Student currentStudent = this.studentService.getStudentById(id).get();
        List<Classe> classes = this.classeService.getAllClasses();
        model.addAttribute("classes", classes);
        model.addAttribute("newStudent", currentStudent);
        return "admin/student/update";
    }

    @PostMapping("/admin/student/update")
    public String updateStudentPage(Model model,
            @ModelAttribute("newStudent") Student student,
            @RequestParam("studentAvatarFile") MultipartFile file) {

        Optional<Student> studentOptional = this.studentService.getStudentById(student.getId());
        if (studentOptional.isPresent()) {
            Student currentStudent = studentOptional.get();
            if (!file.isEmpty()) {
                String imageProduct = this.uploadService.handleSaveUpload(file, "student");
                currentStudent.setAvatar(imageProduct);
            }

            currentStudent.setFullName(student.getFullName());
            currentStudent.setPhone(student.getPhone());
            currentStudent.setAddress(student.getAddress());
            currentStudent.setBirthDate(student.getBirthDate());
            currentStudent.setGender(student.getGender());
            currentStudent.setClasse(student.getClasse());

            this.studentService.handleSaveStudent(currentStudent);
        }

        return "redirect:/admin/student";
    }

    @GetMapping("/admin/student/delete/{id}")
    public String getDeleteStudentPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newStudent", new User());
        return "admin/student/delete";
    }

    @PostMapping("/admin/student/delete")
    public String postDeleteStudentPage(Model model, @ModelAttribute("newStudent") Student student) {
        this.studentService.deleteStudentById(student.getId());
        return "redirect:/admin/student";
    }
}
