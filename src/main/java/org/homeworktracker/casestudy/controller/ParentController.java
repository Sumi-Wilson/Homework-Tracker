package org.homeworktracker.casestudy.controller;

import lombok.extern.slf4j.Slf4j;
//import org.homeworktracker.casestudy.database.dao.ParentDAO;
//import org.homeworktracker.casestudy.database.dao.UserRoleDAO;
//import org.homeworktracker.casestudy.database.entity.Parent;
//import org.homeworktracker.casestudy.database.entity.UserRole;
//import org.homeworktracker.casestudy.formbean.CreateParentFormBean;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import java.util.List;
//
@Slf4j
@Controller
public class ParentController {

    @GetMapping("/parent/viewhomework")
    public ModelAndView viewHomework(){
        ModelAndView response = new ModelAndView("parent/viewhomework");
        log.info("In add homework with no args");
        return response;
    }
//
//    @Autowired
//    private ParentDAO parentDao;
//    @Autowired
//    private UserRoleDAO userRoleDao;
////    @GetMapping("/parent/signup")
////    public ModelAndView createParent(){
////        ModelAndView response = new ModelAndView("parent/signup");
////        log.info("In create parent with no args");
////        return response;
////    }
//
////    @GetMapping("/parent/signupSubmit")
////    public ModelAndView createParentSubmit(CreateParentFormBean form) {
////        ModelAndView response = new ModelAndView("parent/signup");
////        log.info("FirstName: " + form.getFirstName());
////        log.info("LastName: " + form.getLastName());
////        log.info("Email: " + form.getEmail());
////        log.info("Password: " + form.getPassword());
////        log.info("Student1Email: " + form.getStd1Email());
////        log.info("Student2Email: " + form.getStd2Email());
////        log.info("user Type : " + form.getUserType());
////
////        Parent parent = new Parent();
////        parent.setFirstName(form.getFirstName());
////        parent.setLastName(form.getLastName());
////        //encrypt the password
////        parent.setEmail(form.getEmail());
////        parent.setPassword(form.getPassword());
////        parent.setStudentEmail1(form.getStd1Email());
////        parent.setStudentEmail2(form.getStd2Email());
////        parent.setUserType(form.getUserType());
////
////        parent =parentDao.save(parent);
////        UserRole userRole = new UserRole();
////        userRole.setRoleName(form.getUserType());
////        userRole.setUserId(parent.getId());
////        userRoleDao.save(userRole);
////        log.info("In create parent with incoming args");
////        return response;
////
////    }
//
//    @GetMapping("/parent/display")
//    public ModelAndView displayParent(){
//        ModelAndView response = new ModelAndView("parent/display");
//        List<Parent> parents;
//        parents = parentDao.displayAll();
//        response.addObject("parents",parents);
//        for(Parent parent : parents) {
//            log.info("Parent Name : " + parent.getFirstName());
//        }
//        return response;
//    }
}
