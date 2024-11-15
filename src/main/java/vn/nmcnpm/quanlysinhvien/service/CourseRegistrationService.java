package vn.nmcnpm.quanlysinhvien.service;

import org.springframework.stereotype.Service;

import vn.nmcnpm.quanlysinhvien.domain.CourseRegistration;
import vn.nmcnpm.quanlysinhvien.repository.CourseRegistrationRepository;

@Service
public class CourseRegistrationService {

    private final CourseRegistrationRepository courseRegistrationRepository;

    public CourseRegistrationService(CourseRegistrationRepository courseRegistrationRepository) {
        this.courseRegistrationRepository = courseRegistrationRepository;
    }

    public void handleSaveCourseRegistration(CourseRegistration courseRegistration) {
        this.courseRegistrationRepository.save(courseRegistration);
    }
}
