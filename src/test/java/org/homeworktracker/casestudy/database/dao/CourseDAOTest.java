package org.homeworktracker.casestudy.database.dao;

import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.entity.Course;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class CourseDAOTest {
    @Autowired CourseDAO courseDAO;

    @Test
    @Order(1)
    public void existsByCourseIgnoreCaseTest(){
        //given
        String courseName = "Math";

        //when
        boolean exists = courseDAO.existsByCourseIgnoreCase(courseName);

        //then
        Assertions.assertTrue(exists,"Course Already Exists");

        log.info("Exists By Course test passed successfully");

    }
    @Test
    @Order(1)
    public void deleteByCourseTest(){
        // Determine the initial number of courses
        long initialCourseCount = courseDAO.count();
        //given
        String courseName = "Test Course";
        Course course = new Course();
        course.setCourse(courseName);
        courseDAO.save(course);

        //when
        courseDAO.deleteByCourse(courseName);

        //then
        List<Course> remainingCourses = courseDAO.findAll();
        Assertions.assertEquals(initialCourseCount,remainingCourses.size());

        log.info("Delete by course test passes successfully");
    }

    @Test
    @Order(3)
    public void findAllTest(){
        //when
        List<Course> courses = courseDAO.findAll();

        //then
        Assertions.assertFalse(courses.isEmpty(),"No courses found in the table");

        log.info("Find All test passes successfully");
    }

}
