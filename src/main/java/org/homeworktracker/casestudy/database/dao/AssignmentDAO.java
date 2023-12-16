package org.homeworktracker.casestudy.database.dao;

import org.homeworktracker.casestudy.database.entity.Assignment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AssignmentDAO extends JpaRepository<Assignment,Long> {
}
