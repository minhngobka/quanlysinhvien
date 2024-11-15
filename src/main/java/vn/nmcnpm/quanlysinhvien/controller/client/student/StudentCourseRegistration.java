package vn.nmcnpm.quanlysinhvien.controller.client.student;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;
import vn.nmcnpm.quanlysinhvien.domain.CourseRegistration;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.ClassCourseService;
import vn.nmcnpm.quanlysinhvien.service.CourseRegistrationService;
import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

@Controller
public class StudentCourseRegistration {

    private final UserService userService;
    private final StudentService studentService;
    private final ClassCourseService classCourseService;
    private final CourseRegistrationService courseRegistrationService;

    public StudentCourseRegistration(UserService userService, StudentService studentService,
            ClassCourseService classCourseService, CourseRegistrationService courseRegistrationService) {
        this.userService = userService;
        this.studentService = studentService;
        this.classCourseService = classCourseService;
        this.courseRegistrationService = courseRegistrationService;
    }

    @GetMapping("/student/course-registration")
    public String getStudentCourseRegistrationPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Student currentStudent = this.studentService.getStudentByUser(currentUser);

        List<CourseRegistration> courseRegistrations = currentStudent.getCourseRegistrations();

        List<ClassCourse> classCourses = this.classCourseService.getAllClassCourses();
        model.addAttribute("classCourses", classCourses);
        model.addAttribute("courseRegistrations", courseRegistrations);
        return "client/student/courseregistration/show";
    }

    // Đăng ký môn học
    @GetMapping("/student/course-registration/{id}")
    public String postStudentCourseRegistration(Model model, @PathVariable long id, HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        long studentId = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(studentId).get();
        Student currentStudent = this.studentService.getStudentByUser(currentUser);

        ClassCourse currentClassCourse = this.classCourseService.getClassCourseById(id).get();

        CourseRegistration courseRegistration = new CourseRegistration();
        courseRegistration.setClassCourse(currentClassCourse);
        courseRegistration.setStudent(currentStudent);
        courseRegistration.setStatus("Thành Công");

        this.courseRegistrationService.handleSaveCourseRegistration(courseRegistration);

        return "redirect:/student/course-registration";
    }

}
