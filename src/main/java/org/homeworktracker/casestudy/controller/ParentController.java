package org.homeworktracker.casestudy.controller;

import jakarta.servlet.http.HttpSession;
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
    public ModelAndView viewHomework(HttpSession session,
                                     @RequestParam(required = false) Integer studentId,
                                     @RequestParam(required = false) String sortBy) {
        ModelAndView response = new ModelAndView("parent/viewhomework");
        log.info("In parent view homework with  args studentId");

        User parent = authenticatedUserService.loadCurrentUser();
        Integer parentId = parent.getId();
        log.info("Parent Id: " + parentId);

        //Finds the list of students associated with the parent
        List<ParentStudent> parentStudents = parentStudentDao.findByParentId(parentId);
        response.addObject("parentStudents", parentStudents);

        // Pass the studentId to the view
        response.addObject("studentId", studentId);

        for (ParentStudent parentStudent : parentStudents) {
            log.info("studentId: " + parentStudent.getStudent().getId());
        }

        //List<Assignment> assignments = assignmentDao.findByStudentId(studentId);
        List<Assignment> assignments;

         //Toggle logic for sorting order
        boolean sortOrderAsc = true;
        if (session.getAttribute("sortOrderAsc") != null) {
            sortOrderAsc = (boolean) session.getAttribute("sortOrderAsc");
        }

        // Fetch assignments based on the specified sorting criteria
        if ("course".equals(sortBy)) {
            // If sorting by course, apply ascending or descending order based on sortOrderAsc
            assignments = sortOrderAsc ?
                    assignmentDao.findByStudentIdOrderByDueCourseAsc(studentId) :
                    assignmentDao.findByStudentIdOrderByDueCourseDesc(studentId);
        } else if ("dueDate".equals(sortBy)) {
            // If sorting by due date, fetch assignments ordered by due date
            assignments = sortOrderAsc ?
                    assignmentDao.findByStudentIdOrderByDueDateAsc(studentId):
                    assignmentDao.findByStudentIdOrderByDueDateDesc(studentId);
        } else if ("status".equals(sortBy)) {
            // If sorting by status, fetch assignments ordered by status
            assignments = sortOrderAsc ?
                    assignmentDao.findByStudentIdOrderByStatus(studentId):
                    assignmentDao.findByStudentIdOrderByStatusDesc(studentId);
        } else {
            // If no specific sorting criteria is provided, fetch assignments without any specific order
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
        sortOrderAsc = !sortOrderAsc;

        response.addObject("assignments",assignments);

        session.setAttribute("sortOrderAsc", sortOrderAsc);

        return response;
    }

}
