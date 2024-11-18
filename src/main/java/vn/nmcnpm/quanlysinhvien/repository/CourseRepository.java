package vn.nmcnpm.quanlysinhvien.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nmcnpm.quanlysinhvien.domain.Course;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {

    public List<Course> findByCourseIdContaining(String courseId);

    public List<Course> findByNameContaining(String name);
}
