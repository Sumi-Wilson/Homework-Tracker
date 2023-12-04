package org.homeworktracker.casestudy.controller;

import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.dao.AssignmentDAO;
import org.homeworktracker.casestudy.database.entity.Assignment;
import org.homeworktracker.casestudy.formbean.CreateAssignmentFormBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Slf4j
public class AssignmentController {
    @Autowired
    private AssignmentDAO assignmentDao;
    @GetMapping("/student/assignment")
    public ModelAndView studentAssignment(){
        ModelAndView response = new ModelAndView("student/studentview");
        log.info("In student assignment with no args");
        return response;
    }
    @GetMapping("/student/assignmentAdd")
    public ModelAndView studentAssignmentAdd(CreateAssignmentFormBean form){
        ModelAndView response = new ModelAndView("student/studentview");
        log.info("course: " + form.getCourse());
        Assignment assignment = new Assignment();
        assignment.setCourse(form.getCourse());
        assignment.setHomework(form.getTask());
        assignment.setDaysLeft(form.getDaysLeft());
        assignment.setStatus(form.getStatus());
        assignment.setDueDate(form.getDueDate());
        assignment.setCreatedDate(form.getCurrentDate());
        return response;

    }
}
