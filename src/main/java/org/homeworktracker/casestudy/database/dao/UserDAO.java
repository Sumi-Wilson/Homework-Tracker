package org.homeworktracker.casestudy.database.dao;

import org.homeworktracker.casestudy.database.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDAO extends JpaRepository<User, Long> {
    public User findByEmailIgnoreCase(String email);



}