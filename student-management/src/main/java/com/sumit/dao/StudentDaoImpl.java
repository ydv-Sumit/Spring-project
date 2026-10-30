package com.sumit.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import com.sumit.model.Student;

@Repository
public class StudentDaoImpl implements StudentDao {

    private JdbcTemplate jdbcTemplate;

    public StudentDaoImpl(JdbcTemplate jdbcTemplate) {
        
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Student> getAllStudents() {
        String query = "SELECT * FROM students";   
        return this.jdbcTemplate.query(query, new BeanPropertyRowMapper<>(Student.class));
    }
    
    @Override
    public int getMaleStudentCount() {
        String query = "SELECT COUNT(*) FROM students WHERE gender = 'Male'";
        return jdbcTemplate.queryForObject(query, Integer.class);
    }
    
    @Override
    public int getFemaleStudentCount() {
        String query = "SELECT COUNT(*) FROM students WHERE gender = 'Female'";
        return jdbcTemplate.queryForObject(query, Integer.class);
    }
    
    @Override
    public int getTotalCourses() {
        String query = "SELECT COUNT(DISTINCT course) FROM students";
        return jdbcTemplate.queryForObject(query, Integer.class);
    }
    
    @Override
    public int addStudent(Student student) {

        String query = "INSERT INTO students (name, email, course, gender) VALUES (?, ?, ?, ?)";

        return jdbcTemplate.update(
            query,
            student.getName(),
            student.getEmail(),
            student.getCourse(),
            student.getGender()
        );
    }
    
    @Override
    public int updateStudent(Student student) {

        String query = "UPDATE students SET name = ?, email = ?, course = ?, gender = ? WHERE id = ?";

        return jdbcTemplate.update(
            query,
            student.getName(),
            student.getEmail(),
            student.getCourse(),
            student.getGender(),
            student.getId()
        );
    }
    
    @Override
    public Student getStudentById(int id) {

        String query = "SELECT * FROM students WHERE id = ?";

        return jdbcTemplate.queryForObject(
            query,
            new RowMapperImpl(),
            id
        );
    }

	@Override
	public int deleteStudent(int id) {
		
		 String query = "DELETE FROM students WHERE id = ?";

		    return jdbcTemplate.update(query, id);
		
	}
	
	@Override
	public List<Student> searchStudents(String keyword) {

	    String query = "SELECT * FROM students WHERE name LIKE ? OR email LIKE ?";

	    return jdbcTemplate.query(
	        query,
	        new RowMapperImpl(),
	        "%" + keyword + "%",
	        "%" + keyword + "%"
	    );
	}
	
	@Override
	public List<Student> searchStudentsByGender(String gender) {

	    String query = "SELECT * FROM students WHERE gender = ?";

	    return jdbcTemplate.query(
	        query,
	        new RowMapperImpl(),
	        gender
	    );
	}
   
	@Override
	public List<String> getAllCourses() {
	    String query = "SELECT DISTINCT course FROM students";

	    return jdbcTemplate.queryForList(query, String.class);
	}
	
   
    
    
    
    
}