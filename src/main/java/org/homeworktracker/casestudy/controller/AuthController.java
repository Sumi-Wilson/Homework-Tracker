package org.homeworktracker.casestudy.controller;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.entity.User;
import org.homeworktracker.casestudy.formbean.RegisterUserFormBean;
import org.homeworktracker.casestudy.security.AuthenticatedUserService;
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
    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    @GetMapping("/auth/login")
    public ModelAndView login() {
        ModelAndView response = new ModelAndView();
        response.setViewName("auth/login");
        return response;
    }

    @GetMapping("/auth/register")
    public ModelAndView register(){
        ModelAndView response = new ModelAndView();
        response.setViewName("auth/register");
        return response;
    }

    @GetMapping("/auth/registerSubmit")
    public ModelAndView createCustomerSubmit(@Valid RegisterUserFormBean form, BindingResult bindingResult, HttpSession session) {
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
        authenticatedUserService.authenticateNewUser(session,u.getEmail(),form.getPassword());
        ModelAndView response = new ModelAndView();
        response.setViewName("redirect:/");
        log.info("In create customer with incoming args");
        return response;

    }
}
