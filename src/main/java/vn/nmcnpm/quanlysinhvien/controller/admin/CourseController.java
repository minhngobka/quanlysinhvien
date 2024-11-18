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
import vn.nmcnpm.quanlysinhvien.domain.Course;
import vn.nmcnpm.quanlysinhvien.domain.dto.CourseDTO;
import vn.nmcnpm.quanlysinhvien.service.CourseService;

@Controller
public class CourseController {

    private final CourseService courseService;

    public CourseController(CourseService courseService) {
        this.courseService = courseService;
    }

    @GetMapping("/admin/course")
    public String getCoursePage(Model model,
            @RequestParam(name = "query", required = false) String query) {
        List<Course> courses = this.courseService.getAllCoursesByCourseId(query);
        List<CourseDTO> courseDTOs = new ArrayList<>();
        for (Course course : courses) {
            CourseDTO courseDTO = this.courseService.courseToCourseDTO(course);
            courseDTOs.add(courseDTO);
        }
        model.addAttribute("courseDTOs", courseDTOs);
        return "admin/course/show";
    }

    @GetMapping("/admin/course/{id}")
    public String getCourseDetailPage(Model model, @PathVariable long id) {
        Course course = this.courseService.getCourseById(id).get();
        model.addAttribute("id", id);
        model.addAttribute("course", course);
        return "admin/course/detail";
    }

    @GetMapping("/admin/course/create")
    public String getCreateCoursePage(Model model) {
        model.addAttribute("newCourse", new Course());
        return "admin/course/create";
    }

    @PostMapping(value = "/admin/course/create")
    public String createCoursePage(Model model,
            @ModelAttribute("newCourse") @Valid Course course,
            BindingResult newCourseBindingResult) {

        if (newCourseBindingResult.hasErrors()) {
            return "admin/course/create";
        }

        this.courseService.handleSaveCourse(course);

        return "redirect:/admin/course";
    }

    @GetMapping("/admin/course/update/{id}")
    public String getUpdateCoursePage(Model model, @PathVariable long id) {
        Course currentCourse = this.courseService.getCourseById(id).get();
        model.addAttribute("newCourse", currentCourse);
        return "admin/course/update";
    }

    @PostMapping("/admin/course/update")
    public String updateCoursePage(Model model,
            @ModelAttribute("newCourse") Course course) {

        Optional<Course> courseOptional = this.courseService.getCourseById(course.getId());
        if (courseOptional.isPresent()) {
            Course currentCourse = courseOptional.get();

            currentCourse.setTheoreticalCredits(course.getTheoreticalCredits());
            currentCourse.setPracticalCredits(course.getPracticalCredits());
            currentCourse.setExeciseCredits(course.getExeciseCredits());
            currentCourse.setCoefficient(course.getCoefficient());
            currentCourse.setDepartment(course.getDepartment());

            this.courseService.handleSaveCourse(currentCourse);
        }
        return "redirect:/admin/course";
    }

    @GetMapping("/admin/course/delete/{id}")
    public String getDeleteCoursePage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newCourse", new Course());
        return "admin/course/delete";
    }

    @PostMapping("/admin/course/delete")
    public String postDeleteCoursePage(Model model, @ModelAttribute("newCourse") Course course) {
        this.courseService.deleteCourseById(course.getId());
        return "redirect:/admin/course";
    }
}
