package org.homeworktracker.casestudy.formbean;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class CreateAssignmentFormBean {
    private Integer id;
    @NotEmpty(message = "Course cannot be empty")
    private String course;
    @NotEmpty(message = "Status cannot be empty")
    private String  status;
    @NotEmpty(message = "Homework cannot be empty")
    private String homework;
    @NotEmpty(message = "Due date Cannot be empty")
    private String dueDate;


}
