package org.homeworktracker.casestudy.database.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "user_roles")
public class UserRole {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

  @Column(name = "user_id")
  private Integer userId;

//    @OneToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "user_id")
//    private User user;

    @Column(name = "role_name")
    private String roleName;



}
