package vn.nmcnpm.quanlysinhvien.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.nmcnpm.quanlysinhvien.domain.Role;
import vn.nmcnpm.quanlysinhvien.domain.User;
import vn.nmcnpm.quanlysinhvien.repository.RoleRepository;
import vn.nmcnpm.quanlysinhvien.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public Optional<User> getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

}
