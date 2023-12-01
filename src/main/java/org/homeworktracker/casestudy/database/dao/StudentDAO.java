package org.homeworktracker.casestudy.database.dao;

import org.homeworktracker.casestudy.database.entity.Parent;
import org.homeworktracker.casestudy.database.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentDAO  extends JpaRepository<Student,Long> {
}
