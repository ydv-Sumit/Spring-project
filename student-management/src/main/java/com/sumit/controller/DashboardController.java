package com.sumit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sumit.dao.StudentDao;
import com.sumit.model.Student;

@Controller
public class DashboardController {

    @Autowired
    private StudentDao studentDao;

    @RequestMapping("/dashboard")
    public String showDashboard(Model model) {

        List<Student> students = studentDao.getAllStudents();

        model.addAttribute("students", students);
        model.addAttribute("totalStudents", students.size());

        model.addAttribute("maleStudents",
                studentDao.getMaleStudentCount());

        model.addAttribute("femaleStudents",
                studentDao.getFemaleStudentCount());

        model.addAttribute("totalCourses",
                studentDao.getTotalCourses());

        return "dashboard";
    }
    
    
    
    
    
}