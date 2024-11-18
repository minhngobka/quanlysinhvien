package vn.nmcnpm.quanlysinhvien.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.User;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
    public Student findByUser(User user);

    public List<Student> findByStudentIdContaining(String studentId);

    public List<Student> findByFullNameContaining(String fullName);
}
