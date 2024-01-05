package org.homeworktracker.casestudy.database.dao;

import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.entity.UserRole;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
public class UserRoleDAOTest {
    @Autowired UserRoleDAO userRoleDAO;

    @Test
    public void findByUserIdTest(){
        //given
        int userId = 18;

        //when
        List<UserRole> userRoles = userRoleDAO.findByUserId(userId);

        //then
        Assertions.assertFalse(userRoles.isEmpty(),"No user roles found for the given user ID");


    }


}
