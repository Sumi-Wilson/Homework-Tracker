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

import java.util.Date;
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
    public ModelAndView viewHomework(@RequestParam(required = false) Integer studentId,
                                     @RequestParam(required = false) String sortBy){
        ModelAndView response = new ModelAndView("parent/viewhomework");
        log.info("In parent view homework with  args studentId");

        User parent = authenticatedUserService.loadCurrentUser();
        Integer parentId = parent.getId();
        log.info("Parent Id: " + parentId );

        List<ParentStudent> parentStudents = parentStudentDao.findByParentId(parentId);
        response.addObject("parentStudents",parentStudents);

        // Pass the studentId to the view
        response.addObject("studentId", studentId);

        for(ParentStudent parentStudent : parentStudents){
            log.info("studentId: " + parentStudent.getStudent().getId());
        }

        //List<Assignment> assignments = assignmentDao.findByStudentId(studentId);
        List<Assignment> assignments;


        // Check if sorting parameter is provided and fetch assignments accordingly
        if("course".equals(sortBy)){
            assignments = assignmentDao.findByStudentIdOrderByDueCourse(studentId);
        } else if ("dueDate".equals(sortBy)) {
            assignments = assignmentDao.findByStudentIdOrderByDueDate(studentId);
        } else if ("status".equals(sortBy)) {
            assignments = assignmentDao.findByStudentIdOrderByStatus(studentId);
        }else{
            assignments = assignmentDao.findByStudentId(studentId);
        }

        for(Assignment assignment : assignments){
            log.info("course Name: " + assignment.getCourse());

            // Check if the status is "To do" or "In Progress" and due date is in the past and update status to overdue"
            if (("To Do".equals(assignment.getStatus()) || "In-Progress".equals(assignment.getStatus()))
                    && assignment.getDueDate() != null && assignment.getDueDate().before(new Date())) {
                assignment.setStatus("Overdue");
            }

        }
        response.addObject("assignments",assignments);

        return response;
    }

}
