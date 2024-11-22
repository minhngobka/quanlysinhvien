package vn.nmcnpm.quanlysinhvien.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nmcnpm.quanlysinhvien.domain.Classe;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;

@Repository
public interface ClasseRepository extends JpaRepository<Classe, Long> {

    long countByTeacher(Teacher teacher);

    List<Classe> findByClassIdContaining(String classId);

    List<Classe> findByTeacherAndClassIdContaining(Teacher teacher, String classId);
}
