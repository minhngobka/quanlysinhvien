package vn.nmcnpm.quanlysinhvien.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;

@Repository
public interface ClassCourseRepository extends JpaRepository<ClassCourse, Long> {

}
