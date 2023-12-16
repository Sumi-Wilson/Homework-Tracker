package org.homeworktracker.casestudy.database.dao;

import org.homeworktracker.casestudy.database.entity.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NotificationDAO extends JpaRepository<Notification,Long> {

}
