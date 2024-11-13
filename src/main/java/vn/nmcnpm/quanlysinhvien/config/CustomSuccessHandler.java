package vn.nmcnpm.quanlysinhvien.config;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.nmcnpm.quanlysinhvien.domain.Student;
import vn.nmcnpm.quanlysinhvien.domain.Teacher;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.service.StudentService;
import vn.nmcnpm.quanlysinhvien.service.TeacherService;
import vn.nmcnpm.quanlysinhvien.service.UserService;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UserService userService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private StudentService studentService;

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    protected String determineTargetUrl(final Authentication authentication) {
        Map<String, String> roleTargetUrlMap = new HashMap<>();
        roleTargetUrlMap.put("ROLE_TEACHER", "/teacher");
        roleTargetUrlMap.put("ROLE_STUDENT", "/student");
        roleTargetUrlMap.put("ROLE_ADMIN", "/admin");

        final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (final GrantedAuthority grantedAuthority : authorities) {
            String authorityName = grantedAuthority.getAuthority();
            if (roleTargetUrlMap.containsKey(authorityName)) {
                return roleTargetUrlMap.get(authorityName);
            }
        }

        throw new IllegalStateException();
    }

    protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        // get email
        String email = authentication.getName();
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            session.setAttribute("id", user.getId());
            session.setAttribute("email", user.getEmail());

            Student currentStudent = this.studentService.getStudentByUser(user);
            if (currentStudent != null) {
                session.setAttribute("studentName", currentStudent.getFullName());
            }

            Teacher currentTeacher = this.teacherService.getTeacherByUser(user);
            if (currentTeacher != null) {
                session.setAttribute("teacherName", currentTeacher.getFullName());
            }
        }

    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {

        String targetUrl = determineTargetUrl(authentication);

        if (response.isCommitted()) {
            return;
        }

        redirectStrategy.sendRedirect(request, response, targetUrl);
        clearAuthenticationAttributes(request, authentication);
    }

}
