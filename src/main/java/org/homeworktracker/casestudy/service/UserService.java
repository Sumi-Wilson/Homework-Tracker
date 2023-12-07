package org.homeworktracker.casestudy.service;

import lombok.extern.slf4j.Slf4j;
import org.hibernate.validator.internal.util.stereotypes.Lazy;
import org.homeworktracker.casestudy.database.dao.UserDAO;
import org.homeworktracker.casestudy.database.entity.User;
import org.homeworktracker.casestudy.formbean.RegisterUserFormBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Slf4j
@Service

public class UserService {
    @Autowired
    private UserDAO userDao;
    @Lazy
    @Autowired
    private PasswordEncoder passwordEncoder;
    public User createUser(RegisterUserFormBean form){
        User user= new User();
        user.setEmail(form.getEmail());

        String encoded = passwordEncoder.encode(form.getPassword());
        log.debug("Encoded password: " + encoded);
        user.setPassword(encoded);
        return userDao.save(user);

    }

}
