package org.homeworktracker.casestudy.formbean;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CreateCourseFormBean {

    @NotEmpty(message = "Course cannot be empty")
    private String courseName;


}
