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

}
