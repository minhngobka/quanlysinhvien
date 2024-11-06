package vn.nmcnpm.quanlysinhvien.service;

import org.springframework.stereotype.Service;

import vn.nmcnpm.quanlysinhvien.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

}
