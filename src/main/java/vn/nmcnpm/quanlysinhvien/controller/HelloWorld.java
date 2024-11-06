package vn.nmcnpm.quanlysinhvien.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorld {

    @GetMapping("/")
    public String getHello() {
        return "Phe Pha";
    }
}
