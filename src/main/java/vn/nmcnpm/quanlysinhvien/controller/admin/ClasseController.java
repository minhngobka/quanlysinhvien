package vn.nmcnpm.quanlysinhvien.controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;
import vn.nmcnpm.quanlysinhvien.domain.Classe;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.service.ClasseService;
import vn.nmcnpm.quanlysinhvien.service.TeacherService;

@Controller
public class ClasseController {

    private final ClasseService classeService;
    private final TeacherService teacherService;

    public ClasseController(ClasseService classeService, TeacherService teacherService) {
        this.classeService = classeService;
        this.teacherService = teacherService;
    }

    @GetMapping("/admin/class")
    public String getClassPage(Model model,
            @RequestParam(name = "query", required = false) String query) {
        List<Classe> classes = this.classeService.getAllClassesByClassId(query);

        model.addAttribute("classes", classes);
        return "admin/class/show";
    }

    @GetMapping("/admin/class/{id}")
    public String getStudentPage(Model model, @PathVariable long id) {
        Classe classe = this.classeService.getClasseById(id).get();

        List<Student> students = classe == null ? new ArrayList<>() : classe.getStudents();
        model.addAttribute("students", students);
        return "admin/class/detail";
    }

    @GetMapping("/admin/class/create")
    public String getCreateClassPage(Model model) {
        List<Teacher> teachers = this.teacherService.getAllTeachers();
        model.addAttribute("teachers", teachers);
        model.addAttribute("newClass", new Classe());
        return "admin/class/create";
    }

    @PostMapping(value = "/admin/class/create")
    public String createClassPage(Model model,
            @ModelAttribute("newClass") @Valid Classe classe,
            BindingResult newClassBindingResult) {

        if (newClassBindingResult.hasErrors()) {
            List<Teacher> teachers = this.teacherService.getAllTeachers();
            model.addAttribute("teachers", teachers);
            return "admin/class/create";
        }

        this.classeService.handleSaveClass(classe);

        return "redirect:/admin/class";
    }

    @GetMapping("/admin/class/update/{id}")
    public String getUpdateClassPage(Model model, @PathVariable long id) {

        List<Teacher> teachers = this.teacherService.getAllTeachers();

        Classe currentClass = this.classeService.getClasseById(id).get();

        model.addAttribute("teachers", teachers);
        model.addAttribute("newClass", currentClass);
        return "admin/class/update";
    }

    @PostMapping("/admin/class/update")
    public String updateClassPage(Model model,
            @ModelAttribute("newClass") Classe classe) {

        Optional<Classe> classOptional = this.classeService.getClasseById(classe.getId());

        if (classOptional.isPresent()) {
            Classe currentClass = classOptional.get();
            currentClass.setTeacher(classe.getTeacher());
            this.classeService.handleSaveClass(currentClass);
        }

        return "redirect:/admin/class";
    }

    @GetMapping("/admin/class/delete/{id}")
    public String getDeleteClassPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newClass", new Classe());
        return "admin/class/delete";
    }

    @PostMapping("/admin/class/delete")
    public String postDeleteClassPage(Model model, @ModelAttribute("newClass") Classe classe) {
        this.classeService.deleteClassById(classe.getId());
        return "redirect:/admin/class";
    }
}
