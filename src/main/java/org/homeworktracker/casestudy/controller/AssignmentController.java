package org.homeworktracker.casestudy.controller;

import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.dao.AssignmentDAO;
import org.homeworktracker.casestudy.database.entity.Assignment;
import org.homeworktracker.casestudy.database.entity.User;
import org.homeworktracker.casestudy.formbean.CreateAssignmentFormBean;
import org.homeworktracker.casestudy.security.AuthenticatedUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@Slf4j
public class AssignmentController {
    @Autowired
    private AssignmentDAO assignmentDao;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    @GetMapping("/student/assignment")
    public ModelAndView studentAssignment(){
        ModelAndView response = new ModelAndView("student/studentview");
        log.info("In student assignment with no args");
        return response;
    }
    @GetMapping("/student/assignmentAdd")
    public ModelAndView studentAssignmentAdd(CreateAssignmentFormBean form) throws ParseException {
        ModelAndView response = new ModelAndView("student/studentview");
        log.info("course: " + form.getCourse());

        Assignment assignment = new Assignment();
        assignment.setCourse(form.getCourse());
        assignment.setHomework(form.getTask());
        assignment.setStatus ("Not Started");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date dueDate = formatter.parse(form.getDueDate());
        assignment.setDueDate(dueDate);
        assignment.setCreatedDate(new Date());

        User student = authenticatedUserService.loadCurrentUser();
        assignment.setStudent(student);

        assignmentDao.save(assignment);

        return response;

    }
}
