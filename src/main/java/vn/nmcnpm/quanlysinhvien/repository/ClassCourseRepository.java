package vn.nmcnpm.quanlysinhvien.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;

@Repository
public interface ClassCourseRepository extends JpaRepository<ClassCourse, Long> {

    long countByTeacher(Teacher teacher);

    List<ClassCourse> findBySemesterAndWeekday(String semester, String weekday);

    List<ClassCourse> findByClassCourseIdContaining(String classCourseId);

    List<ClassCourse> findByTeacherAndSemesterContaining(Teacher teacher, String semester);
}
