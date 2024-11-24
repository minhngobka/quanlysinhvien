package vn.nmcnpm.quanlysinhvien.controller.client.student;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;
import vn.nmcnpm.quanlysinhvien.domain.CourseRegistration;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.ClassCourseService;
import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

@Controller
public class StudentTimeTableController {

    private final UserService userService;
    private final StudentService studentService;
    private final ClassCourseService classCourseService;

    public StudentTimeTableController(UserService userService, StudentService studentService,
            ClassCourseService classCourseService) {
        this.userService = userService;
        this.studentService = studentService;
        this.classCourseService = classCourseService;
    }

    @GetMapping("/student/timetable")
    public String getStudentTimeTablePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Student currentStudent = this.studentService.getStudentByUser(currentUser);

        List<ClassCourse> classCoursesMonday = this.classCourseService.getAllClassCoursesBySemesterAndWeekday("20241",
                "2");
        List<CourseRegistration> courseRegistrationsMonday = new ArrayList<>();
        if (classCoursesMonday != null) {
            for (ClassCourse classCourseMonday : classCoursesMonday) {
                List<CourseRegistration> currentCourseRegistrations = classCourseMonday.getCourseRegistrations();
                for (CourseRegistration courseRegistration : currentCourseRegistrations) {
                    if (courseRegistration.getStudent().getId() == currentStudent.getId()) {
                        courseRegistrationsMonday.add(courseRegistration);
                    }
                }
            }
        }

        List<ClassCourse> classCoursesTuesday = this.classCourseService.getAllClassCoursesBySemesterAndWeekday("20241",
                "3");
        List<CourseRegistration> courseRegistrationsTuesday = new ArrayList<>();
        if (classCoursesTuesday != null) {
            for (ClassCourse classCourseTuesday : classCoursesTuesday) {
                List<CourseRegistration> currentCourseRegistrations = classCourseTuesday.getCourseRegistrations();
                for (CourseRegistration courseRegistration : currentCourseRegistrations) {
                    if (courseRegistration.getStudent().getId() == currentStudent.getId()) {
                        courseRegistrationsTuesday.add(courseRegistration);
                    }
                }
            }
        }

        List<ClassCourse> classCoursesWednesday = this.classCourseService
                .getAllClassCoursesBySemesterAndWeekday("20241", "4");
        List<CourseRegistration> courseRegistrationsWednesday = new ArrayList<>();
        if (classCoursesWednesday != null) {
            for (ClassCourse classCourseWednesday : classCoursesWednesday) {
                List<CourseRegistration> currentCourseRegistrations = classCourseWednesday.getCourseRegistrations();
                for (CourseRegistration courseRegistration : currentCourseRegistrations) {
                    if (courseRegistration.getStudent().getId() == currentStudent.getId()) {
                        courseRegistrationsWednesday.add(courseRegistration);
                    }
                }
            }
        }

        List<ClassCourse> classCoursesThursday = this.classCourseService.getAllClassCoursesBySemesterAndWeekday("20241",
                "5");
        List<CourseRegistration> courseRegistrationsThursday = new ArrayList<>();
        if (classCoursesThursday != null) {
            for (ClassCourse classCourseThursday : classCoursesThursday) {
                List<CourseRegistration> currentCourseRegistrations = classCourseThursday.getCourseRegistrations();
                for (CourseRegistration courseRegistration : currentCourseRegistrations) {
                    if (courseRegistration.getStudent().getId() == currentStudent.getId()) {
                        courseRegistrationsThursday.add(courseRegistration);
                    }
                }
            }
        }

        List<ClassCourse> classCoursesFriday = this.classCourseService.getAllClassCoursesBySemesterAndWeekday("20241",
                "6");
        List<CourseRegistration> courseRegistrationsFriday = new ArrayList<>();
        if (classCoursesFriday != null) {
            for (ClassCourse classCourseFriday : classCoursesFriday) {
                List<CourseRegistration> currentCourseRegistrations = classCourseFriday.getCourseRegistrations();
                for (CourseRegistration courseRegistration : currentCourseRegistrations) {
                    if (courseRegistration.getStudent().getId() == currentStudent.getId()) {
                        courseRegistrationsFriday.add(courseRegistration);
                    }
                }
            }
        }

        List<ClassCourse> classCoursesSaturday = this.classCourseService.getAllClassCoursesBySemesterAndWeekday("20241",
                "7");
        List<CourseRegistration> courseRegistrationsSaturday = new ArrayList<>();
        if (classCoursesSaturday != null) {
            for (ClassCourse classCourseSaturday : classCoursesSaturday) {
                List<CourseRegistration> currentCourseRegistrations = classCourseSaturday.getCourseRegistrations();
                for (CourseRegistration courseRegistration : currentCourseRegistrations) {
                    if (courseRegistration.getStudent().getId() == currentStudent.getId()) {
                        courseRegistrationsSaturday.add(courseRegistration);
                    }
                }
            }
        }

        model.addAttribute("courseRegistrationsMonday", courseRegistrationsMonday);
        model.addAttribute("courseRegistrationsTuesday", courseRegistrationsTuesday);
        model.addAttribute("courseRegistrationsWednesday", courseRegistrationsWednesday);
        model.addAttribute("courseRegistrationsThursday", courseRegistrationsThursday);
        model.addAttribute("courseRegistrationsFriday", courseRegistrationsFriday);
        model.addAttribute("courseRegistrationsSaturday", courseRegistrationsSaturday);
        return "client/student/timetable/show";
    }

}
