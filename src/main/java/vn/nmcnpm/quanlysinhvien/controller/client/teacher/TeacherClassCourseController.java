package vn.nmcnpm.quanlysinhvien.controller.client.teacher;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;
import vn.nmcnpm.quanlysinhvien.domain.CourseRegistration;
import vn.nmcnpm.quanlysinhvien.domain.Grade;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.ClassCourseService;
import vn.nmcnpm.quanlysinhvien.service.CourseRegistrationService;
import vn.nmcnpm.quanlysinhvien.service.GradeService;
import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.TeacherService;
import vn.nmcnpm.quanlysinhvien.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TeacherClassCourseController {
    private final TeacherService teacherService;
    private final UserService userService;
    private final ClassCourseService classCourseService;
    private final StudentService studentService;
    private final GradeService gradeService;
    private final CourseRegistrationService courseRegistrationService;

    public TeacherClassCourseController(TeacherService teacherService, UserService userService,
            ClassCourseService classCourseService, StudentService studentService, GradeService gradeService,
            CourseRegistrationService courseRegistrationService) {
        this.teacherService = teacherService;
        this.userService = userService;
        this.classCourseService = classCourseService;
        this.studentService = studentService;
        this.gradeService = gradeService;
        this.courseRegistrationService = courseRegistrationService;
    }

    @GetMapping("/teacher/class-course")
    public String getTeacherClassCoursePage(Model model, HttpServletRequest request,
            @RequestParam(name = "query", required = false) String query) {
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Teacher currentTeacher = this.teacherService.getTeacherByUser(currentUser);

        List<ClassCourse> classCourses = this.classCourseService.getAllClassCoursesByTeacherAndSemester(query,
                currentTeacher);
        model.addAttribute("classCourses", classCourses);
        return "client/teacher/classcourse/show";
    }

    @GetMapping("/teacher/class-course/{id}")
    public String getTeacherClassCourseDetailPage(Model model, @PathVariable long id,
            @RequestParam(name = "query", required = false) String query) {
        ClassCourse classCourse = this.classCourseService.getClassCourseById(id).get();
        List<CourseRegistration> courseRegistrations = this.courseRegistrationService
                .getAllCourseRegistrationsByStudentIdOrStudentName(classCourse, query);
        model.addAttribute("courseRegistrations", courseRegistrations);
        return "client/teacher/classcourse/detail";
    }

    @GetMapping("/teacher/class-course/{classCourseId}/{studentId}")
    public String getTeacherStudentPage(Model model,
            @PathVariable long classCourseId,
            @PathVariable long studentId) {
        Student currentStudent = this.studentService.getStudentById(studentId).get();
        ClassCourse currentClassCourse = this.classCourseService.getClassCourseById(classCourseId).get();

        Grade currentGrade = this.gradeService.getGradeByStudentAndClassCourse(currentStudent, currentClassCourse);
        model.addAttribute("newGrade", currentGrade);

        return "client/teacher/classcourse/studentdetail";
    }

    @PostMapping("/teacher/class-course/{classCourseId}/{studentId}")
    public String postTeacherStudentPage(Model model,
            @ModelAttribute("newGrade") Grade grade,
            @PathVariable long classCourseId,
            @PathVariable long studentId) {

        Grade currentGrade = this.gradeService.getGradeById(grade.getId()).get();

        currentGrade.setClassCourse(this.classCourseService.getClassCourseById(classCourseId).get());
        currentGrade.setStudent(this.studentService.getStudentById(studentId).get());
        String coefficient = currentGrade.getClassCourse().getCourse().getCoefficient();
        List<Double> coefficientList = Arrays.stream(coefficient.split("-"))
                .map(Double::valueOf)
                .collect(Collectors.toList());

        double totalSorce = grade.getMidtermSorce() * coefficientList.get(0)
                + grade.getFinalSorce() * coefficientList.get(1);
        currentGrade.setMidtermSorce(grade.getMidtermSorce());
        currentGrade.setFinalSorce(grade.getFinalSorce());
        currentGrade.setTotalSorce((double) Math.round(totalSorce * 10) / 10);

        Date dNow = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss");
        currentGrade.setGradeEntryDate(ft.format(dNow));

        this.gradeService.handleSaveGrade(currentGrade);
        return "redirect:/teacher/class-course/{classCourseId}/{studentId}";
    }
}
