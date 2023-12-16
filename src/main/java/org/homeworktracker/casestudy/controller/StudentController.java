package org.homeworktracker.casestudy.controller;

import io.micrometer.common.util.StringUtils;
import lombok.extern.slf4j.Slf4j;
//import org.homeworktracker.casestudy.database.dao.StudentDAO;
import org.homeworktracker.casestudy.database.dao.ParentStudentDAO;
import org.homeworktracker.casestudy.database.dao.UserDAO;
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
        return response;
    }

    @GetMapping ("/student/studentview")
    public ModelAndView studentView(){
        ModelAndView response = new ModelAndView("student/studentview");
        log.info("In view homework with no args");
        return response;
    }

//    @GetMapping("/student/signupSubmit")
//    public ModelAndView createStudentSubmit(CreateStudentFormBean form){
//        ModelAndView response = new ModelAndView("student/signup");
//        log.info("FirstName: " + form.getFirstName());
//        log.info("LastName: " + form.getLastName());
//        log.info("Emailid: " + form.getEmail());
//
//        Student student = new Student();
//        student.setFirstName(form.getFirstName());
//        student.setLastName(form.getLastName());
//        student.setEmail(form.getEmail());
//        student.setPassword(form.getPassword());
//        student.setPar1Email(form.getPar1Email());
//        student.setPar2Email(form.getPar2Email());
//        //studentDao.save(student);
//        log.info("In create student with incoming args");
//        return response;
//
//    }

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

            // we only want to do this code if the user has entered either a first name or a last name
            List<User> users = userDao.findByFirstNameOrLastName(firstName, lastName);

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
        ParentStudent parentStudent = new ParentStudent();
        parentStudent.setStudent(student);
        parentStudent.setParent(parent);

        parentStudentDao.save(parentStudent);

        return response;

    }
}
