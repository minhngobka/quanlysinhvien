package vn.nmcnpm.quanlysinhvien.controller.client.student;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nmcnpm.quanlysinhvien.domain.CourseRegistration;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.CourseRegistrationService;
import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

@Controller
public class StudentTimeTableController {

    private final UserService userService;
    private final StudentService studentService;
    private final CourseRegistrationService courseRegistrationService;

    public StudentTimeTableController(UserService userService, StudentService studentService,
            CourseRegistrationService courseRegistrationService) {
        this.userService = userService;
        this.studentService = studentService;
        this.courseRegistrationService = courseRegistrationService;
    }

    @GetMapping("/student/timetable")
    public String getStudentTimeTablePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id).get();
        Student currentStudent = this.studentService.getStudentByUser(currentUser);

        List<CourseRegistration> courseRegistrationsMonday = this.courseRegistrationService
                .getAllCourseRegistrationsByStudentAndSemesterAndWeekdayAndTimePeriod(currentStudent, "20241", "2",
                        "Sáng");
        List<CourseRegistration> courseRegistrationsTuesday = this.courseRegistrationService
                .getAllCourseRegistrationsByStudentAndSemesterAndWeekdayAndTimePeriod(currentStudent, "20241", "3",
                        "Sáng");
        List<CourseRegistration> courseRegistrationsWednesday = this.courseRegistrationService
                .getAllCourseRegistrationsByStudentAndSemesterAndWeekdayAndTimePeriod(currentStudent, "20241", "4",
                        "Sáng");
        List<CourseRegistration> courseRegistrationsThursday = this.courseRegistrationService
                .getAllCourseRegistrationsByStudentAndSemesterAndWeekdayAndTimePeriod(currentStudent, "20241", "5",
                        "Sáng");
        List<CourseRegistration> courseRegistrationsFriday = this.courseRegistrationService
                .getAllCourseRegistrationsByStudentAndSemesterAndWeekdayAndTimePeriod(currentStudent, "20241", "6",
                        "Sáng");
        List<CourseRegistration> courseRegistrationsSaturday = this.courseRegistrationService
                .getAllCourseRegistrationsByStudentAndSemesterAndWeekdayAndTimePeriod(currentStudent, "20241", "7",
                        "Sáng");

        List<CourseRegistration> courseRegistrationsMondayAfternoon = this.courseRegistrationService
                .getAllCourseRegistrationsByStudentAndSemesterAndWeekdayAndTimePeriod(currentStudent, "20241", "2",
                        "Chiều");
        List<CourseRegistration> courseRegistrationsTuesdayAfternoon = this.courseRegistrationService
                .getAllCourseRegistrationsByStudentAndSemesterAndWeekdayAndTimePeriod(currentStudent, "20241", "3",
                        "Chiều");
        List<CourseRegistration> courseRegistrationsWednesdayAfternoon = this.courseRegistrationService
                .getAllCourseRegistrationsByStudentAndSemesterAndWeekdayAndTimePeriod(currentStudent, "20241", "4",
                        "Chiều");
        List<CourseRegistration> courseRegistrationsThursdayAfternoon = this.courseRegistrationService
                .getAllCourseRegistrationsByStudentAndSemesterAndWeekdayAndTimePeriod(currentStudent, "20241", "5",
                        "Chiều");
        List<CourseRegistration> courseRegistrationsFridayAfternoon = this.courseRegistrationService
                .getAllCourseRegistrationsByStudentAndSemesterAndWeekdayAndTimePeriod(currentStudent, "20241", "6",
                        "Chiều");
        List<CourseRegistration> courseRegistrationsSaturdayAfternoon = this.courseRegistrationService
                .getAllCourseRegistrationsByStudentAndSemesterAndWeekdayAndTimePeriod(currentStudent, "20241", "7",
                        "Chiều");

        model.addAttribute("courseRegistrationsMonday", courseRegistrationsMonday);
        model.addAttribute("courseRegistrationsTuesday", courseRegistrationsTuesday);
        model.addAttribute("courseRegistrationsWednesday", courseRegistrationsWednesday);
        model.addAttribute("courseRegistrationsThursday", courseRegistrationsThursday);
        model.addAttribute("courseRegistrationsFriday", courseRegistrationsFriday);
        model.addAttribute("courseRegistrationsSaturday", courseRegistrationsSaturday);

        model.addAttribute("courseRegistrationsMondayAfternoon", courseRegistrationsMondayAfternoon);
        model.addAttribute("courseRegistrationsTuesdayAfternoon", courseRegistrationsTuesdayAfternoon);
        model.addAttribute("courseRegistrationsWednesdayAfternoon", courseRegistrationsWednesdayAfternoon);
        model.addAttribute("courseRegistrationsThursdayAfternoon", courseRegistrationsThursdayAfternoon);
        model.addAttribute("courseRegistrationsFridayAfternoon", courseRegistrationsFridayAfternoon);
        model.addAttribute("courseRegistrationsSaturdayAfternoon", courseRegistrationsSaturdayAfternoon);
        return "client/student/timetable/show";
    }
}
