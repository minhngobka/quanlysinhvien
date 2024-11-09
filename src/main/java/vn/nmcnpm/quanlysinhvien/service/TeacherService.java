package vn.nmcnpm.quanlysinhvien.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.repository.TeacherRepository;
import vn.nmcnpm.quanlysinhvien.repository.UserRepository;

@Service
public class TeacherService {

    private final TeacherRepository teacherRepository;
    private final UserRepository userRepository;

    public TeacherService(TeacherRepository teacherRepository, UserRepository userRepository) {
        this.teacherRepository = teacherRepository;
        this.userRepository = userRepository;
    }

    public List<Teacher> getAllTeachers() {
        return this.teacherRepository.findAll();
    }

    public Optional<Teacher> getTeacherById(long id) {
        return this.teacherRepository.findById(id);
    }

    public Teacher getTeacherByUser(User user) {
        return this.teacherRepository.findByUser(user);
    }

    public void handleSaveTeacher(Teacher teacher) {
        if (teacher.getGender().equals("MALE")) {
            teacher.setGender("Nam");
        } else if (teacher.getGender().equals("FEMALE")) {
            teacher.setGender("Nữ");
        } else {
            teacher.setGender("Khác");
        }
        this.teacherRepository.save(teacher);
    }

    public void deleteTeacherById(long id) {
        Teacher teacher = this.teacherRepository.findById(id).get();
        this.teacherRepository.deleteById(id);
        this.userRepository.deleteById(teacher.getUser().getId());
    }

    public long countTeachers() {
        return this.teacherRepository.count();
    }
}
