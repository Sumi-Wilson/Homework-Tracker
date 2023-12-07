package org.homeworktracker.casestudy.database.dao;

import org.homeworktracker.casestudy.database.entity.Notification;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NotificationDAO extends JpaRepository<Notification,Long> {

}
