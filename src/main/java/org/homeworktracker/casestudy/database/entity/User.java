package org.homeworktracker.casestudy.database.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "users")
@Getter
@Setter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

//    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY,cascade = CascadeType.ALL)
//    private List<Assignment> assignments;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "user_type")
    private String userType;



//    @OneToOne(mappedBy = "assignment", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    private UserRole userRole;
}
