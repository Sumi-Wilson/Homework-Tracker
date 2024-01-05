package org.homeworktracker.casestudy.database.dao;

import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.entity.User;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
@Slf4j
@SpringBootTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UserDAOTest {
    @Autowired UserDAO userDAO;

    @Test
    @Order(1)
    public void createUserTest(){
        //given
        User user = new User();
        user.setFirstName("Test First 12345");
        user.setLastName("Test Last");
        user.setEmail("Test@gmail.com");
        user.setPassword("Testpassword1");
        user.setUserType("Parent");

        //when
        user = userDAO.save(user);

        //Then
        Assertions.assertNotNull(user.getId());
        Assertions.assertEquals("Test First 12345",user.getFirstName());
        Assertions.assertEquals("Test Last",user.getLastName());
        Assertions.assertEquals("Test@gmail.com",user.getEmail());
        Assertions.assertEquals("Testpassword1",user.getPassword());
        Assertions.assertEquals("Parent",user.getUserType());

        log.info("Customer creation test passed successfully");

    }
    @Test
    @Order(2)
    public void findByFirstNameAndLastName(){
        //given
        String firstName = "Test First 12345";

        //when
        List<User> users = userDAO.findByFirstNameAndLastName(firstName,null);

        //then
        Assertions.assertEquals(1,users.size());

        User user = users.get(0);
        Assertions.assertNotNull(user.getId());
        Assertions.assertEquals("Test First 12345",user.getFirstName());
        Assertions.assertEquals("Test Last",user.getLastName());
        Assertions.assertEquals("Test@gmail.com",user.getEmail());
        Assertions.assertEquals("Testpassword1",user.getPassword());
        Assertions.assertEquals("Parent",user.getUserType());

        log.info("User search test passed successfully");

    }

    @Test
    @Order(3)
    public void findbyEmailIgnoreCaseTest(){
        //given
        String email = "Test@gmail.com";

        //when
        User foundUser = userDAO.findByEmailIgnoreCase(email);

        //then
        Assertions.assertEquals("Test@gmail.com",foundUser.getEmail());

        log.info("Find by email test passed successfully");
    }

    @Test
    @Order(4)
    public void countByEmailTest(){
        //given
        String email = "Test@gmail.com";

        //when
        Integer count = userDAO.countByEmail(email);

        //then
        Assertions.assertEquals(1,count);

        log.info("Count by email test passed successfully");

    }

    @Test
    @Order(5)
    public void findByIdTest(){
        //given
        Integer id = 1;

        //when
        User foundUser = userDAO.findById(1);

        //Then
        Assertions.assertEquals("Parent",foundUser.getUserType());

        log.info("Find by id test passed successfully");

    }



}
