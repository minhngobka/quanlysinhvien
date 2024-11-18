package vn.nmcnpm.quanlysinhvien.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nmcnpm.quanlysinhvien.domain.Classe;

@Repository
public interface ClasseRepository extends JpaRepository<Classe, Long> {

    List<Classe> findByClassIdContaining(String classId);
}
