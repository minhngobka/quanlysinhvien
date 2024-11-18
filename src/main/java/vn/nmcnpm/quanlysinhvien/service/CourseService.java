package vn.nmcnpm.quanlysinhvien.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.nmcnpm.quanlysinhvien.domain.Course;
import vn.nmcnpm.quanlysinhvien.domain.dto.CourseDTO;
import vn.nmcnpm.quanlysinhvien.repository.CourseRepository;

@Service
public class CourseService {
    private final CourseRepository courseRepository;

    public CourseService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public List<Course> getAllCourses() {
        return this.courseRepository.findAll();
    }

    public List<Course> getAllCoursesByCourseId(String query) {
        if (query == null || query == "") {
            return this.courseRepository.findAll();
        }

        return this.courseRepository.findByCourseIdContaining(query);
    }

    public void handleSaveCourse(Course course) {
        this.courseRepository.save(course);
    }

    public Optional<Course> getCourseById(long id) {
        return this.courseRepository.findById(id);
    }

    public void deleteCourseById(long id) {
        this.courseRepository.deleteById(id);
    }

    public long countCourses() {
        return this.courseRepository.count();
    }

    public CourseDTO courseToCourseDTO(Course course) {
        CourseDTO courseDTO = new CourseDTO();
        courseDTO.setId(course.getId());
        courseDTO.setCourseId(course.getCourseId());
        courseDTO.setName(course.getName());
        courseDTO.setCredits(course.getTheoreticalCredits() + " - " + course.getPracticalCredits() + " - "
                + course.getExeciseCredits());
        return courseDTO;
    }
}
