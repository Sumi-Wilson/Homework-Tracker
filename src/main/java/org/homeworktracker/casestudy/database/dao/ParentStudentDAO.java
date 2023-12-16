package org.homeworktracker.casestudy.database.dao;

import org.homeworktracker.casestudy.database.entity.ParentStudent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ParentStudentDAO extends JpaRepository<ParentStudent,Long> {
}
