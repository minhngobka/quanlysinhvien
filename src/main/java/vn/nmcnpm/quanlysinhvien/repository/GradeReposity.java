package vn.nmcnpm.quanlysinhvien.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;
import vn.nmcnpm.quanlysinhvien.domain.Grade;
import vn.nmcnpm.quanlysinhvien.domain.Student;

@Repository
public interface GradeReposity extends JpaRepository<Grade, Long> {

    Grade findByStudentAndClassCourse(Student student, ClassCourse classCourse);
}
