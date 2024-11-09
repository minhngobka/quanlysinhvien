package vn.nmcnpm.quanlysinhvien.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.domain.User;

@Repository
public interface TeacherRepository extends JpaRepository<Teacher, Long> {

    Teacher findByUser(User user);
}
