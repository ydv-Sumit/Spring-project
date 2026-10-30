package com.sumit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sumit.dao.StudentDao;
import com.sumit.model.Student;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.validation.BindingResult;

@Controller
public class StudentController {

    @Autowired
    private StudentDao studentDao;

    @GetMapping("/add-student")
    public String showAddStudentForm(Model model) {
        model.addAttribute("student", new Student());
        return "add-student";
    }
    
    @PostMapping("/save-student")
    public String saveStudent(
            @Valid @ModelAttribute("student") Student student,
            BindingResult result,
            Model model) {

        if (result.hasErrors()) {
            return "add-student";
        }

        studentDao.addStudent(student);

        return "redirect:/dashboard";
    }
    
    
    @GetMapping("/view-students")
    public String viewStudents(
            @RequestParam(value = "gender", required = false) String gender,
            Model model) {

        if (gender != null && !gender.isEmpty()) {
            model.addAttribute(
                "students",
                studentDao.searchStudentsByGender(gender)
            );
        } else {
            model.addAttribute("students", studentDao.getAllStudents());
        }

        model.addAttribute("selectedGender", gender);

        return "view-students";
    }
    
    @GetMapping("/edit-student/{id}")
    public String showEditStudentForm(@PathVariable("id") int id,Model model) {

        Student student = studentDao.getStudentById(id);
        model.addAttribute("student", student);

        return "edit-student";
    }
    
    @PostMapping("/update-student")
    public String updateStudent(@ModelAttribute("student") Student student) {

        studentDao.updateStudent(student);

        return "redirect:/view-students";
    }
    
    @GetMapping("/delete-student/{id}")
    public String deleteStudent(
            @PathVariable("id") int id) {

        studentDao.deleteStudent(id);

        return "redirect:/view-students";
    }
    
    
    @GetMapping("/search-students")
    public String searchStudents(@RequestParam("keyword") String keyword,Model model) {

    	
    	List<Student> searchResult = studentDao.searchStudents(keyword);

    	model.addAttribute("students", searchResult);

        model.addAttribute("keyword", keyword);

        return "view-students";
    }
    
   
    @GetMapping("/view-courses")
    public String viewCourses(Model model) {

        model.addAttribute("courses", studentDao.getAllCourses());

        return "view-courses";
    }
    
    
    
}