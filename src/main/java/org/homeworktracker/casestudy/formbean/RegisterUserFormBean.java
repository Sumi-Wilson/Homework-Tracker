package org.homeworktracker.casestudy.formbean;

import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

@Getter
@Setter
public class RegisterUserFormBean {
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

   // @NotEmpty(message = " Confirm Password cannot be empty")
    private String confirmPassword;

    @NotEmpty(message = "Usertype cannot be empty")
    private String userType;

    @AssertTrue(message = "Password and Confirm Password must match")
    private boolean isPasswordMatch() {
        return password != null && password.equals(confirmPassword);
    }
}
