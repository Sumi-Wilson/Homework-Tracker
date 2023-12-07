package org.homeworktracker.casestudy.formbean;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class CreateAssignmentFormBean {
    private String course;
    private String  status;
    private String task;
    private String dueDate;


}
