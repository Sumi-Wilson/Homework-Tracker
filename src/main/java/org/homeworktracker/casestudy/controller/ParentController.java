package org.homeworktracker.casestudy.controller;

import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.dao.AssignmentDAO;
import org.homeworktracker.casestudy.database.dao.ParentStudentDAO;
import org.homeworktracker.casestudy.database.entity.Assignment;
import org.homeworktracker.casestudy.database.entity.ParentStudent;
import org.homeworktracker.casestudy.database.entity.User;
import org.homeworktracker.casestudy.security.AuthenticatedUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
public class ParentController {

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    @Autowired
    private ParentStudentDAO parentStudentDao;

    @Autowired
    private AssignmentDAO assignmentDao;

    @GetMapping("/parent/viewhomework")
    public ModelAndView viewHomework(@RequestParam(required = false) Integer studentId){
        ModelAndView response = new ModelAndView("parent/viewhomework");
        log.info("In parent view homework with  args studentId");

        User parent = authenticatedUserService.loadCurrentUser();
        Integer parentId = parent.getId();
        log.info("Parent Id: " + parentId );

        List<ParentStudent> parentStudents = parentStudentDao.findByParentId(parentId);
        response.addObject("parentStudents",parentStudents);

        for(ParentStudent parentStudent : parentStudents){
            log.info("studentId: " + parentStudent.getStudent().getId());
        }

        List<Assignment> assignments = assignmentDao.findByStudentId(studentId);
        response.addObject("assignments",assignments);

        for(Assignment assignment : assignments){
            log.info("course Name: " + assignment.getCourse());
        }

        return response;
    }

}
