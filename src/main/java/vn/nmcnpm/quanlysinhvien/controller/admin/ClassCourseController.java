package vn.nmcnpm.quanlysinhvien.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;
import vn.nmcnpm.quanlysinhvien.domain.ClassCourse;
import vn.nmcnpm.quanlysinhvien.domain.Course;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.service.ClassCourseService;
import vn.nmcnpm.quanlysinhvien.service.CourseService;
import vn.nmcnpm.quanlysinhvien.service.TeacherService;

@Controller
public class ClassCourseController {

    private final ClassCourseService classCourseService;
    private final TeacherService teacherService;
    private final CourseService courseService;

    public ClassCourseController(ClassCourseService classCourseService, TeacherService teacherService,
            CourseService courseService) {
        this.classCourseService = classCourseService;
        this.teacherService = teacherService;
        this.courseService = courseService;
    }

    @GetMapping("/admin/class-course")
    public String getClassCoursePage(Model model) {
        List<ClassCourse> classCourses = this.classCourseService.getAllClassCourses();
        model.addAttribute("classCourses", classCourses);
        return "admin/classcourse/show";
    }

    @GetMapping("/admin/class-course/{id}")
    public String getClassCourseDetailPage(Model model, @PathVariable long id) {
        ClassCourse classCourse = this.classCourseService.getClassCourseById(id).get();
        model.addAttribute("id", id);
        model.addAttribute("classCourse", classCourse);
        return "admin/classcourse/detail";
    }

    @GetMapping("/admin/class-course/create")
    public String getCreateClassCoursePage(Model model) {
        List<Teacher> teachers = this.teacherService.getAllTeachers();
        List<Course> courses = this.courseService.getAllCourses();
        model.addAttribute("courses", courses);
        model.addAttribute("teachers", teachers);
        model.addAttribute("newClassCourse", new ClassCourse());
        return "admin/classcourse/create";
    }

    @PostMapping(value = "/admin/class-course/create")
    public String createClassCoursePage(Model model,
            @ModelAttribute("newClassCourse") @Valid ClassCourse ClassCourse,
            BindingResult newCourseBindingResult) {

        if (newCourseBindingResult.hasErrors()) {
            List<Teacher> teachers = this.teacherService.getAllTeachers();
            List<Course> courses = this.courseService.getAllCourses();
            model.addAttribute("courses", courses);
            model.addAttribute("teachers", teachers);
            return "admin/classcourse/create";
        }

        this.classCourseService.handleSaveClassCourse(ClassCourse);
        return "redirect:/admin/class-course";
    }

    @GetMapping("/admin/class-course/update/{id}")
    public String getUpdateClassCoursePage(Model model, @PathVariable long id) {

        List<Teacher> teachers = this.teacherService.getAllTeachers();
        List<Course> courses = this.courseService.getAllCourses();

        ClassCourse currentClassCourse = this.classCourseService.getClassCourseById(id).get();

        model.addAttribute("courses", courses);
        model.addAttribute("teachers", teachers);
        model.addAttribute("newClassCourse", currentClassCourse);
        return "admin/classcourse/update";
    }

    @PostMapping("/admin/class-course/update")
    public String updateClassCoursePage(Model model,
            @ModelAttribute("newClassCourse") ClassCourse classCourse) {

        this.classCourseService.handleSaveClassCourse(classCourse);
        return "redirect:/admin/class-course";
    }

    @GetMapping("/admin/class-course/delete/{id}")
    public String getDeleteClassCoursePage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newClassCourse", new ClassCourse());
        return "admin/classcourse/delete";
    }

    @PostMapping("/admin/class-course/delete")
    public String postDeleteClassCoursePage(Model model, @ModelAttribute("newClassCourse") ClassCourse classCourse) {
        this.classCourseService.deleteClassCourseById(classCourse.getId());
        return "redirect:/admin/class-course";
    }
}
