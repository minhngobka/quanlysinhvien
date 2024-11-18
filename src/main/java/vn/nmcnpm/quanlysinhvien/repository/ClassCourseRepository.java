package vn.nmcnpm.quanlysinhvien.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;

@Repository
public interface ClassCourseRepository extends JpaRepository<ClassCourse, Long> {

    List<ClassCourse> findByClassCourseIdContaining(String classCourseId);
}
