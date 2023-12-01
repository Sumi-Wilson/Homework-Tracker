package org.homeworktracker.casestudy.controller;

import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.dao.StudentDAO;
import org.homeworktracker.casestudy.database.entity.Student;
import org.homeworktracker.casestudy.formbean.CreateStudentFormBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
public class StudentController {
    @Autowired
    private StudentDAO studentDao;
    @GetMapping ("/student/signup")
    public ModelAndView createStudent(){
        ModelAndView response = new ModelAndView("student/signup");
        log.info("In create student with no args");
        return response;
    }

    @GetMapping("/student/signupSubmit")
    public ModelAndView createStudentSubmit(CreateStudentFormBean form){
        ModelAndView response = new ModelAndView("student/signup");
        log.info("FirstName: " + form.getFirstName());
        log.info("LastName: " + form.getLastName());
        log.info("Emailid: " + form.getEmail());

        Student student = new Student();
        student.setFirstName(form.getFirstName());
        student.setLastName(form.getLastName());
        student.setEmail(form.getEmail());
        student.setPassword(form.getPassword());
        student.setPar1Email(form.getPar1Email());
        student.setPar2Email(form.getPar2Email());
        studentDao.save(student);
        log.info("In create student with incoming args");
        return response;

    }




}
