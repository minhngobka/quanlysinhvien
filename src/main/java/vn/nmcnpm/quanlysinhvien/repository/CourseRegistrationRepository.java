package vn.nmcnpm.quanlysinhvien.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nmcnpm.quanlysinhvien.domain.CourseRegistration;
import java.util.List;

@Repository
public interface CourseRegistrationRepository extends JpaRepository<CourseRegistration, Long> {

    List<CourseRegistration> findByStatus(String status);
}
