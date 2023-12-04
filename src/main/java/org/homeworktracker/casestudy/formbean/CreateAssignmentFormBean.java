package org.homeworktracker.casestudy.formbean;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class CreateAssignmentFormBean {
    private String course;
    private Date currentDate;
    private Integer daysLeft;
    private String  status;
    private String task;
    private Date dueDate;


}
