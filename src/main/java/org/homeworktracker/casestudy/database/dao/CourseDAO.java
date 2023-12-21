package org.homeworktracker.casestudy.database.dao;

import jakarta.transaction.Transactional;
import org.homeworktracker.casestudy.database.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CourseDAO extends JpaRepository<Course,Long> {
    @Transactional
    @Modifying
    @Query("DELETE FROM Course c WHERE LOWER(c.course) = LOWER(:courseName)")
    void deleteByCourse( String courseName);
    List<Course> findAll();
}

