package org.homeworktracker.casestudy.database.dao;

import org.homeworktracker.casestudy.database.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CourseDAO extends JpaRepository<Course,Long> {
//    @Modifying
//    @Query("DELETE FROM Course c WHERE c.course = :course")
    void deleteByCourse(String courseName);
}

