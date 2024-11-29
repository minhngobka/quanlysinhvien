package vn.nmcnpm.quanlysinhvien.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;
import vn.nmcnpm.quanlysinhvien.domain.CourseRegistration;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.repository.CourseRegistrationRepository;
import vn.nmcnpm.quanlysinhvien.repository.StudentRepository;

@Service
public class CourseRegistrationService {

    private final CourseRegistrationRepository courseRegistrationRepository;
    private final StudentRepository studentRepository;
    private final ClassCourseService classCourseService;

    public CourseRegistrationService(CourseRegistrationRepository courseRegistrationRepository,
            StudentRepository studentRepository, ClassCourseService classCourseService) {
        this.courseRegistrationRepository = courseRegistrationRepository;
        this.studentRepository = studentRepository;
        this.classCourseService = classCourseService;
    }

    public List<CourseRegistration> getAllCourseRegistrationsByStatus(String status) {
        return this.courseRegistrationRepository.findByStatus(status);
    }

    public List<CourseRegistration> getAllCourseRegistrationsByStudentIdOrStudentName(ClassCourse classCourse,
            String query) {
        List<CourseRegistration> courseRegistrations = classCourse.getCourseRegistrations();
        if (query == null || query == "") {
            return courseRegistrations;
        }
        List<Student> students = new ArrayList<>();
        try {
            Integer.parseInt(query);
            students = this.studentRepository.findByStudentIdContaining(query);
        } catch (NumberFormatException e) {
            students = this.studentRepository.findByFullNameContaining(query);
        }

        List<CourseRegistration> currentCourseRegistrations = new ArrayList<>();
        for (Student student : students) {
            for (CourseRegistration courseRegistration : courseRegistrations) {
                if (courseRegistration.getStudent().getId() == student.getId()) {
                    currentCourseRegistrations.add(courseRegistration);
                }
            }
        }
        return currentCourseRegistrations;
    }

    public List<CourseRegistration> getAllCourseRegistrationsByStudentAndSemesterAndWeekdayAndTimePeriod(
            Student currentStudent, String semester, String weekday, String timePeriod) {
        List<CourseRegistration> courseRegistrations = new ArrayList<>();
        List<ClassCourse> classCourses = this.classCourseService
                .getAllClassCoursesBySemesterAndWeekdayAndTimePeriod(semester, weekday, timePeriod);
        if (classCourses != null) {
            for (ClassCourse classCourse : classCourses) {
                List<CourseRegistration> currentCourseRegistrations = classCourse.getCourseRegistrations();
                for (CourseRegistration courseRegistration : currentCourseRegistrations) {
                    if (courseRegistration.getStudent().getId() == currentStudent.getId()) {
                        courseRegistrations.add(courseRegistration);
                    }
                }
            }
        }
        return courseRegistrations;
    }

    public Optional<CourseRegistration> getCourseRegistrationById(long id) {
        return this.courseRegistrationRepository.findById(id);
    }

    public void handleSaveCourseRegistration(CourseRegistration courseRegistration) {
        this.courseRegistrationRepository.save(courseRegistration);
    }

    public void deleteCourseRegistrationById(long id) {
        this.courseRegistrationRepository.deleteById(id);
    }

}
