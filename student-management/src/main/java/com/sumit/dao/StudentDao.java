package com.sumit.dao;

import java.util.List;
import com.sumit.model.Student;

public interface StudentDao {

    List<Student> getAllStudents();

    int getMaleStudentCount();

    int getFemaleStudentCount();

    int getTotalCourses();
    
    int addStudent(Student student);
    
    int updateStudent(Student student);
    
    Student getStudentById(int id);
    
    int deleteStudent(int id);
    
    List<Student> searchStudents(String keyword);
    
    List<Student> searchStudentsByGender(String gender);
    
    List<String> getAllCourses();
    
    
}