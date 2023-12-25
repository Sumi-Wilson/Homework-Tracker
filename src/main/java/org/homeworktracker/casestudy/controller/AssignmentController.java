package org.homeworktracker.casestudy.controller;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.homeworktracker.casestudy.database.dao.AssignmentDAO;
import org.homeworktracker.casestudy.database.dao.CourseDAO;
import org.homeworktracker.casestudy.database.entity.Assignment;
import org.homeworktracker.casestudy.database.entity.Course;
import org.homeworktracker.casestudy.database.entity.User;
import org.homeworktracker.casestudy.formbean.CreateAssignmentFormBean;
import org.homeworktracker.casestudy.security.AuthenticatedUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@Slf4j
public class AssignmentController {
    @Autowired
    private AssignmentDAO assignmentDao;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;
    @Autowired
    private CourseDAO courseDao;

    @GetMapping("/student/assignment")
    public ModelAndView studentAssignment(){
        ModelAndView response = new ModelAndView("student/studentview");
        log.info("In student assignment with no args");
        return response;
    }
    @GetMapping("/student/assignmentAdd")
    public ModelAndView studentAssignmentAdd(@Valid CreateAssignmentFormBean form,BindingResult bindingResult) throws ParseException {
        ModelAndView response = new ModelAndView("student/studentview");
        log.info("in assignment add with form bean argument ");

        //Checking validations
        if (bindingResult.hasErrors()) {
            log.info(" In assignmentAdd has errors ");

            for (ObjectError error : bindingResult.getAllErrors()) {
                log.info("error: " + error.getDefaultMessage());
            }
            response.addObject("form", form);
            response.addObject("errors", bindingResult);
            return response;
        }


        Assignment assignment = assignmentDao.findById(form.getId());
        //Edit
        if (assignment != null) {


            assignment.setCourse(form.getCourse());
            assignment.setHomework(form.getHomework());
            assignment.setStatus(form.getStatus());
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date dueDate = formatter.parse(form.getDueDate());
            assignment.setDueDate(dueDate);

            assignmentDao.save(assignment);

            response.setViewName("redirect:/student/studentview?success=Homework updated successfully");
            //Save a new assignment
        } else {

            Assignment newAssignment = new Assignment();
            newAssignment.setCourse(form.getCourse());
            newAssignment.setHomework(form.getHomework());
            newAssignment.setStatus(form.getStatus());
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date dueDate = formatter.parse(form.getDueDate());
            newAssignment.setDueDate(dueDate);
            newAssignment.setCreatedDate(new Date());

            User student = authenticatedUserService.loadCurrentUser();
            newAssignment.setStudent(student);

            assignmentDao.save(newAssignment);

            response.setViewName("redirect:/student/studentview" + "?success=Homework added successfully");

            // response.addObject("successMessage", "Homework added successfully");
        }
        return response;

    }

    @GetMapping("/student/assignmentEdit/{id}")
    public ModelAndView editAssignment(@PathVariable int id){
        ModelAndView response = new ModelAndView("student/studentview");

        List<Course> courses = courseDao.findAll();
        response.addObject("courses",courses);

        Assignment assignment = assignmentDao.findById(id);

        CreateAssignmentFormBean form = new CreateAssignmentFormBean();

        if(assignment != null){

            form.setId(assignment.getId());
            form.setCourse(assignment.getCourse());
            form.setHomework(assignment.getHomework());
            form.setStatus(assignment.getStatus());

            if (assignment.getDueDate() != null) {
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String dueDateString = formatter.format(assignment.getDueDate());
                form.setDueDate(dueDateString);
            } else {
                log.warn("Due date is null for Assignment with id: " + id);
            }
            response.addObject("form", form);
        } else {
            log.warn("Homework with id: " + id + " was not found");
        }

        return response;
    }
}
