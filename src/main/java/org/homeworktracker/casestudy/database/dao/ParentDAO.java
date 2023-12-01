package org.homeworktracker.casestudy.database.dao;

import org.homeworktracker.casestudy.database.entity.Parent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ParentDAO extends JpaRepository<Parent,Long> {
    @Query("SELECT p FROM Parent p")
    List<Parent> displayAll();



}
