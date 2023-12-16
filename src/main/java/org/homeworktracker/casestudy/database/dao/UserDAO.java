package org.homeworktracker.casestudy.database.dao;

import org.homeworktracker.casestudy.database.entity.User;
import org.homeworktracker.casestudy.database.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserDAO extends JpaRepository<User, Long> {
    public User findByEmailIgnoreCase(String email);

//    @Query("SELECT u FROM User u WHERE u.userType='Parent' AND (u.firstName LIKE :firstName or u.lastName LIKE :lastName)")
//    List<User> findByFirstNameOrLastName(String firstName,String lastName);

    @Query("SELECT u FROM User u WHERE u.userType = 'Parent' AND (LOWER(u.firstName) LIKE LOWER(:firstName) OR LOWER(u.lastName) LIKE LOWER(:lastName))")
    List<User> findByFirstNameOrLastName( String firstName, String lastName);

    public User findById(Integer parentId);

}