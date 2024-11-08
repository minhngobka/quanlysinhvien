package vn.nmcnpm.quanlysinhvien.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;
import vn.nmcnpm.quanlysinhvien.repository.ClassCourseRepository;

@Service
public class ClassCourseService {
    private final ClassCourseRepository classCourseRepository;

    public ClassCourseService(ClassCourseRepository classCourseRepository) {
        this.classCourseRepository = classCourseRepository;
    }

    public List<ClassCourse> getAllClassCourses() {
        return this.classCourseRepository.findAll();
    }

    public Optional<ClassCourse> getClassCourseById(long id) {
        return this.classCourseRepository.findById(id);
    }

    public void handleSaveClassCourse(ClassCourse classCourse) {
        this.classCourseRepository.save(classCourse);
    }

    public void deleteClassCourseById(long id) {
        this.classCourseRepository.deleteById(id);
    }

    public long countClassCourses() {
        return this.classCourseRepository.count();
    }

}
