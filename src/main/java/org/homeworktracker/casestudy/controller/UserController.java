package org.homeworktracker.casestudy.controller;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
//import org.homeworktracker.casestudy.database.dao.ParentDAO;
import org.homeworktracker.casestudy.database.dao.UserDAO;
import org.homeworktracker.casestudy.database.entity.User;
import org.homeworktracker.casestudy.formbean.RegisterUserFormBean;
import org.homeworktracker.casestudy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserDAO userDao;

    @GetMapping("/user/signup")
    public ModelAndView createParent() {
        ModelAndView response = new ModelAndView("user/signup");
        log.info("In user signup with no args");
        return response;
    }

    @GetMapping("/user/signupSubmit")
    public ModelAndView createCustomerSubmit(@Valid RegisterUserFormBean form, BindingResult bindingResult) {
        log.info(" in user signupSubmit ");
        if (bindingResult.hasErrors()) {
            log.info(" In user signupSubmit- has errors ");
            ModelAndView response = new ModelAndView("user/signup");
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.info("error: " + error.getDefaultMessage());
            }
            response.addObject("form", form);
            response.addObject("errors", bindingResult);
            return response;

        }
        log.info("  in user signupSubmit no error found");
        User u = userService.createUser(form);
        ModelAndView response = new ModelAndView();
        response.setViewName("redirect:/");
        log.info("In user signupSubmit with incoming args");
        return response;

    }

}
