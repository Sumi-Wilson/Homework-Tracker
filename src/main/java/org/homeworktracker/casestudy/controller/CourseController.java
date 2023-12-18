package org.homeworktracker.casestudy.controller;

import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.dao.CourseDAO;
import org.homeworktracker.casestudy.database.entity.Course;
import org.homeworktracker.casestudy.formbean.CreateCourseFormBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
public class CourseController {
    @Autowired
    private CourseDAO courseDao;

    @GetMapping("/admin/addcourse")
    public ModelAndView addCourse() {
        ModelAndView response = new ModelAndView("admin/addcourse");
        log.info("in create course with no arguments");
        return response;
    }

    @GetMapping("/admin/addcourseSubmit")
    public ModelAndView addCourseSubmit(CreateCourseFormBean form) {
        ModelAndView response = new ModelAndView("admin/addcourse");
        log.info("Course: " + form.getCourse());

        Course course = new Course();
        course.setCourse(form.getCourse());
        courseDao.save(course);
        log.info("In add course submit with incoming args");

        List<Course> courses = courseDao.findAll();
        response.addObject("courses",courses);

        response.addObject("successMessage", "Course added successfully");

        return response;
    }

    @GetMapping("/admin/deletecourse")
    public ModelAndView deleteCourse(@RequestParam(required = false) String courseName) {
        ModelAndView response = new ModelAndView("admin/deletecourse");
        log.debug("in the course delete method course: " + courseName);
        if (courseName != null) {
            //response.addObject("course", courseName);
            courseDao.deleteByCourse(courseName);
        }

        return response;
    }
}



