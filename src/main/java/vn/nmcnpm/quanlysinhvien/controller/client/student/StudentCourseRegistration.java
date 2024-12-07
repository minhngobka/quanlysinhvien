package vn.nmcnpm.quanlysinhvien.controller.client.student;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;
import vn.nmcnpm.quanlysinhvien.domain.CourseRegistration;
import vn.nmcnpm.quanlysinhvien.domain.Grade;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.ClassCourseService;
import vn.nmcnpm.quanlysinhvien.service.CourseRegistrationService;
import vn.nmcnpm.quanlysinhvien.service.GradeService;
import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

@Controller
public class StudentCourseRegistration {

    private final UserService userService;
    private final StudentService studentService;
    private final ClassCourseService classCourseService;
    private final CourseRegistrationService courseRegistrationService;
    private final GradeService gradeService;

    public StudentCourseRegistration(UserService userService, StudentService studentService,
            ClassCourseService classCourseService, CourseRegistrationService courseRegistrationService,
            GradeService gradeService) {
        this.userService = userService;
        this.studentService = studentService;
        this.classCourseService = classCourseService;
        this.courseRegistrationService = courseRegistrationService;
        this.gradeService = gradeService;
    }

    @GetMapping("/student/course-registration")
    public String getStudentCourseRegistrationPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Student currentStudent = this.studentService.getStudentByUser(currentUser);

        List<CourseRegistration> currentCourseRegistrations = currentStudent.getCourseRegistrations();
        List<CourseRegistration> courseRegistrations = new ArrayList<>();
        for (CourseRegistration courseRegistration : currentCourseRegistrations) {
            if (courseRegistration.getClassCourse().getSemester().equals("20241"))
                courseRegistrations.add(courseRegistration);
        }

        List<ClassCourse> classCourses = this.classCourseService.getAllClassCoursesBySemester("20241");
        model.addAttribute("classCourses", classCourses);
        model.addAttribute("courseRegistrations", courseRegistrations);
        return "client/student/courseregistration/show";
    }

    // Đăng ký môn học
    @PostMapping("/student/course-registration/{id}")
    public String postStudentCourseRegistration(Model model, @PathVariable long id, HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        long studentId = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(studentId).get();

        Student currentStudent = this.studentService.getStudentByUser(currentUser);
        ClassCourse currentClassCourse = this.classCourseService.getClassCourseById(id).get();

        List<CourseRegistration> courseRegistrations = currentStudent.getCourseRegistrations();
        if (courseRegistrations != null) {
            int flag = 0;
            for (CourseRegistration courseRegistration : courseRegistrations) {
                if (courseRegistration.getClassCourse().getCourse().getId() == currentClassCourse.getCourse().getId()
                        && courseRegistration.getClassCourse().getSemester().equals(currentClassCourse.getSemester())) {
                    return "redirect:/student/course-registration";
                }
                if (courseRegistration.getClassCourse().getSemester().equals(currentClassCourse.getSemester())) {
                    if (courseRegistration.getClassCourse().getWeekday().equals(currentClassCourse.getWeekday())
                            && courseRegistration.getClassCourse().getTimePeriod()
                                    .equals(currentClassCourse.getTimePeriod())) {
                        String preiod1 = courseRegistration.getClassCourse().getPreiod();
                        String preiod2 = currentClassCourse.getPreiod();
                        int flag1 = preiod2.charAt(0) - preiod1.charAt(2);
                        int flag2 = preiod2.charAt(2) - preiod1.charAt(0);
                        if (flag1 == 0 || flag2 == 0) {
                            return "redirect:/student/course-registration";
                        }
                        if (flag1 > 0 && flag2 < 0) {
                            return "redirect:/student/course-registration";
                        }
                        if (flag1 < 0 && flag2 > 0) {
                            return "redirect:/student/course-registration";
                        }
                    }
                }
                flag++;
            }
            if (flag == courseRegistrations.size()) {
                CourseRegistration courseRegistration = new CourseRegistration();
                courseRegistration.setClassCourse(currentClassCourse);
                courseRegistration.setStudent(currentStudent);
                courseRegistration.setStatus("Đã gửi");
                this.courseRegistrationService.handleSaveCourseRegistration(courseRegistration);

            }
        }

        return "redirect:/student/course-registration";
    }

    // Hủy đăng ký môn học
    @GetMapping("/student/course-registration/{id}")
    public String deleteStudentCourseRegistration(Model model, @PathVariable long id) {

        CourseRegistration currentCourseRegistration = this.courseRegistrationService.getCourseRegistrationById(id)
                .get();
        currentCourseRegistration.setStatus("Đã xóa");

        return "redirect:/student/course-registration";
    }

    @GetMapping("/student/course-registration/access")
    public String deleteAllStudentCourseRegistration(Model model) {

        List<CourseRegistration> courseRegistrations = this.courseRegistrationService
                .getAllCourseRegistrationsByStatus("Đã xóa");
        for (CourseRegistration courseRegistration : courseRegistrations) {
            Student currentStudent = courseRegistration.getStudent();
            List<Grade> grades = currentStudent.getGrades();
            for (Grade grade : grades) {
                if (grade.getClassCourse().getId() == courseRegistration.getClassCourse().getId()) {
                    this.gradeService.deleteGradeById(grade.getId());
                    break;
                }
            }
        }

        for (CourseRegistration courseRegistration : courseRegistrations) {
            this.courseRegistrationService.deleteCourseRegistrationById(courseRegistration.getId());
        }

        List<CourseRegistration> courseRegistrations2 = this.courseRegistrationService
                .getAllCourseRegistrationsByStatus("Đã gửi");
        for (CourseRegistration courseRegistration : courseRegistrations2) {
            courseRegistration.setStatus("Thành Công");
            Grade grade = new Grade();
            grade.setStudent(courseRegistration.getStudent());
            grade.setClassCourse(courseRegistration.getClassCourse());
            grade.setMidtermSorce(-1);
            grade.setFinalSorce(-1);
            this.gradeService.handleSaveGrade(grade);
        }

        return "redirect:/student/course-registration";
    }

}
