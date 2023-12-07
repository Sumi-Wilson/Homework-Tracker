package org.homeworktracker.casestudy.controller;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.entity.User;
import org.homeworktracker.casestudy.formbean.RegisterUserFormBean;
import org.homeworktracker.casestudy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
public class AuthController {
    @Autowired
    private UserService userService;

    @GetMapping("/auth/login")
    public ModelAndView login() {
        ModelAndView respnse = new ModelAndView();
        respnse.setViewName("auth/login");
        return respnse;
    }

    @GetMapping("/auth/register")
    public ModelAndView register(){
        ModelAndView response = new ModelAndView();
        response.setViewName("auth/register");
        return response;
    }

    @GetMapping("/auth/registerSubmit")
    public ModelAndView createCustomerSubmit(@Valid RegisterUserFormBean form, BindingResult bindingResult) {
        log.info("$$$$$ in auth registerSubmit $$$$$");
        if (bindingResult.hasErrors()) {
            log.info("######################### In registerSubmit- has errors #########################");
            ModelAndView response = new ModelAndView("auth/register");
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.info("error: " + error.getDefaultMessage());
            }
            response.addObject("form", form);
            response.addObject("errors", bindingResult);
            return response;
        }
        log.info("  in Create customer no error found");
        User u = userService.createUser(form);
        ModelAndView response = new ModelAndView();
        response.setViewName("redirect:/");
        log.info("In create customer with incoming args");
        return response;

    }
}
