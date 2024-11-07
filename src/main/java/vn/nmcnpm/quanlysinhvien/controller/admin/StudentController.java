package vn.nmcnpm.quanlysinhvien.controller.admin;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.UploadService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.ConstraintViolation;
import jakarta.validation.Valid;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;

@Controller
public class StudentController {

    private final UserService userService;
    private final UploadService uploadService;
    private final StudentService studentService;

    public StudentController(UserService userService, UploadService uploadService, StudentService studentService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.studentService = studentService;
    }

    @GetMapping("/admin/student")
    public String getStudentPage(Model model) {
        List<Student> students = this.studentService.getAllStudents();
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
        model.addAttribute("newStudent", new Student());
        return "admin/student/create";
    }

    @PostMapping(value = "/admin/student/create")
    public String createStudentPage(Model model,
            @ModelAttribute("newStudent") @Valid Student student,
            BindingResult newStudentBindingResult,
            @RequestParam("studentAvatarFile") MultipartFile file) {

        if (newStudentBindingResult.hasErrors()) {
            return "/admin/student/create";
        }

        // Kiểm tra lỗi của đối tượng user được liên kết
        User currentUser = student.getUser();
        if (currentUser != null) {
            ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
            Validator validator = factory.getValidator();
            Set<ConstraintViolation<User>> violations = validator.validate(currentUser);

            if (!violations.isEmpty()) {
                for (ConstraintViolation<User> violation : violations) {
                    String propertyPath = violation.getPropertyPath().toString();
                    String message = violation.getMessage();

                    // Kiểm tra thuộc tính và gán lỗi vào đúng trường
                    if ("email".equals(propertyPath)) {
                        newStudentBindingResult.rejectValue("user.email", "error.user.email", message);
                    } else if ("password".equals(propertyPath)) {
                        newStudentBindingResult.rejectValue("user.password", "error.user.password", message);
                    }

                }
                return "/admin/student/create";
            }
        }

        String avatar = this.uploadService.handleSaveUpload(file, "student");

        User user = new User();
        user.setEmail(student.getUser().getEmail());
        user.setPassword(student.getUser().getPassword());
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
