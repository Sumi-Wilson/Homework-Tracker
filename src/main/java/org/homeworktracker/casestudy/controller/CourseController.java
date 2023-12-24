package org.homeworktracker.casestudy.controller;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.dao.CourseDAO;
import org.homeworktracker.casestudy.database.entity.Course;
import org.homeworktracker.casestudy.formbean.CreateCourseFormBean;
import org.homeworktracker.casestudy.formbean.RegisterUserFormBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
        log.info("Course: " + form.getCourseName());

        Course course = new Course();
        course.setCourse(form.getCourseName());
        courseDao.save(course);
        log.info("In add course submit with incoming args");

        List<Course> courses = courseDao.findAll();
        response.addObject("courses",courses);

        response.addObject("successMessage", "Course added successfully");

        return response;
    }

    @GetMapping("/admin/deletecourse")
    public ModelAndView deleteCourse() {
        ModelAndView response = new ModelAndView("admin/deletecourse");
        log.info("in delete course with no arguments");
        return response;
    }
    @GetMapping("/admin/deletecourseSubmit")
    public ModelAndView deleteCourse(@Valid CreateCourseFormBean form,
                                     BindingResult bindingResult) {
        log.info("in the course delete method course: " + form.getCourseName());

        ModelAndView response = new ModelAndView("admin/deletecourse");

        if (bindingResult.hasErrors()) {
            log.info("in the course delete method with error course: " + form.getCourseName());
            response.addObject("form", form);
            response.addObject("errors", bindingResult);
        } else if(form.getCourseName() != null) {
            log.info("Course to delete: " + form.getCourseName());

            //check if course exists in table
            if(courseDao. existsByCourseIgnoreCase(form.getCourseName())) {
                courseDao.deleteByCourse(form.getCourseName());

                response.addObject("successMessage", "Course deleted successfully");
            }else{
                response.addObject("errorMessage", "Course not found");

            }
        }

            return response;
        }

}



