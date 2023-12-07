package org.homeworktracker.casestudy.service;

import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.dao.NotificationDAO;
import org.homeworktracker.casestudy.database.entity.Notification;
import org.homeworktracker.casestudy.formbean.CreateNotificationFormBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Slf4j
@Service
public class NotificationService {
    @Autowired
    private NotificationDAO notificationDao;
    public Notification createNotification(CreateNotificationFormBean form) throws ParseException {
        log.info("message: " + form.getMessage());
        log.info("expiry date " + form.getExpiryDate());
        Notification notification = new Notification();
        notification.setMessage(form.getMessage());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date expiryDate = formatter.parse(form.getExpiryDate());
        notification.setExpiryDate(expiryDate);
        return notificationDao.save(notification);


    }
}
