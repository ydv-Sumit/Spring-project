package com.sumit.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sumit.dao.UserDao;
import com.sumit.model.User;

@Controller
public class LoginController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {

        User user = userDao.getUserByEmail(email);

        if (user != null
                && passwordEncoder.matches(password, user.getPassword())
                && "ADMIN".equals(user.getRole())) {

            session.setAttribute("loggedInUser", user);

            return "redirect:/dashboard";
        }

        model.addAttribute(
                "error",
                "Invalid email or password!"
        );

        return "login";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {

        if (session != null) {
            session.invalidate();
        }

        return "redirect:/login";
    }
    
}