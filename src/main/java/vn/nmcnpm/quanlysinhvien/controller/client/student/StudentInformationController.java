package vn.nmcnpm.quanlysinhvien.controller.client.student;

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
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.UploadService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

@Controller
public class StudentInformationController {

    private final StudentService studentService;
    private final UserService userService;
    private final UploadService uploadService;

    public StudentInformationController(StudentService studentService, UserService userService,
            UploadService uploadService) {
        this.studentService = studentService;
        this.userService = userService;
        this.uploadService = uploadService;
    }

    @GetMapping("/student/infor")
    public String getStudentPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Student currentStudent = this.studentService.getStudentByUser(currentUser);

        model.addAttribute("currentStudent", currentStudent);

        return "client/student/infor/show";
    }

    @GetMapping("/student/infor/update/{id}")
    public String getUpdateStudentPage(Model model, @PathVariable long id) {
        Student currentStudent = this.studentService.getStudentById(id).get();
        model.addAttribute("currentStudent", currentStudent);
        return "client/student/infor/update";
    }

    @PostMapping("/student/infor/update")
    public String updateStudentPage(Model model,
            @ModelAttribute("currentStudent") Student student,
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
            ;
        }

        return "redirect:/student/infor";
    }
}
