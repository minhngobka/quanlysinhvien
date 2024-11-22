package vn.nmcnpm.quanlysinhvien.service;

import java.util.ArrayList;
import java.util.List;

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

    public CourseRegistrationService(CourseRegistrationRepository courseRegistrationRepository,
            StudentRepository studentRepository) {
        this.courseRegistrationRepository = courseRegistrationRepository;
        this.studentRepository = studentRepository;
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

    public void handleSaveCourseRegistration(CourseRegistration courseRegistration) {
        this.courseRegistrationRepository.save(courseRegistration);
    }
}
