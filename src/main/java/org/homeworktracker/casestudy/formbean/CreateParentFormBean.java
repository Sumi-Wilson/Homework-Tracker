package org.homeworktracker.casestudy.formbean;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

@Getter
@Setter
public class CreateParentFormBean {
    @NotEmpty(message = "First Name cannot be empty")
    private String firstName;

    @NotEmpty(message = "Last Name cannot be empty")
    private String lastName;

    @Email(message = "Email must be valid email address")
    @NotEmpty(message = "Email cannot be empty")
    private String email;

    @Length(min=8, message = "Password must be at least 8 characters long")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).*$", message = "Password must contain at least one lowercase letter, one uppercase letter, and one digit")
    private String password;

    @NotEmpty(message = "Student1 Email cannot be empty")
    private String std1Email;

    private String std2Email;

    private String userType;

}
