package com.example.second.service;

import com.example.second.entity.Course;

import java.util.List;

public interface CourseService {

    //查
    public List<Course> findAllCourses();

    //增
    public void addCourse(Course course);

    //删
    public void deleteCourseById(Long uid);

    //改
    public void updateCourse(Course course);

    List<Course> findCourseByName(String name);

    public Integer deleteCoursesByIds(Integer[] ids);
}
