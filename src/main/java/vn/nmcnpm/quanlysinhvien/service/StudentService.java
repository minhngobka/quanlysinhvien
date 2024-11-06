package vn.nmcnpm.quanlysinhvien.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.repository.StudentRepository;
import vn.nmcnpm.quanlysinhvien.repository.UserRepository;

@Service
public class StudentService {

    private final StudentRepository studentRepository;
    private final UserRepository userRepository;

    public StudentService(StudentRepository studentRepository, UserRepository userRepository) {
        this.studentRepository = studentRepository;
        this.userRepository = userRepository;
    }

    public void handleSaveStudent(Student student) {
        if (student.getGender().equals("MALE")) {
            student.setGender("Nam");
        } else if (student.getGender().equals("FEMALE")) {
            student.setGender("Nữ");
        } else {
            student.setGender("Khác");
        }
        this.studentRepository.save(student);
    }

    public List<Student> getAllStudents() {
        return this.studentRepository.findAll();
    }

    public Optional<Student> getStudentById(long id) {
        return this.studentRepository.findById(id);
    }

    public void deleteStudentById(long id) {
        Student student = this.studentRepository.findById(id).get();
        this.studentRepository.deleteById(id);
        this.userRepository.deleteById(student.getUser().getId());
    }

    public long countStudents() {
        return this.studentRepository.count();
    }
}
