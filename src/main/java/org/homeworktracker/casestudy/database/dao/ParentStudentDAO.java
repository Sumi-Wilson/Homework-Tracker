package org.homeworktracker.casestudy.database.dao;

import org.homeworktracker.casestudy.database.entity.Assignment;
import org.homeworktracker.casestudy.database.entity.ParentStudent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ParentStudentDAO extends JpaRepository<ParentStudent,Long> {
    List<ParentStudent> findByParentId(Integer parentId);
}
