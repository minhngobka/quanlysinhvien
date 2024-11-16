package vn.nmcnpm.quanlysinhvien.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.nmcnpm.quanlysinhvien.domain.Grade;
import vn.nmcnpm.quanlysinhvien.repository.GradeReposity;

@Service
public class GradeService {

    private final GradeReposity gradeReposity;

    public GradeService(GradeReposity gradeReposity) {
        this.gradeReposity = gradeReposity;
    }

    public Optional<Grade> getGradeById(long id) {
        return this.gradeReposity.findById(id);
    }

    public void handleSaveGrade(Grade grade) {
        this.gradeReposity.save(grade);
    }
}
