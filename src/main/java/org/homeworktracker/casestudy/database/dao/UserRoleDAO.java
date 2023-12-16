package org.homeworktracker.casestudy.database.dao;

import org.homeworktracker.casestudy.database.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserRoleDAO extends JpaRepository<UserRole, Long> {

    public List<UserRole> findByUserId(Integer userId);


}