package org.homeworktracker.casestudy.controller;

import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.dao.NotificationDAO;
import org.homeworktracker.casestudy.database.entity.Notification;
import org.homeworktracker.casestudy.formbean.CreateNotificationFormBean;
import org.homeworktracker.casestudy.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;

@Slf4j
@Controller
public class NotificationController {
    @Autowired
    private NotificationService notificationService;
    @GetMapping("/notification/message")
    public ModelAndView createMessage(){
        ModelAndView response = new ModelAndView();
        response.setViewName("notification/message");
        return response;
    }

    @GetMapping("/notification/messageSubmit")
    public ModelAndView addMessage(CreateNotificationFormBean form) throws ParseException {
        ModelAndView response = new ModelAndView();
        response.setViewName("notification/message");
        Notification n = notificationService.createNotification(form);
        log.info("in notification message with arguments");
        response.addObject("successMessage", "Notification added successfully");
        return response;
    }
}
