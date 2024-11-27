package vn.nmcnpm.quanlysinhvien.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;
import vn.nmcnpm.quanlysinhvien.domain.Course;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.repository.ClassCourseRepository;
import vn.nmcnpm.quanlysinhvien.repository.CourseRepository;

@Service
public class ClassCourseService {
    private final ClassCourseRepository classCourseRepository;
    private final CourseRepository courseRepository;

    public ClassCourseService(ClassCourseRepository classCourseRepository, CourseRepository courseRepository) {
        this.classCourseRepository = classCourseRepository;
        this.courseRepository = courseRepository;
    }

    public List<ClassCourse> getAllClassCourses() {
        return this.classCourseRepository.findAll();
    }

    public List<ClassCourse> getAllClassCoursesBySemester(String semester) {
        return this.classCourseRepository.findBySemester(semester);
    }

    public List<ClassCourse> getAllClassCoursesBySemesterAndWeekday(String semester, String weekday) {
        return this.classCourseRepository.findBySemesterAndWeekday(semester, weekday);
    }

    public List<ClassCourse> getAllClassCoursesBySemesterAndWeekdayAndTimePeriod(String semester, String weekday,
            String timePeriod) {
        return this.classCourseRepository.findBySemesterAndWeekdayAndTimePeriod(semester, weekday, timePeriod);
    }

    public List<ClassCourse> getAllClassCoursesByClassCourseIdOrName(String query) {
        if (query == null || query == "") {
            return this.classCourseRepository.findAll();
        }

        try {
            Integer.parseInt(query);
            return this.classCourseRepository.findByClassCourseIdContaining(query);
        } catch (NumberFormatException e) {
            List<Course> courses = this.courseRepository.findByNameContaining(query);
            List<ClassCourse> classCourses = new ArrayList<>();
            for (Course course : courses) {
                List<ClassCourse> currentClassCourses = course.getClassCourses();
                classCourses.addAll(currentClassCourses);
            }
            return classCourses;
        }
    }

    public List<ClassCourse> getAllClassCoursesByTeacherAndSemester(String query, Teacher teacher) {
        if (query == null || query == "") {
            return teacher.getClassCourses();
        }

        return this.classCourseRepository.findByTeacherAndSemesterContaining(teacher, query);
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

    public long countClassCoursesByTeacher(Teacher teacher) {
        return this.classCourseRepository.countByTeacher(teacher);
    }

}
