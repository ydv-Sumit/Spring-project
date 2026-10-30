package com.sumit.model;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;


public class Student {
	private int id;
	@NotBlank(message = "Student name is required")
	@Size(max = 100, message = "Name cannot exceed 100 characters")
	private String name;

	@NotBlank(message = "Email is required")
	@Email(message = "Please enter a valid email address")
	@Size(max = 150, message = "Email cannot exceed 150 characters")
	private String email;

	@NotBlank(message = "Please select a course")
	private String course;
	
	private String gender;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	

}
