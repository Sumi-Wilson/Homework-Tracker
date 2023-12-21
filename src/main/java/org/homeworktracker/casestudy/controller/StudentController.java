package org.homeworktracker.casestudy.controller;

import io.micrometer.common.util.StringUtils;
import lombok.extern.slf4j.Slf4j;
//import org.homeworktracker.casestudy.database.dao.StudentDAO;
import org.homeworktracker.casestudy.database.dao.AssignmentDAO;
import org.homeworktracker.casestudy.database.dao.CourseDAO;
import org.homeworktracker.casestudy.database.dao.ParentStudentDAO;
import org.homeworktracker.casestudy.database.dao.UserDAO;
import org.homeworktracker.casestudy.database.entity.Assignment;
import org.homeworktracker.casestudy.database.entity.Course;
import org.homeworktracker.casestudy.database.entity.ParentStudent;
import org.homeworktracker.casestudy.database.entity.User;
import org.homeworktracker.casestudy.security.AuthenticatedUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
public class StudentController {
    @Autowired
    private UserDAO userDao;
    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    @Autowired
    private ParentStudentDAO parentStudentDao;

    @Autowired
    private AssignmentDAO assignmentDao;

    @Autowired
    private CourseDAO courseDao;

    @GetMapping ("/student/signup")
    public ModelAndView createStudent(){
        ModelAndView response = new ModelAndView("student/signup");
        log.info("In create student with no args");
        return response;
    }
    @GetMapping ("/student/addhomework")
    public ModelAndView addHomework(){
        ModelAndView response = new ModelAndView("student/addhomework");
        log.info("In add homework with no args");
        return response;
    }
    @GetMapping ("/student/viewhomework")
    public ModelAndView viewHomework(){
        ModelAndView response = new ModelAndView("student/viewhomework");
        log.info("In view homework with no args");

        User student = authenticatedUserService.loadCurrentUser();
        Integer studentId = student.getId();
        log.info("Student Id: " + studentId );

        List<Assignment> assignments = assignmentDao.findByStudentId(studentId);
        response.addObject("assignments",assignments);

        for(Assignment assignment : assignments){
            log.info("Id: " + assignment.getId() + " Course: " + assignment.getCourse());
        }
        log.info("testing in view homework");

        return response;
    }

    @GetMapping ("/student/studentview")
    public ModelAndView studentView( @RequestParam(required = false) String success){
        ModelAndView response = new ModelAndView("student/studentview");

        log.info("In view homework with no args");

        if (!org.springframework.util.StringUtils.isEmpty(success)) {
            response.addObject("success", success);
        }

        List<Course> courses = courseDao.findAll();
        response.addObject("courses",courses);

        for(Course course : courses){
            log.info("Course Name: " + course.getCourse());
        }

        return response;
    }


    @GetMapping("/student/search")
    public ModelAndView parentSearch(@RequestParam(required = false) String firstName,
                                     @RequestParam(required = false) String lastName) {
        ModelAndView response = new ModelAndView("student/search");
        log.debug("in the student search controller method : first name = " + firstName + " last name = " + lastName);

        if (!StringUtils.isEmpty(firstName) || !StringUtils.isEmpty(lastName)) {
            response.addObject("firstName", firstName);
            response.addObject("lastName", lastName);
            if (!StringUtils.isEmpty(firstName)) {
                firstName = "%" + firstName + "%";
            }
            if (!StringUtils.isEmpty(lastName)) {
                lastName = "%" + lastName + "%";
            }

            List<User> users = userDao.findByFirstNameAndLastName(firstName, lastName);
            response.addObject("user", users);
            for (User user : users) {
                log.debug("customer: id = " + user.getId() + " last name = " + user.getLastName());
            }
        }
        return response;
    }

    @GetMapping("student/addParent")
    public ModelAndView addParent(@RequestParam Integer parentId) {
        ModelAndView response = new ModelAndView("student/search");

        User parent = userDao.findById(parentId);

        User student = authenticatedUserService.loadCurrentUser();

        if(parentStudentDao.existsByParentAndStudent(parent,student)){
            response.addObject("error", "Parent is already linked to the student");
        }else {

            ParentStudent parentStudent = new ParentStudent();
            parentStudent.setStudent(student);
            parentStudent.setParent(parent);

            parentStudentDao.save(parentStudent);

            response.addObject("success", "Parent linked succesfully");
        }
        return response;

    }
}
